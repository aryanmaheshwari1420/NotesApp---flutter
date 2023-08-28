const express = require('express');
const router = express.Router();


const Note = require('./../models/Note');


router.post("/list", async function (req, res) {
    var notes = await Note.find({ userid: req.body.userid });
    res.json(notes);
    //  res.send("This is the Notes Page");
  });

  router.post("/add", async function (req, res) {
    await Note.deleteOne({ id: req.body.id }); // to check that no duplicate note was added if exist then delete the first one then add

    const newNote = new Note({
      id: req.body.id,
      title: req.body.title,
      content: req.body.content,
      userid: req.body.userid,
    });
    await newNote.save();

    const response = { message: "New Note created! " + `id:${req.body.id}` };
    res.json(response);
  });

  router.post("/delete",async function(req,res){
    await Note.deleteOne({id:req.body.id});

    const response = { message: "Note Deleted! " + `id:${req.body.id}` };
    res.json(response);
  })

  module.exports = router;