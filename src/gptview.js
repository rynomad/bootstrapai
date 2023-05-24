import React, { useEffect, useState } from "react";
import { Tree, TreeNode } from "react-d3-tree";
import { useWebSocket } from "./hooks";

const CardNode = ({ nodeDatum, toggleNode, foreignObjectProps }) => {
    return (
        <g>
            <circle r={15}></circle>
            <foreignObject {...foreignObjectProps}>
                <div
                    style={{
                        border: "1px solid gray",
                        borderRadius: "5px",
                        padding: "10px",
                        backgroundColor: "white",
                        color: "black",
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center",
                    }}
                >
                    <h3 style={{ textAlign: "center" }}>{nodeDatum.name}</h3>
                    {nodeDatum.children && (
                        <button style={{ width: "100%" }} onClick={toggleNode}>
                            {nodeDatum.__rd3t.collapsed ? "Expand" : "Collapse"}
                        </button>
                    )}
                </div>
            </foreignObject>
        </g>
    );
};

const HistoryTree = () => {
    const [treeData, setTreeData] = useState([{ name: "Root", children: [] }]);
    const wsMessage = useWebSocket(process.env.REACT_APP_WS_ENDPOINT);

    useEffect(() => {
        if (wsMessage !== null) {
            const newHistory = [...wsMessage.history];
            setTreeData((prevData) => {
                const data = [...prevData];
                const traverse = (node, history) => {
                    if (history.length === 0) return;
                    const message = history[0];
                    let childNode;
                    if (Array.isArray(message.content)) {
                        childNode = message.content.map((content) => ({
                            name: `${message.role}: ${content}`,
                            children: [],
                        }));
                    } else {
                        childNode = {
                            name: `${message.role}: ${message.content}`,
                            children: [],
                        };
                    }
                    if (node.children) node.children.push(childNode);
                    traverse(childNode, history.slice(1));
                };
                traverse(data[0], newHistory);
                return data;
            });
        }
    }, [wsMessage]);

    return (
        <div style={{ height: "100vh", width: "100%" }}>
            <Tree
                data={treeData}
                pathFunc="step"
                orientation="vertical"
                renderCustomNodeElement={(rd3tProps) => (
                    <CardNode
                        {...rd3tProps}
                        foreignObjectProps={{ width: 150, height: 200 }}
                    />
                )}
            />
        </div>
    );
};

export default HistoryTree;
