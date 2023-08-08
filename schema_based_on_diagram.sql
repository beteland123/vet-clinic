CREATE TABLE medical_histories(
    id SERIAL PRIMARY KEY NOT NULL,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(50)
);