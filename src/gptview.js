import React, { useEffect, useState, useRef } from "react";
import { useWebSocket } from "./hooks";
import impress from "impress.js";
import "./Impress.css"; // include the necessary CSS here

const HistoryTree = () => {
    const [messageHistory, setMessageHistory] = useState([]);

    const wsMessage = useWebSocket(process.env.REACT_APP_WS_ENDPOINT);
    const impressDivRef = useRef(null);

    useEffect(() => {
        if (wsMessage !== null) {
            setMessageHistory((prevHistory) => [
                ...prevHistory,
                ...wsMessage.history,
            ]);
        }
    }, [wsMessage]);

    useEffect(() => {
        if (impressDivRef.current) {
            impress().init(); // initialize Impress.js when the component mounts
        }
    }, []);

    // helper function to handle array content
    const handleContent = (content, index, role) => {
        if (Array.isArray(content)) {
            return content.map((item, i) => (
                <div
                    key={`${index}-${i}`}
                    className="step"
                    data-x={500 * i}
                    data-y={-500 * index}
                    data-z={0}
                    data-scale="1"
                >
                    <div className={`message ${role}`}>{item}</div>
                </div>
            ));
        } else {
            return (
                <div
                    key={index}
                    className="step"
                    data-x={0}
                    data-y={-500 * index}
                    data-z={0}
                    data-scale="1"
                >
                    <div className={`message ${role}`}>{content}</div>
                </div>
            );
        }
    };

    return (
        <div id="impress" ref={impressDivRef}>
            {messageHistory.flatMap((message, index) =>
                handleContent(message.content, index, message.role)
            )}
        </div>
    );
};

export default HistoryTree;
