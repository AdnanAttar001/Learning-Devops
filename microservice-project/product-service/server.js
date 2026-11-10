const express = require("express");

const app = express();

app.get("/", (req, res) => {
    res.send("Welcome to Product Service!");
});

app.get("/products", (req, res) => {
    res.json([
        { id: 101, name: "Laptop" },
        { id: 102, name: "Mobile" }
    ]);
});

app.listen(3002, "0.0.0.0", () => {
    console.log("Product Service running on port 3002");
});
