CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    acronym VARCHAR(10) NOT NULL
);

CREATE TABLE airports (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    acronym VARCHAR(10) NOT NULL
);

CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    "departureAirportId" INTEGER NOT NULL REFERENCES airports(id),
    "arrivalAirportId" INTEGER NOT NULL REFERENCES airports(id)
);

CREATE TABLE flightsCompanies (
    id SERIAL PRIMARY KEY,
    "companyId" INTEGER NOT NULL REFERENCES companies(id),
    "flightId" INTEGER NOT NULL REFERENCES flights(id),
    acronym VARCHAR(10) NOT NULL,
    "departureTime" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    "arrivalTime"  TIMESTAMP NOT NULL
);