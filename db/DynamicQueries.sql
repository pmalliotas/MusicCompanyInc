-- DYNAMIC QUERIES

-- USER
DROP FUNCTION IF EXISTS LoginUser;

CREATE OR REPLACE FUNCTION LoginUser (u_username varchar(255), u_password varchar(255))
    RETURNS int
    LANGUAGE plpgsql
    AS $$
DECLARE
    result int;
BEGIN
    IF EXISTS (
        SELECT
            *
        FROM
            users
        WHERE
            username = u_username
            AND PASSWORD = u_password) THEN
    result = 1;
ELSE
    result = 0;
END IF;
    RETURN result;
END
$$;

--ARTIST

DROP FUNCTION IF EXISTS SearchArtistByName;

CREATE OR REPLACE FUNCTION SearchArtistByName (pattern varchar)
    RETURNS TABLE (
        ArtistId int,
        ArtistName varchar,
        ArtistType varchar,
        Members int)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        *
    FROM
        artists
    WHERE
        name ILIKE pattern;
END
$$;

SELECT * FROM SearchArtistByName('%kos%');

--ALBUMS

DROP FUNCTION IF EXISTS SearchAlbumByDownloads;

CREATE OR REPLACE FUNCTION SearchAlbumByDownloads (minimum_downloads int)
    RETURNS TABLE (
        AlbumId int,
        AlbumName varchar,
        AlbumReleaseDate date,
        AlbumGenre varchar,
        AlbumDownloads int,
        AlbumSales int
        )
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        *
    FROM
        albums
    WHERE
        no_of_downloads >= minimum_downloads;
END
$$;

SELECT * FROM SearchAlbumByDownloads(1000);


DROP FUNCTION IF EXISTS SearchAlbumBySales;

CREATE OR REPLACE FUNCTION SearchAlbumBySales (minimum_sales int)
    RETURNS TABLE (
        AlbumId int,
        AlbumName varchar,
        AlbumReleaseDate date,
        AlbumGenre varchar,
        AlbumDownloads int,
        AlbumSales int
        )
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        *
    FROM
        albums
    WHERE
        no_of_sales >= minimum_sales;
END
$$;

SELECT * FROM SearchAlbumBySales(500);

-- SONGS

DROP FUNCTION IF EXISTS SearchSongByProducer;

CREATE OR REPLACE FUNCTION SearchSongByProducer (ProducerId int)
    RETURNS TABLE (
        SongId int,
        SongName varchar,
        SongAlbumId int,
        SongArtistId int,
        SongProducerId int,
        SongDownloads int,
        SongSales int
        )
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        *
    FROM
        songs
    WHERE
        producer_id = ProducerId;
END
$$;

SELECT * FROM SearchSongByProducer(2);
