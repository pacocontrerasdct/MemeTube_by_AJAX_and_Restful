drop table videos;
create table videos
(
  id serial8 primary key,
  title varchar(255),
  description text,
  genre varchar(255),
  url text,
  artist varchar(255)
);

-- Music
INSERT INTO videos (title, description, genre, url, artist)
  VALUES ('do what you want', 'official video', 'pop rock', 'i00GDT9FuFM', 'ok go');

INSERT INTO videos (title, description, genre, url, artist)
  VALUES ('end love', 'official video', 'pop rock', 'V2fpgpanZAw', 'ok go');