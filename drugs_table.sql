-- Create drugs table
CREATE TABLE drugs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    manufacturer VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create categories table
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT
);

-- Create a junction table for drug-category many-to-many relationship
CREATE TABLE drug_categories (
    drug_id INT REFERENCES drugs(id) ON DELETE CASCADE,
    category_id INT REFERENCES categories(id) ON DELETE CASCADE,
    PRIMARY KEY (drug_id, category_id)
);

-- Create interactions table (self-referencing drugs table)
CREATE TABLE interactions (
    id SERIAL PRIMARY KEY,
    drug1_id INT REFERENCES drugs(id) ON DELETE CASCADE,
    drug2_id INT REFERENCES drugs(id) ON DELETE CASCADE,
    interaction_description TEXT NOT NULL,
    severity VARCHAR(50) CHECK (severity IN ('Mild', 'Moderate', 'Severe')),
    UNIQUE (drug1_id, drug2_id) -- Prevent duplicate interactions
);

-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create user favorites table (users saving drugs)
CREATE TABLE user_favorites (
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    drug_id INT REFERENCES drugs(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, drug_id)
);
