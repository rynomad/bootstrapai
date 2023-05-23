import { useState, useEffect } from "react";

export const useWebSocket = (url) => {
    const [message, setMessage] = useState(null);

    useEffect(() => {
        const ws = new WebSocket(url);

        ws.onopen = () => {
            console.log("connected");
        };

        ws.onmessage = (evt) => {
            console.log("ws.onmessage", evt);
            const message = JSON.parse(evt.data);
            console.log("ws.onmessage", message);
            setMessage(message);
        };

        ws.onclose = () => {
            console.log("disconnected");
        };

        return () => {
            ws.close();
        };
    }, [url]);

    return message;
};
