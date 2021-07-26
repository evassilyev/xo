-- Generated by xo for the public schema.

-- table auth_group
CREATE TABLE auth_group (
  id SERIAL,
  name VARCHAR(150) NOT NULL,
  UNIQUE (name),
  PRIMARY KEY (id)
);

-- index auth_group_name_a6ea08ec_like
CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group (name);

-- table auth_group_permissions
CREATE TABLE auth_group_permissions (
  id BIGSERIAL,
  group_id INTEGER NOT NULL REFERENCES auth_group (id),
  permission_id INTEGER NOT NULL REFERENCES auth_permission (id),
  UNIQUE (group_id, permission_id),
  PRIMARY KEY (id)
);

-- index auth_group_permissions_group_id_b120cbf9
CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions (group_id);

-- index auth_group_permissions_permission_id_84c5c92e
CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions (permission_id);

-- table auth_permission
CREATE TABLE auth_permission (
  id SERIAL,
  name VARCHAR(255) NOT NULL,
  content_type_id INTEGER NOT NULL REFERENCES django_content_type (id),
  codename VARCHAR(100) NOT NULL,
  UNIQUE (content_type_id, codename),
  PRIMARY KEY (id)
);

-- index auth_permission_content_type_id_2f476e4b
CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission (content_type_id);

-- table auth_user
CREATE TABLE auth_user (
  id SERIAL,
  password VARCHAR(128) NOT NULL,
  last_login TIMESTAMPTZ,
  is_superuser BOOLEAN NOT NULL,
  username VARCHAR(150) NOT NULL,
  first_name VARCHAR(150) NOT NULL,
  last_name VARCHAR(150) NOT NULL,
  email VARCHAR(254) NOT NULL,
  is_staff BOOLEAN NOT NULL,
  is_active BOOLEAN NOT NULL,
  date_joined TIMESTAMPTZ NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (username)
);

-- index auth_user_username_6821ab7c_like
CREATE INDEX auth_user_username_6821ab7c_like ON auth_user (username);

-- table auth_user_groups
CREATE TABLE auth_user_groups (
  id BIGSERIAL,
  user_id INTEGER NOT NULL REFERENCES auth_user (id),
  group_id INTEGER NOT NULL REFERENCES auth_group (id),
  PRIMARY KEY (id),
  UNIQUE (user_id, group_id)
);

-- index auth_user_groups_group_id_97559544
CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups (group_id);

-- index auth_user_groups_user_id_6a12ed8b
CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups (user_id);

-- table auth_user_user_permissions
CREATE TABLE auth_user_user_permissions (
  id BIGSERIAL,
  user_id INTEGER NOT NULL REFERENCES auth_user (id),
  permission_id INTEGER NOT NULL REFERENCES auth_permission (id),
  PRIMARY KEY (id),
  UNIQUE (user_id, permission_id)
);

-- index auth_user_user_permissions_permission_id_1fbb5f2c
CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions (permission_id);

-- index auth_user_user_permissions_user_id_a95ead1b
CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions (user_id);

-- table authors
CREATE TABLE authors (
  author_id BIGSERIAL,
  name TEXT NOT NULL,
  PRIMARY KEY (author_id)
);

-- table books
CREATE TABLE books (
  book_id BIGSERIAL,
  isbn VARCHAR(255) NOT NULL,
  book_type INTEGER NOT NULL,
  title VARCHAR(255) NOT NULL,
  year INTEGER NOT NULL,
  available TIMESTAMPTZ NOT NULL,
  books_author_id_fkey BIGINT NOT NULL REFERENCES authors (author_id),
  PRIMARY KEY (book_id)
);

-- index books_books_author_id_fkey_73ac0c26
CREATE INDEX books_books_author_id_fkey_73ac0c26 ON books (books_author_id_fkey);

-- table books_tags
CREATE TABLE books_tags (
  id BIGSERIAL,
  book_id BIGINT NOT NULL REFERENCES books (book_id),
  tag_id BIGINT NOT NULL REFERENCES tags (tag_id),
  UNIQUE (book_id, tag_id),
  PRIMARY KEY (id)
);

-- index books_tags_book_id_73d7d8e8
CREATE INDEX books_tags_book_id_73d7d8e8 ON books_tags (book_id);

-- index books_tags_tag_id_8d70b40a
CREATE INDEX books_tags_tag_id_8d70b40a ON books_tags (tag_id);

-- table django_admin_log
CREATE TABLE django_admin_log (
  id SERIAL,
  action_time TIMESTAMPTZ NOT NULL,
  object_id TEXT,
  object_repr VARCHAR(200) NOT NULL,
  action_flag SMALLINT NOT NULL,
  change_message TEXT NOT NULL,
  content_type_id INTEGER REFERENCES django_content_type (id),
  user_id INTEGER NOT NULL REFERENCES auth_user (id),
  PRIMARY KEY (id)
);

-- index django_admin_log_content_type_id_c4bce8eb
CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log (content_type_id);

-- index django_admin_log_user_id_c564eba6
CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log (user_id);

-- table django_content_type
CREATE TABLE django_content_type (
  id SERIAL,
  app_label VARCHAR(100) NOT NULL,
  model VARCHAR(100) NOT NULL,
  UNIQUE (app_label, model),
  PRIMARY KEY (id)
);

-- table django_migrations
CREATE TABLE django_migrations (
  id BIGSERIAL,
  app VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  applied TIMESTAMPTZ NOT NULL,
  PRIMARY KEY (id)
);

-- table django_session
CREATE TABLE django_session (
  session_key VARCHAR(40) NOT NULL,
  session_data TEXT NOT NULL,
  expire_date TIMESTAMPTZ NOT NULL,
  PRIMARY KEY (session_key)
);

-- index django_session_expire_date_a5c62663
CREATE INDEX django_session_expire_date_a5c62663 ON django_session (expire_date);

-- index django_session_session_key_c0390e0f_like
CREATE INDEX django_session_session_key_c0390e0f_like ON django_session (session_key);

-- table tags
CREATE TABLE tags (
  tag_id BIGSERIAL,
  tag VARCHAR(50) NOT NULL,
  PRIMARY KEY (tag_id)
);