CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE classes (
    id SERIAL PRIMARY KEY,
    code VARCHAR(3) NOT NULL UNIQUE
);

CREATE TABLE "studentsClasses" (
    id SERIAL PRIMARY KEY,
    "studentId" INTEGER NOT NULL REFERENCES students(id),
    "classId" INTEGER NOT NULL REFERENCES classes(id)
    "startDate" DATE NOT NULL DEFAULT NOW(),
    "endDate" DATE NOT NULL DEFAULT NOW()
);

CREATE TABLE modules (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,     
);

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    "moduleId" INTEGER NOT NULL REFERENCES modules(id)    
);

CREATE TYPE "typeGrades" AS ENUM ('Abaixo das Expectativas', 'Dentro das Expectativas', 'Acima das Expectativas');

CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    name "typeGrades" NOT NULL UNIQUE
);

CREATE TABLE deliveries (
    id SERIAL PRIMARY KEY,
    "projectId" INTEGER NOT NULL REFERENCES projects(id),
    "studentId" INTEGER NOT NULL REFERENCES students(id)
    "aplicationDate" DATE NOT NULL DEFAULT NOW(),
    "deliveryDate" DATE,
    "gradeId" INTEGER NOT NULL REFERENCES grades(id)
);