
db.getSiblingDB('dev').createUser({ user: "testUser", pwd: "testUser", roles: [ { role: "readWrite", db: "dev" } ] });
db.getSiblingDB('devint').createUser({ user: "testUser", pwd: "testUser", roles: [ { role: "readWrite", db: "devint" } ] });
