--
-- File generated with SQLiteStudio v3.4.17 on Mon Jun 23 21:49:35 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: AUTHORS
CREATE TABLE IF NOT EXISTS AUTHORS (
    AuthorID INTEGER PRIMARY KEY,
    Name     TEXT,
    Bio      TEXT
);


-- Table: BookAuthors
CREATE TABLE IF NOT EXISTS BookAuthors (
    BookID   INTEGER,
    AuthorID INTEGER,
    PRIMARY KEY (
        BookID,
        AuthorID
    ),
    FOREIGN KEY (
        BookID
    )
    REFERENCES Books (BookID),
    FOREIGN KEY (
        AuthorID
    )
    REFERENCES Authors (AuthorID) 
);


-- Table: Books
CREATE TABLE IF NOT EXISTS Books (
    BookID     INTEGER PRIMARY KEY,
    Title      TEXT,
    ISBN       TEXT    UNIQUE,
    CategoryID INTEGER,
    FOREIGN KEY (
        CategoryID
    )
    REFERENCES Categories (CategoryID) 
);


-- Table: Categories
CREATE TABLE IF NOT EXISTS Categories (
    CategoryID   INTEGER PRIMARY KEY,
    CategoryName TEXT
);


-- Table: Loans
CREATE TABLE IF NOT EXISTS Loans (
    LoanID     INTEGER PRIMARY KEY,
    BookID     INTEGER,
    MemberID   INTEGER,
    LoanDate   TEXT,
    ReturnDate TEXT,
    FOREIGN KEY (
        BookID
    )
    REFERENCES Books (BookID),
    FOREIGN KEY (
        MemberID
    )
    REFERENCES Members (MemberID) 
);


-- Table: Members
CREATE TABLE IF NOT EXISTS Members (
    MemberID INTEGER PRIMARY KEY,
    Name     TEXT,
    Email    TEXT    UNIQUE
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
