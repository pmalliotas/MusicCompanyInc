--PROCEDURES
--ARTISTS
CREATE OR REPLACE PROCEDURE InsertArtistData (a_name varchar(255), a_type varchar(255), a_number_of_members int)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO artists
        VALUES (DEFAULT, a_name, a_type, a_number_of_members);
END
$$;

CALL InsertArtistData ('Panos', 'band', 4);

CREATE OR REPLACE PROCEDURE UpdateArtistData (id int, a_name varchar(255), a_type varchar(255), a_number_of_members int)
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
        artist_id = id;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteArtistData (id int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM artists
    WHERE artist_id = id;
END
$$;

--ALBUMS
CREATE OR REPLACE PROCEDURE InsertAlbumData (a_name varchar(255), art_id int, r_date date, kind varchar(255), downloads int, sales int)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO albums
        VALUES (DEFAULT, a_name, art_id, r_date, kind, downloads, sales);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateAlbumData (id int, a_name varchar(255), a_artist_id int, a_release_date date, a_genre varchar(255), a_downloads int, a_sales int)
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
        album_id = id;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteArtistData (id int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM ablums
    WHERE album_id = id;
END
$$;

-- PRODUCERS
CREATE OR REPLACE PROCEDURE InsertProducerData (name varchar(255), age int, sex varchar(255))
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO producers
        VALUES (DEFAULT, name, age, sex);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateProducerData (id int, p_name varchar(255), p_age int, p_sex varchar(255))
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
        producer_id = id;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteProducerData (id int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM producers
    WHERE producer_id = id;
END
$$;

--SONGS
CREATE OR REPLACE PROCEDURE InsertSongData (name varchar(255), album_id int, artist_id int, producer_id int, song_sales int, song_downloads int)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO songs
        VALUES (DEFAULT, album_id, artist_id, producer_id, song_sales, song_downloads);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateSongData (id int, s_name varchar(255), s_album_id int, s_artist_id int, s_producer_id int, s_song_sales int, s_song_downloads int)
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
        song = id;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteSongData (id int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM songs
    WHERE song_id = id;
END
$$;

-- ROOMS
CREATE OR REPLACE PROCEDURE InsertRoomData (name varchar(255), size_in_sqm real, floor int)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO rooms
        VALUES (DEFAULT, name, size_in_sqm, floor);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateRoomData (id int, r_name varchar(255), r_size_in_sqm real, r_floor int)
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
        room_id = id;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteRoomData (id int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM rooms
    WHERE room_id = id;
END
$$;

--RESERVATIONS
CREATE OR REPLACE PROCEDURE InsertReservationData (date timestamp, artist_id int, producer_id int, room_id int)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO reservations
        VALUES (DEFAULT, date, artist_id, producer_id, room_id);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateReservationData (id int, res_date timestamp, res_artist_id int, res_producer_id int, res_room_id int)
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
        reservation_id = id;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteReservationData (id int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM reservations
    WHERE reservation_id = id;
END
$$;

--Awards
CREATE OR REPLACE PROCEDURE InsertAwardData (name varchar(255), album_id int)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO awards
        VALUES (DEFAULT, name, album_id);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateAwardData (id int, a_name varchar(255), a_album_id int)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE
        awards
    SET
        name = a_name,
        album_id = a_album_id
    WHERE
        award_id = id;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteAwardData (id int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM awards
    WHERE award_id = id;
END
$$;
