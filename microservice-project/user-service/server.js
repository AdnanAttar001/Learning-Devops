const express = require("express");

const app = express();

app.get("/", (req, res) => {
    res.send("Welcome to User Service!");
});

app.get("/users", (req, res) => {
    res.json([
        { id: 1, name: "John" },
        { id: 2, name: "David" }
    ]);
});

app.listen(3001, "0.0.0.0", () => {
    console.log("User Service running on port 3001");
});
