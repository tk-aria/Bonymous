-- PostgreSQL initialization script for Bonymous

-- Create database if it doesn't exist (handled by Docker environment)
-- Switch to the bonymous database is handled by Docker environment variables

-- Create uploads table for file storage
CREATE TABLE IF NOT EXISTS uploads (
    id TEXT PRIMARY KEY,
    originalname TEXT NOT NULL,
    mimetype TEXT NOT NULL,
    filename TEXT NOT NULL,
    size INTEGER NOT NULL,
    destination TEXT NOT NULL,
    fieldname TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index for efficient uploads lookup
CREATE INDEX IF NOT EXISTS idx_uploads_id ON uploads(id);
CREATE INDEX IF NOT EXISTS idx_uploads_filename ON uploads(filename);
CREATE INDEX IF NOT EXISTS idx_uploads_created_at ON uploads(created_at);

-- Create users table (if using PostgreSQL for user data)
CREATE TABLE IF NOT EXISTS users (
    id TEXT PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    first_name TEXT,
    last_name TEXT,
    profile_photo TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index for users
CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
CREATE INDEX IF NOT EXISTS idx_users_created_at ON users(created_at);

-- Create threads table (if using PostgreSQL for thread data)
CREATE TABLE IF NOT EXISTS threads (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    author TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index for threads
CREATE INDEX IF NOT EXISTS idx_threads_author ON threads(author);
CREATE INDEX IF NOT EXISTS idx_threads_created_at ON threads(created_at);

-- Create comments table (if using PostgreSQL for comment data)
CREATE TABLE IF NOT EXISTS comments (
    id TEXT PRIMARY KEY,
    thread_id TEXT NOT NULL,
    content TEXT NOT NULL,
    author TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (thread_id) REFERENCES threads(id) ON DELETE CASCADE
);

-- Create index for comments
CREATE INDEX IF NOT EXISTS idx_comments_thread_id ON comments(thread_id);
CREATE INDEX IF NOT EXISTS idx_comments_author ON comments(author);
CREATE INDEX IF NOT EXISTS idx_comments_created_at ON comments(created_at);

-- Create sessions table (if using PostgreSQL for session storage)
CREATE TABLE IF NOT EXISTS sessions (
    sid TEXT PRIMARY KEY,
    sess JSON NOT NULL,
    expire TIMESTAMP NOT NULL
);

-- Create index for sessions
CREATE INDEX IF NOT EXISTS idx_sessions_expire ON sessions(expire);

-- Grant permissions (if needed)
-- GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;
-- GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO postgres;

-- Print completion message
DO $$ 
BEGIN 
    RAISE NOTICE 'PostgreSQL initialization completed successfully';
    RAISE NOTICE 'Tables created: uploads, users, threads, comments, sessions';
    RAISE NOTICE 'Indexes created for efficient querying';
END $$;