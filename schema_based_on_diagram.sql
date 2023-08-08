CREATE TABLE medical_histories(
    id SERIAL PRIMARY KEY NOT NULL,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(50)
);

CREATE TABLE treatment_card(
    med_id INTEGER REFERENCES  medical_histories(id) NOT NULL,
    treatment_id INTEGER REFERENCES treatments(id) NOT NULL,
    PRIMARY KEY (med_id, treatment_id)

); 

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY NOT NULL,
    type VARCHAR(50),
    NAME VARCHAT(50)
);
CREATE TABLE invoice_items(
   id SERIAL PRIMARY KEY NOT NULL,
   unit_price DECIMAL(10,2),
   quantity INT,
   total_price DECIMAL(10,2),
   invoice_id INTEGER REFERENCES invoices(id),
   treatment_id INTEGER REFERENCES treatments(id),
);
