DROP TABLE IF EXISTS db_log;

CREATE TABLE db_log (
    operation char(1) NOT NULL,
    stamp timestamp NOT NULL PRIMARY KEY,
    userid varchar(20) NOT NULL,
    table_name varchar(30) NOT NULL,
    id INT NOT NULL
);

CREATE OR REPLACE FUNCTION process_db_log ()
    RETURNS TRIGGER
    AS $$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO db_log
        SELECT
            'D',
            now(),
            USER,
            TG_TABLE_NAME,
            OLD.id;
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO db_log
        SELECT
            'U',
            now(),
            USER,
            TG_TABLE_NAME,
            NEW.id;
        RETURN NEW;
    ELSIF (TG_OP = 'INSERT') THEN
        INSERT INTO db_log
        SELECT
            'I',
            now(),
            USER,
            TG_TABLE_NAME,
            NEW.id;
        RETURN NEW;
    END IF;
    RETURN NULL;
END;
$$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS artist_log_trigger ON artists;

CREATE TRIGGER db_log_artist_trigger
    AFTER INSERT OR UPDATE OR DELETE ON artists
    FOR EACH ROW
    EXECUTE PROCEDURE process_db_log ();
CREATE TRIGGER db_log_album_trigger
    AFTER INSERT OR UPDATE OR DELETE ON albums
    FOR EACH ROW
    EXECUTE PROCEDURE process_db_log ();
CREATE TRIGGER db_log_award_trigger
    AFTER INSERT OR UPDATE OR DELETE ON awards
    FOR EACH ROW
    EXECUTE PROCEDURE process_db_log ();
CREATE TRIGGER db_log_producer_trigger
    AFTER INSERT OR UPDATE OR DELETE ON producers
    FOR EACH ROW
    EXECUTE PROCEDURE process_db_log ();
CREATE TRIGGER db_log_reservation_trigger
    AFTER INSERT OR UPDATE OR DELETE ON reservations
    FOR EACH ROW
    EXECUTE PROCEDURE process_db_log ();
CREATE TRIGGER db_log_room_trigger
    AFTER INSERT OR UPDATE OR DELETE ON rooms
    FOR EACH ROW
    EXECUTE PROCEDURE process_db_log ();
CREATE TRIGGER db_log_song_trigger
    AFTER INSERT OR UPDATE OR DELETE ON songs
    FOR EACH ROW
    EXECUTE PROCEDURE process_db_log ();


