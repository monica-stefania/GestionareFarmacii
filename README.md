# Pharmacy Management System (Gestionare farmacii)

## 📌 Project Overview
The purpose of this application is to create a system that allows the management of several pharmacies, each with its own product stock. It handles the administration of products, medical prescriptions, clients, doctors, and sales.

A key feature is the management of products that require a medical prescription; these must be approved by a doctor and associated with a specific prescription record.

## 🏗️ Database Structure
The database is designed with highly interconnected tables to maintain a professional workflow.

### Core Entities
* **Pharmacies (`farmacii`):** Stores information about each pharmacy, including its name and location.
* **Products (`produse`):** Includes details such as name, price, and whether a prescription is required.
* **Prospectus (`prospecte`):** Contains extended information and descriptions for a specific product.
* **Clients (`clienti`):** Stores identification and contact data for registered users.
* **Doctors (`medici`):** Identification data for doctors who prescribe medications, including a unique stamp code.
* **Prescriptions (`retete`):** Documents used to release medications, associated with a client and issued by a doctor.
* **Sales (`vanzari`):** Records of each transaction, linking a client to a specific pharmacy.

### Intermediate Tables & Relationships
* **Stocks (`stocuri`):** Indicates the quantity available for each product in each pharmacy (M:N relationship).
* **Prescription Details (`detalii_retete`):** Details the contents of a prescription, specifying dosage and quantity for each product (M:N relationship).
* **Sale Details (`detalii_vanzari`):** Breaks down sales into specific products and quantities, allowing association with prescriptions where necessary.

## 🛡️ Data Integrity & Constraints
The system implements strict rules to ensure data quality:

* **Primary Keys:** Every entity has a primary key to ensure row uniqueness, managed automatically using **Sequences** and **Triggers**.
* **Foreign Keys:** Relationships are enforced so that sales or stocks can only be created for valid, existing entities.
* **Unique Constraints:** Prevents duplicates for sensitive fields like CNP, email, medical stamp codes, and pharmacy locations.
* **Check Constraints:** Validates data logic, such as ensuring phone numbers are 10 digits, prices are within range ($0$ to $10,000$), and expiration dates are in the future.
* **Not Null:** Ensures essential fields like product names and prices are never left empty.

## 📈 Normalization
The database follows professional normalization standards to prevent data redundancy:
* **1NF:** Every column stores a single value with no repeating groups.
* **2NF:** All non-key attributes depend entirely on the primary key.
* **3NF:** No transitive dependencies exist; all columns depend directly on the primary key.
* **Boyce-Codd (BCNF):** All determinants are superkeys, ensuring structural integrity even in tables with unique candidate keys like the `medici` table.

---
**Author:** Luca Monica-Ștefania   
