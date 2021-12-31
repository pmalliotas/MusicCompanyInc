--PROCEDURES
--ARTISTS
DROP FUNCTION IF EXISTS GetAllArtists;

CREATE OR REPLACE FUNCTION GetAllArtists ()
    RETURNS TABLE (
        Id int,
        ArtistName varchar(255),
        ArtistType varchar(255),
        Members int)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        *
    FROM
        artists;
END
$$;

CREATE OR REPLACE PROCEDURE InsertArtistData (a_name varchar(255), a_type varchar(255), a_number_of_members int)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO artists
        VALUES (DEFAULT, a_name, a_type, a_number_of_members);
END
$$;

CALL InsertArtistData ('Panos', 'band', 4);

CREATE OR REPLACE PROCEDURE UpdateArtistData (artist_id int, a_name varchar(255), a_type varchar(255), a_number_of_members int)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE
        artists
    SET
        name = a_name,
        artist_type = a_type,
        no_of_members = a_number_of_members
    WHERE
        id = artist_id;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteArtistData (artist_id int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM artists
    WHERE id = artist_id;
END
$$;

--ALBUMS
DROP FUNCTION IF EXISTS GetAllAlbums;

CREATE OR REPLACE FUNCTION GetAllAlbums ()
    RETURNS TABLE (
        Id int,
        AlbumName varchar(255),
        ArtistId int,
        ReleaseData date,
        Genre varchar(255),
        Downloads int,
        Sales int)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        *
    FROM
        albums;
END
$$;

CREATE OR REPLACE PROCEDURE InsertAlbumData (a_name varchar(255), art_id int, r_date date, kind varchar(255), downloads int, sales int)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO albums
        VALUES (DEFAULT, a_name, art_id, r_date, kind, downloads, sales);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateAlbumData (album_id int, a_name varchar(255), a_artist_id int, a_release_date date, a_genre varchar(255), a_downloads int, a_sales int)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE
        albums
    SET
        name = a_name,
        artist_id = a_artist_id,
        release_date = a_release_date,
        genre = a_genre,
        no_of_downloads = a_downloads,
        no_of_sales = a_sales
    WHERE
        id = album_id;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteAlbumData (album_id int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM ablums
    WHERE id = album_id;
END
$$;

-- PRODUCERS
DROP FUNCTION IF EXISTS GetAllProducers;

CREATE OR REPLACE FUNCTION GetAllProducers ()
    RETURNS TABLE (
        Id int,
        ProcducerName varchar(255),
        Age int,
        Sex varchar(255))
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        *
    FROM
        producers;
END
$$;

CREATE OR REPLACE PROCEDURE InsertProducerData (name varchar(255), age int, sex varchar(255))
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO producers
        VALUES (DEFAULT, name, age, sex);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateProducerData (producer_id int, p_name varchar(255), p_age int, p_sex varchar(255))
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE
        producers
    SET
        name = p_name,
        age = p_age,
        sex = p_sex
    WHERE
        id = producer_id;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteProducerData (producer_id int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM producers
    WHERE id = producer_id;
END
$$;

--SONGS
DROP FUNCTION IF EXISTS GetAllSongs;

CREATE OR REPLACE FUNCTION GetAllSongs ()
    RETURNS TABLE (
        Id int,
        SongName varchar(255),
        AlbumId int,
        ArtistId int,
        ProducerId int,
        Sales int,
        Downloads int)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        *
    FROM
        songs;
END
$$;

CREATE OR REPLACE PROCEDURE InsertSongData (name varchar(255), album_id int, artist_id int, producer_id int, song_sales int, song_downloads int)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO songs
        VALUES (DEFAULT, album_id, artist_id, producer_id, song_sales, song_downloads);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateSongData (song_id int, s_name varchar(255), s_album_id int, s_artist_id int, s_producer_id int, s_song_sales int, s_song_downloads int)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE
        songs
    SET
        name = s_name,
        album_id = s_album_id,
        artist_id = s_artist_id,
        producer_id = s_producer_id,
        song_sales = s_song_sales,
        song_downloads = s_song_downloads
    WHERE
        id = song_id;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteSongData (song_id int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM songs
    WHERE id = song_id;
END
$$;

-- ROOMS
DROP FUNCTION IF EXISTS GetAllRooms;

CREATE OR REPLACE FUNCTION GetAllRooms ()
    RETURNS TABLE (
        Id int,
        RoomName varchar(255),
        SizeInSQM real,
        Floor int)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        *
    FROM
        rooms;
END
$$;

CREATE OR REPLACE PROCEDURE InsertRoomData (name varchar(255), size_in_sqm real, floor int)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO rooms
        VALUES (DEFAULT, name, size_in_sqm, floor);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateRoomData (room_id int, r_name varchar(255), r_size_in_sqm real, r_floor int)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE
        rooms
    SET
        name = r_name,
        size_in_sqm = r_size_in_sqm,
        floor = r_floor
    WHERE
        id = room_id;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteRoomData (room_id int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM rooms
    WHERE id = room_id;
END
$$;

--RESERVATIONS
DROP FUNCTION IF EXISTS GetAllReservations;

CREATE OR REPLACE FUNCTION GetAllReservations ()
    RETURNS TABLE (
        Id int,
        Date timestamp,
        ArtistId int,
        ProducerId int,
        RoomId int)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        *
    FROM
        reservations;
END
$$;

CREATE OR REPLACE PROCEDURE InsertReservationData (date timestamp, artist_id int, producer_id int, room_id int)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO reservations
        VALUES (DEFAULT, date, artist_id, producer_id, room_id);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateReservationData (reservation_id int, res_date timestamp, res_artist_id int, res_producer_id int, res_room_id int)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE
        reservations
    SET
        date = res_date,
        artist_id = res_artist_id,
        producer_id = res_producer_id,
        room_id = res_room_id
    WHERE
        id = reservation_id;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteReservationData (reservation_id int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM reservations
    WHERE id = reservation_id;
END
$$;

--Awards
DROP FUNCTION IF EXISTS GetAllAwards;

CREATE OR REPLACE FUNCTION GetAllAwards ()
    RETURNS TABLE (
        Id int,
        AwardName varchar(255),
        AlbumId int)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        *
    FROM
        awards;
END
$$;

CREATE OR REPLACE PROCEDURE InsertAwardData (name varchar(255), album_id int)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO awards
        VALUES (DEFAULT, name, album_id);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateAwardData (award_id int, a_name varchar(255), a_album_id int)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE
        awards
    SET
        name = a_name,
        album_id = a_album_id
    WHERE
        id = award_id;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteAwardData (award_id int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM awards
    WHERE id = award_id;
END
$$;
