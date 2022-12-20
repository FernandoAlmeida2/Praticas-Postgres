CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    "fullName" TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE "customerPhones" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    number VARCHAR(9) NOT NULL,
    type TEXT NOT NULL AS ENUM ('landline', 'mobile')
);

CREATE TABLE "customerAddresses" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    street TEXT NOT NULL,
    NUMBER INTEGER NOT NULL,
    complement TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    "cityId" INTEGER NOT NULL
);

CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    "stateId" INTEGER NOT NULL,
);

CREATE TABLE states (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE "bankAccount" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    "accountNumber" TEXT NOT NULL UNIQUE,
    agency TEXT NOT NULL,
    "openDate" DATE NOT NULL,
    "closeDate" DATE NOT NULL
);

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    type TEXT NOT NULL AS ENUM ('deposit', 'withdraw'),
    time TIME NOT NULL,
    description TEXT NOT NULL
    cancelled BOOLEAN DEFAULT FALSE,
);

CREATE TABLE "creditCards" (
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    name VARCHAR(30) NOT NULL,
    number TEXT NOT NULL,
    "securityCode" TEXT NOT NULL,
    "expirationYear" INTEGER NOT NULL,
    password TEXT NOT NULL,
    limit INTEGER NOT NULL
);

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");

ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk0" FOREIGN KEY ("cityId") REFERENCES "cities"("id");
ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk1" FOREIGN KEY ("costumerId") REFERENCES "costumers"("id");

ALTER TABLE "customerPhones" ADD CONSTRAINT "customerPhones_fk0" FOREIGN KEY ("costumerId") REFERENCES "costumers"("id");

ALTER TABLE "bankAccount" ADD CONSTRAINT "bankAccount_fk0" FOREIGN KEY ("costumerId") REFERENCES "costumers"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");

ALTER TABLE "creditCards" ADD CONSTRAINT "creditCards_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");