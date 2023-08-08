CREATE TABLE medical_histories(
    id SERIAL PRIMARY KEY NOT NULL,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(50)
);

CREATE TABLE treatment_card(
    med_id INTEGER REFERENCES  medical_histories(id) NOT NULL,
    treatments_id INTEGER REFERENCES treatments(id) NOT NULL,
    PRIMARY KEY (med_id, treatments_id)

); 

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY NOT NULL,
    type VARCHAR(50),
    NAME VARCHAT(50)
);