const express = require('express');
const router = express.Router();

/* const mysqlConnection  = require('../database.js'); */

// GET all project 
router.get('/', (req, res) => {
  /* mysqlConnection.query('SELECT * FROM project', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  }); */  

  res.send('hola');
});


/* router.get('/:id', (req, res) => {
  const { id } = req.params; 
  mysqlConnection.query('SELECT * FROM project WHERE id = ?', [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
}) */

module.express = router;