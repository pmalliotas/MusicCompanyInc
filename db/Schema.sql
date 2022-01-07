DROP DATABASE IF EXISTS MusicCompanyInc;

CREATE DATABASE MusicCompanyInc;

DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    artist_type VARCHAR(255),
    no_of_members INT NOT NULL DEFAULT 1,
    PRIMARY KEY (id)
);




DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    artist_id INT NOT NULL,
    release_date DATE NOT NULL,
    genre VARCHAR(255) NOT NULL,
    no_of_downloads INT NOT NULL,
    no_of_sales INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);

DROP TABLE IF EXISTS producers;

CREATE TABLE producers(
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    sex VARCHAR(255),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS songs;

CREATE TABLE songs (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    producer_id INT NOT NULL,
    song_sales INT NOT NULL,
    song_downloads INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(id),
    FOREIGN KEY (artist_id) REFERENCES artists(id),
    FOREIGN KEY (producer_id) REFERENCES producers(id),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS rooms;

CREATE TABLE rooms (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    size_in_sqm REAL NOT NULL,
    floor INT NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS reservations;

CREATE TABLE reservations (
    id SERIAL,
    date TIMESTAMP NOT NULL,
    artist_id INT NOT NULL,
    producer_id INT NOT NULL,
    room_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(id),
    FOREIGN KEY (producer_id) REFERENCES producers(id),
    FOREIGN KEY (room_id) REFERENCES rooms(id),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS awards;

CREATE TABLE awards (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(id),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id SERIAL,
    username VARCHAR(255),
    password VARCHAR(255)
);

INSERT INTO users VALUES (default, 'admin','admin');