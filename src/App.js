import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import MainPage from "./node-red"; // import your main page component
import HistoryTree from "./gptview";

function App() {
    return (
        <Router>
            <Routes>
                <Route path="/" element={<MainPage />} />
                <Route path="/history" element={<HistoryTree />} />
            </Routes>
        </Router>
    );
}

export default App;
