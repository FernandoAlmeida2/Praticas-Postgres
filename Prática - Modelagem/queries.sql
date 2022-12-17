CREATE DATABASE "pratica_modelagem";

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price INTEGER NOT NULL,
    image TEXT NOT NULL,
    category VARCHAR(50) NOT NULL,
    size VARCHAR(1) NOT NULL,
    stock INTEGER DEFAULT 0
);

CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    "userId" INTEGER NOT NULL REFERENCES "users"("id"),
    "productId" INTEGER NOT NULL REFERENCES "products"("id"),
    quantity INTEGER NOT NULL,
    status VARCHAR(20) NOT NULL,
    address TEXT NOT NULL,
    date DATE DEFAULT NOW()
);