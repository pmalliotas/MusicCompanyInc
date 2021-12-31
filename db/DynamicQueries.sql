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
