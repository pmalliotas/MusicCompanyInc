-- ARTISTS

-- (Artist Name, Type, Number of Members)
CALL InsertArtistData ('Panos', 'band', 4);

-- (id, Artist Name, Type, Number of Members)
CALL UpdateArtistData(31, 'Stelios and Friends', 'band', 3);

CALL DeleteArtistData(31);

SELECT * FROM GetAllArtists() as Artists;



-- ALBUMS

-- (Album Name, Artist Id, Release Date, Genre, Number of Downloads, Number of Sales)
CALL InsertAlbumData ('A Wild Goose', 15, '2021-12-09', 'Progressive Metal', 5000, 500);

-- (id, Album Name, Artist Id, Release Date, Genre, Number of Downloads, Number of Sales)
CALL UpdateAlbumData (__, 'A Wild Goose', 15, '2021-12-09', 'Progressive Metal', 10000, 500);

CALL DeleteAlbumData(__);

SELECT * FROM GetAllAlbums() as Albums;




-- SONGS

-- (Song Name, Album Id, Artist Id, Producer Id, Song Sales, Song Downloads)
CALL InsertSongData ('Beards of Sweat', 9, 15, 4, 6000, 10000);

-- (id, Song Name, Album Id, Artist Id, Producer Id, Song Sales, Song Downloads)
CALL UpdateSongData (__, 'Beards of Sweat', 9, 16, 4, 15000, 20000);

CALL DeleteSongData(__);

SELECT * FROM GetAllSongs() as Songs;




-- PRODUCERS

-- (Producer Name, Age, Sex)
CALL InsertProducerData ('Petros', 28, 'Male');

-- (id, Producer Name, Age, Sex)
CALL UpdateProducerData (__, 'Petros', 29, 'Male');

CALL DeleteProducerData(__);

SELECT * FROM GetAllProducers() as Producers;




-- ROOMS 

-- (Room Name, Size in SQM, Floor)
CALL InsertRoomData('Studio 4', 150, 2);

-- (id, Room Name, Size in SQM, Floor)
CALL UpdateRoomData(__, 'Studio 4', 180, 2);

CALL DeleteRoomData(__);

SELECT * FROM GetAllRooms() as Rooms;




-- RESERVATIONS

-- (Time and Date, Artist Id, Producer Id, Room Id)
CALL InsertReservationData('2022-02-12 16:00:00', 16, 4, 3);

-- (Time and Date, Artist Id, Producer Id, Room Id)
CALL UpdateReservationData(__, '2022-02-12 17:00:00', 16, 5, 3);

CALL DeleteReservationData(__);

SELECT * FROM GetAllReservations() as Reservations;




-- AWARDS

-- (Award Name, Album Id)
CALL InsertAwardData('Best Performance', 8);

-- (id, Award Name, Album Id)
CALL UpdateAwardData(__, 'Best Performance', 9);

CALL DeleteAwardData(__);

SELECT * FROM GetAllAwards() as Awards;




-- LOG
SELECT * FROM GetLog() as Log;