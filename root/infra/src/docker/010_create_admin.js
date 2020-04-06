
db.getSiblingDB('admin').createUser({ user : "admin", pwd : "admin", roles: [ { role: "userAdminAnyDatabase", db: "admin" }, "readWriteAnyDatabase" ] });
db.getSiblingDB('admin').shutdownServer({timeoutSecs: 60});
