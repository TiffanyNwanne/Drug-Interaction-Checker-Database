# Drug Interaction Checker Database Management Report

[![supabase-schema-tianvewzfaachzwxnbyi.png](https://github.com/TiffanyNwanne/Drug-Interaction-Checker-Database/blob/main/DB%20SCHEMA.png))](https://github.com/TiffanyNwanne/Drug-Interaction-Checker-Database/blob/main/DB%20SCHEMA.png)

## **1. Introduction**

The Drug Interaction Checker app is designed to help users identify potential drug interactions, categorize medications, and provide relevant warnings. To support this functionality, a relational database was created with **PostgreSQL** , ensuring data integrity, scalability, and efficient querying.

This report outlines the **database schema design**, **table relationships**, and the rationale behind the chosen structure.

---

## **2. Database Schema Overview**

The database consists of **six interconnected tables** to store drug information, interactions, categories, user details, and saved drugs. Below is a summary of each table and its purpose:

| **Table Name** | **Purpose** |
| --- | --- |
| `drugs` | Stores drug names, descriptions, and manufacturers. |
| `categories` | Holds drug categories (e.g., antibiotics, pain relievers). |
| `drug_categories` | Links drugs and categories (many-to-many relationship). |
| `interactions` | Stores interactions between drugs, along with severity levels. |
| `users` | Stores user information for authentication and tracking. |
| `user_favorites` | Allows users to save favorite drugs for quick access. |

---

## **3. Database Design and Relationships**

### **3.1 Drugs Table**

- The `drugs` table is the core of the database, storing detailed information about each drug.
- A **unique constraint** ensures drug names are not duplicated.
- The **manufacturer field** helps identify the drug's source.

### **3.2 Categories and Drug Categories Tables**

- Since a drug can belong to multiple categories (e.g., a pain reliever may also be an anti-inflammatory), a **many-to-many relationship** is implemented using the `drug_categories` table.
- The `categories` table ensures better data organization and filtering.

### **3.3 Interactions Table**

- This table captures drug-to-drug interactions.
- **Self-referencing foreign keys** (`drug1_id` and `drug2_id`) link interactions back to the `drugs` table.
- A **severity column** (Mild, Moderate, Severe) helps users understand the risk level of interactions.
- A **unique constraint** ensures no duplicate interactions are recorded.

### **3.4 Users and User Favorites Tables**

- The `users` table stores login details and is crucial for personalizing the user experience.
- The `user_favorites` table enables users to save and quickly access frequently searched drugs.

---

## **4. Data Integrity and Constraints**

To ensure data accuracy and consistency, the following constraints were applied:

- **Primary keys** for uniqueness.
- **Foreign keys** to maintain referential integrity between tables.
- **Cascade delete** on many-to-many relationships (e.g., if a drug is deleted, its interactions and category links are removed).
- **Check constraints** on the `severity` column in the `interactions` table, allowing only predefined severity levels.

---

## **5. Expected Benefits of the Database Design**

- **Efficient Querying:** The normalized schema ensures faster lookups, especially for interactions and category-based searches.
- **Data Integrity:** Relationships and constraints prevent data inconsistencies.
- **Scalability:** The structure supports future expansions, such as adding more interaction details, dosage recommendations, or real-time updates from medical databases.

---

## **6. Future Enhancements**

- **User Reports & Analytics:** Implement tracking of frequently searched drugs and interactions.
- **Automated Interaction Warnings:** Integrate AI-based risk assessment based on user medical history.
- **API Integration:** Connect with external drug databases for real-time updates.

---

## **7. Conclusion**

The **Drug Interaction Checker Database** is structured to ensure efficient storage, retrieval, and management of drug-related data. With a well-defined relational schema, users can **search for drugs, identify interactions, categorize medications, and save their preferences**. This scalable design supports future enhancements and ensures data reliability for medical applications.
