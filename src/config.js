import React, { useState, useEffect } from "react";
import { Modal, Button, Input } from "react-bootstrap"; // you can use whatever UI library

const DataChecker = ({ supabase, userId, onComplete }) => {
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [apiKey, setApiKey] = useState("");

    useEffect(() => {
        const checkData = async () => {
            let { data: credentialsData, error: credentialsError } =
                await supabase
                    .from("public.credentials")
                    .select("data")
                    .eq("user_id", userId)
                    .single();

            if (credentialsError || !credentialsData || !credentialsData.data) {
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
        const id = await supabase.rpc.call(
            "vault.create_secret",
            btoa(`{"1d0773bcf3416404":{"API_KEY":"${apiKey}"}}`)
        );
        const { error } = await supabase
            .from("credentials")
            .update({ data: id })
            .eq("user_id", userId);

        setIsModalOpen(false);
        onComplete();
    };

    return (
        <>
            {isModalOpen && (
                <Modal show={isModalOpen} onHide={() => setIsModalOpen(false)}>
                    <Modal.Header closeButton>
                        <Modal.Title>
                            Please provide necessary details
                        </Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <Input
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