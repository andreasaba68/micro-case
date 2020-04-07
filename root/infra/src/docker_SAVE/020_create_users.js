
db.getSiblingDB('dev').createUser({ user: "testUser", pwd: "testUser", roles: [ { role: "readWrite", db: "dev" } ] });
db.getSiblingDB('dev').shutdownServer({timeoutSecs: 60});
