const express = require('express');
const app = express();
const port = 5000; // You can change this to another port if needed


//Home Route ex - "/"
app.get("/", function (req, res) {
   res.send("This is the HomePage");
});

app.get("/notes", function (req, res) {
    res.send("This is the Notes Page");
 });
 

app.listen(port, () => {
   console.log(`Server is running on port ${port}`);
});
