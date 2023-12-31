CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  date_of_birth DATE,
  PRIMARY KEY (id)
);

CREATE TABLE medical_histories(
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at timestamp,
  patient_id INT REFERENCES patients(id),
  status VARCHAR(250),
  PRIMARY KEY (id)
);

CREATE TABLE treatments(
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(250),
  name VARCHAR(250),
  PRIMARY KEY (id)
);

CREATE TABLE invoices(
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id INT REFERENCES medical_histories(id),
  PRIMARY KEY (id)
);

CREATE TABLE invoice_items(
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id),
  PRIMARY KEY (id)
);

CREATE TABLE medical_join_treatment(
  id INT GENERATED ALWAYS AS IDENTITY,
  medical_history_id INT REFERENCES medical_histories(id),
  treatment_id INT REFERENCES treatments(id),
  PRIMARY KEY (id)
);

CREATE INDEX idx_patient_id ON medical_histories(patient_id);
CREATE INDEX idx_invoice_id ON invoice_items(invoice_id);
CREATE INDEX idx_treatment_id ON invoice_items(treatment_id);
CREATE INDEX idx_medical_history_id ON invoices(medical_history_id);
CREATE INDEX idx_medical_history_id2 ON medical_join_treatment(medical_history_id);
CREATE INDEX idx_treatment_id2 ON medical_join_treatment(treatment_id);

