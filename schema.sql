DROP DATABASE IF EXISTS MusicCompanyInc;

CREATE DATABASE MusicCompanyInc;

DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
    artist_id SERIAL,
    name VARCHAR(255) NOT NULL,
    artist_type VARCHAR(255),
    no_of_members INT NOT NULL DEFAULT 1,
    PRIMARY KEY (artist_id)
);

DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
    album_id SERIAL,
    name VARCHAR(255) NOT NULL,
    artist_id INT NOT NULL,
    release_date DATE NOT NULL,
    genre VARCHAR(255) NOT NULL,
    no_of_downloads INT NOT NULL,
    no_of_sales INT NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

DROP TABLE IF EXISTS producers;

CREATE TABLE producers(
    producer_id SERIAL,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    sex VARCHAR(255),
    PRIMARY KEY (producer_id)
);

DROP TABLE IF EXISTS songs;

CREATE TABLE songs (
    song_id SERIAL,
    name VARCHAR(255) NOT NULL,
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    producer_id INT NOT NULL,
    song_sales INT NOT NULL,
    song_downloads INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(album_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (producer_id) REFERENCES producers(producer_id),
    PRIMARY KEY (song_id)
);

DROP TABLE IF EXISTS rooms;

CREATE TABLE rooms (
    room_id SERIAL,
    name VARCHAR(255) NOT NULL,
    size_in_sqm REAL NOT NULL,
    floor INT NOT NULL,
    PRIMARY KEY (room_id)
);

DROP TABLE IF EXISTS reservations;

CREATE TABLE reservations (
    reservation_id SERIAL,
    date TIMESTAMP NOT NULL,
    artist_id INT NOT NULL,
    producer_id INT NOT NULL,
    room_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (producer_id) REFERENCES producers(producer_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    PRIMARY KEY (reservation_id)
);

DROP TABLE IF EXISTS awards;

CREATE TABLE awards (
    award_id SERIAL,
    name VARCHAR(255) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(album_id),
    PRIMARY KEY (award_id)
);