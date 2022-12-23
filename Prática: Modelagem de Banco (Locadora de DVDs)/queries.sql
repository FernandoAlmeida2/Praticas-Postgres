CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    categoryId INTEGER NOT NULL REFERENCES categories(id)
);

CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE actors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    "countryId" INTEGER NOT NULL REFERENCES countries(id),
    "birthDate" DATE NOT NULL
);

CREATE TABLE "actorsMovies" (
    id SERIAL PRIMARY KEY,
    "actorId" INTEGER NOT NULL REFERENCES actors(id),
    "movieId" INTEGER NOT NULL REFERENCES movies(id)
);

CREATE TABLE phones (
    id SERIAL PRIMARY KEY,
    number TEXT NOT NULL
);

CREATE TABLE states (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
);

CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    "stateId" INTEGER NOT NULL REFERENCES states(id)
);

CREATE TABLE addresses (
	id serial PRIMARY KEY,
	street TEXT NOT NULL,
	number TEXT NOT NULL,
	"zipCode" TEXT NOT NULL,
	complement TEXT NOT NULL,
	district TEXT NOT NULL,
	"cityId" integer NOT NULL REFERENCES cities(id)
); 

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE
);

CREATE TABLE "addressesCustomers" (
	id serial PRIMARY KEY,
	"addressId" integer NOT NULL REFERENCES addresses(id),
    "customerId" integer NOT NULL REFERENCES customers(id)
);

CREATE TABLE "phonesCustomers" (
	id serial PRIMARY KEY,
	"phoneId" integer NOT NULL REFERENCES phones(id),
    "customerId" integer NOT NULL REFERENCES customers(id)
); 

CREATE TABLE ratings (
    id SERIAL PRIMARY KEY,
    rating INTEGER NOT NULL
);

CREATE TABLE discs (
    id SERIAL PRIMARY KEY,
    number TEXT NOT NULL,
    "barCode" TEXT NOT NULL,
    "movieId" integer NOT NULL REFERENCES movies(id)
);

CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    "customerId" integer NOT NULL REFERENCES customers(id)
    "discId" integer NOT NULL REFERENCES discs(id),
    "locationDate" DATE NOT NULL DEFAULT NOW(),
    "returnDate" DATE,
);

CREATE TABLE surveys (
    id SERIAL PRIMARY KEY,
    "locationId" INTEGER NOT NULL REFERENCES locations(id)
    "movieRatingId" INTEGER NOT NULL REFERENCES ratings(id),
    "serviceRatingId" INTEGER NOT NULL REFERENCES ratings(id)
);

