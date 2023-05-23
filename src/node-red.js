import "./index.css";
import { useState, useEffect } from "react";
import { createClient } from "@supabase/supabase-js";
import { Auth } from "@supabase/auth-ui-react";
import { ThemeSupa } from "@supabase/auth-ui-shared";
import { WebContainer } from "@webcontainer/api";
import pkg from "./node-red/package.json";
import ReactLoading from "react-loading";
import Config from "./config";
window.addEventListener("keydown", function (e) {
    if (e.key === "F5" || (e.ctrlKey && e.key === "r")) {
        // This is for 'ctrl + r'
        e.preventDefault();
        const frame = document.querySelector("#node-red-iframe");
        // eslint-disable-next-line no-self-assign
        frame.src = frame.src;
        // Your code here
    }
});

const styles = {
    container: {
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        height: "100vh",
        padding: "0 20px",
        boxSizing: "border-box",
    },
    authContainer: {
        maxWidth: "600px",
        width: "100%",
        padding: "20px",
        border: "1px solid #ddd",
        borderRadius: "5px",
    },
    loadingContainer: {
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
    },
};
const supabase = (window.supabase = createClient(
    process.env.REACT_APP_SUPABASE_URL,
    process.env.REACT_APP_SUPABASE_ANON_KEY
));

const startContainer = async (session) => {
    // Call only once
    const webcontainerInstance = (window.webcontainerInstance =
        await WebContainer.boot({
            workdirName: "node-red",
        }));

    pkg.scripts["node-red"] = [
        `SUPABASE_URL=${process.env.REACT_APP_SUPABASE_URL}`,
        `SUPABASE_KEY=${process.env.REACT_APP_SUPABASE_ANON_KEY}`,
        `SUPABASE_ACCESS_TOKEN=${session.access_token}`,
        `SUPABASE_REFRESH_TOKEN=${session.refresh_token}`,
        `node-red`,
        `--userDir`,
        `./`,
    ].join(" ");

    await webcontainerInstance.mount({
        "package.json": {
            file: {
                contents: JSON.stringify(pkg),
            },
        },
    });

    await webcontainerInstance.fs.mkdir("cache");

    await fetchAndWriteFiles(webcontainerInstance);

    let installProcess = await webcontainerInstance.spawn("yarn");
    installProcess.output.pipeTo(
        new WritableStream({
            write(data) {
                console.log(data);
            },
        })
    );

    // installProcess.

    await installProcess.exit;

    installProcess = await webcontainerInstance.spawn("yarn", ["untar"]);
    installProcess.output.pipeTo(
        new WritableStream({
            write(data) {
                console.log(data);
            },
        })
    );

    await installProcess.exit;

    installProcess = await webcontainerInstance.spawn("yarn", ["local"]);
    installProcess.output.pipeTo(
        new WritableStream({
            write(data) {
                console.log(data);
            },
        })
    );

    await installProcess.exit;

    const container = webcontainerInstance;

    const runProcess = await container.spawn("npm", ["run", "node-red"]);

    // Wait for `server-ready` event

    runProcess.output.pipeTo(
        new WritableStream({
            write(data) {
                console.log(data);
            },
        })
    );

    container.on("error", (e) => {
        console.log(e);
    });

    return new Promise((resolve) => {
        container.on("server-ready", async (port, url) => {
            resolve(url);
        });
    });
};

const fetchAndWriteFiles = async (container) => {
    // Array of files to fetch and write
    const files = [
        {
            url: "/node-red/node-red-contrib-chatgpt-1.4.2.tgz",
            path: "node-red-contrib-chatgpt-1.4.2.tgz",
        },
        {
            url: "/node-red/untar.js",
            path: "untar.js",
        },
        {
            url: "/node-red/node-red-contrib-supabase-storage-0.0.1.tgz",
            path: "node-red-contrib-supabase-storage-0.0.1.tgz",
        },
        {
            url: "/node-red/settings.js",
            path: "settings.js",
        },
    ];

    // Fetch and write each file
    for (const file of files) {
        try {
            const response = await fetch(file.url);
            const blob = await response.blob();
            console.log(file, blob);
            // Convert the Blob to ArrayBuffer
            const arrayBuffer = await new Response(blob).arrayBuffer();

            // Write the file to the virtual file system
            await container.fs.writeFile(
                file.path,
                new Uint8Array(arrayBuffer),
                { encoding: "buffer" }
            );

            console.log(`File ${file.path} has been written successfully.`);
        } catch (error) {
            console.error(`Error writing file ${file.path}:`, error);
        }
    }
};

export default function NodeRed() {
    const [session, setSession] = useState(null);
    const [url, setUrl] = useState(null);
    const [doneConfigCheck, setDoneConfigCheck] = useState(false);

    useEffect(() => {
        supabase.auth.getSession().then(({ data: { session } }) => {
            setSession(session);
        });

        const {
            data: { subscription },
        } = supabase.auth.onAuthStateChange((_event, session) => {
            setSession(session);
        });

        return () => subscription.unsubscribe();
    }, []);

    useEffect(() => {
        if (session) {
            (async () => {
                const url = await startContainer(session);
                await new Promise((r) => setTimeout(r, 1000));
                setUrl(url);
            })();
        }
    }, [session]);

    console.log("session", session);

    if (!session) {
        return (
            <div style={styles.container}>
                <div style={styles.authContainer}>
                    <Auth
                        supabaseClient={supabase}
                        appearance={{ theme: ThemeSupa }}
                        providers={[]}
                    />
                </div>
            </div>
        );
    } else if (!doneConfigCheck) {
        return (
            <div style={{ ...styles.container, ...styles.loadingContainer }}>
                <ReactLoading type={"bars"} color={"#888"} />
                <p>Loading...</p>
                <Config
                    supabase={supabase}
                    userId={session.user.id}
                    onComplete={() => setDoneConfigCheck(true)}
                />
            </div>
        );
    } else if (!url) {
        return (
            <div style={{ ...styles.container, ...styles.loadingContainer }}>
                <ReactLoading type={"bars"} color={"#888"} />
                <p>Loading...</p>
            </div>
        );
    } else {
        return (
            <iframe
                id={"node-red-iframe"}
                style={{
                    position: "absolute",
                    top: 0,
                    left: 0,
                    width: "100vw",
                    height: "100vh",
                    margin: 0,
                    padding: 0,
                    border: "none",
                    boxSizing: "border-box",
                }}
                title="node-red"
                src={url}
            ></iframe>
        );
    }
}
