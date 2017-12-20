--
-- File generated with SQLiteStudio v3.1.1 on Mon Jul 3 18:50:37 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: docfrequency
CREATE TABLE docfrequency (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, term VARCHAR NOT NULL, num_occ_in_docs INTEGER NOT NULL);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (1, '''', 26);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (2, ',', 11);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (3, '[', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (4, ']', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (5, 'a', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (6, 'address', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (7, 'all', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (8, 'and', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (9, 'apps', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (10, 'be', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (11, 'by', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (12, 'download', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (13, 'e', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (14, 'enter', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (15, 'favourite', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (16, 'for', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (17, 'help', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (18, 'here', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (19, 'improve', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (20, 'it', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (21, 'list', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (22, 'login', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (23, 'mail', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (24, 'network', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (25, 'of', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (26, 'our', 4);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (27, 'part', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (28, 'password', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (29, 'please', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (30, 're', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (31, 'reserved', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (32, 'reset', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (33, 'right', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (34, 'temporary', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (35, 'this', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (36, 'ticketmaster', 2);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (37, 'to', 3);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (38, 'updating', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (39, 'we', 3);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (40, 'will', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (41, 'you', 1);
INSERT INTO docfrequency (id, term, num_occ_in_docs) VALUES (42, 'your', 3);

-- Table: Document
CREATE TABLE Document (id INTEGER PRIMARY KEY NOT NULL, content TEXT NOT NULL);
INSERT INTO Document (id, content) VALUES (1, '['' please enter your e mail address we will e mail a temporary password for you to login and reset your password '', '' our network '', '' we re here to help '', '' be part of it '', '' download our apps '', '' ticketmaster all rights reserved '']');
INSERT INTO Document (id, content) VALUES (2, '['' improve this list by updating your favourites '', '' '', '' our network '', '' we re here to help '', '' be part of it '', '' download our apps '', '' ticketmaster all rights reserved '']');

-- Table: termFrequency
CREATE TABLE termFrequency (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, term VARCHAR NOT NULL, document_id INTEGER NOT NULL, frequency INTEGER NOT NULL, score REAL NOT NULL);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (1, 'and', 1, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (2, 'all', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (3, 'right', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (4, 'reserved', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (5, 'help', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (6, 'apps', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (7, 'it', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (8, 'download', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (9, 'our', 1, 2, 2);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (10, 'your', 1, 2, 2.29225607136);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (11, 'network', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (12, 'for', 1, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (13, 're', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (14, 'please', 1, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (15, ',', 1, 5, 2.3856062736);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (16, 'to', 1, 2, 2.29225607136);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (17, 'mail', 1, 2, 2.64443858947);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (18, 'you', 1, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (19, 'be', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (20, 'we', 1, 2, 2.29225607136);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (21, 'temporary', 1, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (22, 'ticketmaster', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (23, 'here', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (24, 'part', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (25, 'a', 1, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (26, 'address', 1, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (27, '[', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (28, 'password', 1, 2, 2.64443858947);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (29, ']', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (30, 'reset', 1, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (31, 'e', 1, 2, 2.64443858947);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (32, '''', 1, 12, 0);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (33, 'of', 1, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (34, 'will', 1, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (35, 'enter', 1, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (36, 'login', 1, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (37, 'all', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (38, 'right', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (39, 'reserved', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (40, 'help', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (41, 'it', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (42, 'download', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (43, 'our', 2, 2, 2);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (44, 'your', 2, 1, 2.29225607136);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (45, 'network', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (46, '''', 2, 14, 0);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (47, 're', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (48, 'apps', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (49, ',', 2, 6, 2.3856062736);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (50, 'to', 2, 1, 2.29225607136);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (51, 'be', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (52, 'we', 2, 1, 2.29225607136);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (53, 'favourite', 2, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (54, 'ticketmaster', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (55, 'here', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (56, 'part', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (57, '[', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (58, ']', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (59, 'by', 2, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (60, 'updating', 2, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (61, 'improve', 2, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (62, 'this', 2, 1, 1.6232492904);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (63, 'of', 2, 1, 1.32221929473);
INSERT INTO termFrequency (id, term, document_id, frequency, score) VALUES (64, 'list', 2, 1, 1.6232492904);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
