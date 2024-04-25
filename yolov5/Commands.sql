--1
CREATE TABLE Detections(object_name varchar(20), object_count int);

--2
CREATE OR REPLACE FUNCTION upd_detections()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM Detections WHERE object_name = NEW.object_name) THEN
        UPDATE Detections
        SET object_count = object_count + NEW.object_count
        WHERE object_name = NEW.object_name;
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

--3
CREATE TRIGGER trigger1
BEFORE INSERT ON Detections
FOR EACH ROW
EXECUTE FUNCTION upd_detections();

--4 Po uruchumieniu detect.py
SELECT object_name AS "Object name", object_count AS "Count"
FROM Detections;