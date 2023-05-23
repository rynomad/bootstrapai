import React, { useState, useEffect } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import { Modal, Button, FormControl } from "react-bootstrap";

const DataChecker = ({ supabase, userId, onComplete }) => {
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [apiKey, setApiKey] = useState("");

    useEffect(() => {
        const checkData = async () => {
            let { data: credentialsData, error: credentialsError } =
                await supabase
                    .from("credentials")
                    .select("data")
                    .eq("user_id", userId)
                    .single();

            if (credentialsError || !credentialsData || !credentialsData.data) {
                console.log("creds", credentialsData, credentialsError);
                setIsModalOpen(true);
                return;
            }

            // if data and password exist
            onComplete();
        };

        checkData();
    }, [supabase, userId, onComplete]);

    const handleSave = async () => {
        // Handle the logic to save password and apiKey here
        const { error } = await supabase
            .from("credentials")
            .update({
                data: btoa(`{"1d0773bcf3416404":{"API_KEY":"${apiKey}"}}`),
            })
            .eq("user_id", userId);

        console.log("error", error);

        setIsModalOpen(false);
        onComplete();
    };

    return (
        <>
            {isModalOpen && (
                <Modal show={isModalOpen} onHide={() => setIsModalOpen(false)}>
                    <Modal.Header closeButton>
                        <Modal.Title>
                            Please provide your openai API key.
                        </Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <FormControl
                            type="text"
                            placeholder="API Key"
                            value={apiKey}
                            onChange={(e) => setApiKey(e.target.value)}
                        />
                    </Modal.Body>
                    <Modal.Footer>
                        <Button
                            variant="secondary"
                            onClick={() => setIsModalOpen(false)}
                        >
                            Close
                        </Button>
                        <Button variant="primary" onClick={handleSave}>
                            Save changes
                        </Button>
                    </Modal.Footer>
                </Modal>
            )}
        </>
    );
};

export default DataChecker;
