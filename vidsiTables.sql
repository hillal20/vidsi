CREATE TABLE subcribers(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name  VARCHAR(128) NOT NULL,
    last_name   VARCHAR(128) NOT NULL,
    pass_word TEXT NOT NULL,
    email TEXT NOT NULL,
    address_location  text,
    videos_streamed  TEXT,
    plan_id INTEGER,
    payment_method TEXT,
    credit_card INTEGER,
    starting_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plan(id)
    
);
CREATE UNIQUE INDEX subscriber_email ON subscribers(email);

CREATE TABLE plans(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    plan_name  VARCHAR(128) NOT NULL,
    Plan_Type TEXT NOT NULL,
    stream_limit INTEGER NOT NULL,
    monthly_cost INTEGER NOT NULL,
    
    
);
CREATE TABLE videos(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    video_name   TEXT  NOT NULL ,
    provider_id INTEGER,
    max_viewers INTEGER
    viewrs VARCHAR,
    stream_time DOUBLE NOT NULL,
    FOREIGN KEY ( provider_id) REFERENCES provider(id)
);

CREATE TABLE providers(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    provider_name  VARCHAR(128) NOT NULL,
    provider_email TEXT NOT NULL,
    pass_word TEXT NOT NULL,
);

CREATE TABLE licenses(
    id INTEGER PRIMARY KEY, 
    provider_id INTEGER NOT NULL, 
    video_id INTEGER NOT NULL, 
    stream_limit INTEGER NOT NULL, 
    FOREIGN KEY (provider_id) REFERENCES providers(id),
    FOREIGN KEY (video_id) REFERENCES videos(id)
);

CREATE TABLE views(
    id INTEGER PRIMARY KEY, 
    video_id INTEGER NOT NULL, 
    subscriber_id INTEGER NOT NULL, 
    stream_time DOUBLE NOT NULL, 
    is_active INTEGER DEFAULT 1 NOT NULL, 
    view_time  DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, 
    FOREIGN KEY (video_id) REFERENCES videos(id),
    FOREIGN KEY (subscriber_id) REFERENCES subscribers(id)
);


CREATE TABLE invoices(
    id INTEGER PRIMARY KEY, 
    subscriber_id INTEGER NOT NULL, 
    cost DOUBLE NOT NULL, 
    payment_date DATE NOT NULL, 
    payment_status INTEGER DEFAULT 0 NOT NULL, 
    invoice_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, 

    FOREIGN KEY (subscriber_id) REFERENCES subscribers(id)
);