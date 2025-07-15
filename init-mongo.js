// MongoDB initialization script for Bonymous

// Switch to the bonymous database
db = db.getSiblingDB('bonymous');

// Create users collection with validation
db.createCollection('users', {
    validator: {
        $jsonSchema: {
            bsonType: 'object',
            required: ['id', 'username'],
            properties: {
                id: {
                    bsonType: 'string',
                    description: 'User ID is required and must be a string'
                },
                username: {
                    bsonType: 'string',
                    description: 'Username is required and must be a string'
                },
                firstName: {
                    bsonType: 'string',
                    description: 'First name must be a string'
                },
                lastName: {
                    bsonType: 'string',
                    description: 'Last name must be a string'
                },
                profilePhoto: {
                    bsonType: 'string',
                    description: 'Profile photo URL must be a string'
                }
            }
        }
    }
});

// Create index for efficient user lookups
db.users.createIndex({ 'id': 1 }, { unique: true });
db.users.createIndex({ 'username': 1 });

// Create threads collection
db.createCollection('threads', {
    validator: {
        $jsonSchema: {
            bsonType: 'object',
            required: ['id', 'title', 'content', 'author', 'createdAt'],
            properties: {
                id: {
                    bsonType: 'string',
                    description: 'Thread ID is required and must be a string'
                },
                title: {
                    bsonType: 'string',
                    description: 'Thread title is required and must be a string'
                },
                content: {
                    bsonType: 'string',
                    description: 'Thread content is required and must be a string'
                },
                author: {
                    bsonType: 'string',
                    description: 'Thread author is required and must be a string'
                },
                createdAt: {
                    bsonType: 'date',
                    description: 'Creation date is required and must be a date'
                }
            }
        }
    }
});

// Create index for threads
db.threads.createIndex({ 'id': 1 }, { unique: true });
db.threads.createIndex({ 'createdAt': -1 });

// Create comments collection
db.createCollection('comments', {
    validator: {
        $jsonSchema: {
            bsonType: 'object',
            required: ['id', 'threadId', 'content', 'author', 'createdAt'],
            properties: {
                id: {
                    bsonType: 'string',
                    description: 'Comment ID is required and must be a string'
                },
                threadId: {
                    bsonType: 'string',
                    description: 'Thread ID is required and must be a string'
                },
                content: {
                    bsonType: 'string',
                    description: 'Comment content is required and must be a string'
                },
                author: {
                    bsonType: 'string',
                    description: 'Comment author is required and must be a string'
                },
                createdAt: {
                    bsonType: 'date',
                    description: 'Creation date is required and must be a date'
                }
            }
        }
    }
});

// Create index for comments
db.comments.createIndex({ 'id': 1 }, { unique: true });
db.comments.createIndex({ 'threadId': 1 });
db.comments.createIndex({ 'createdAt': -1 });

// Create sessions collection (for express-session)
db.createCollection('express-sessions');
db['express-sessions'].createIndex({ 'expires': 1 }, { expireAfterSeconds: 0 });

print('MongoDB initialization completed successfully');
print('Collections created: users, threads, comments, express-sessions');
print('Indexes created for efficient querying');