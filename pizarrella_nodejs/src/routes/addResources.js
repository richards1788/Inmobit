const { Router }=require('express')
const router = Router()
const mysqlConnection = require('../database');

router.post('/add_resources', (req, res) => {
    const {amountadded, fkproject } = req.body;
    console.log(req.body);
    const query = "CALL PR_INSERTADDRES( ?,? );";
    mysqlConnection.query(query, [ amountadded, fkproject], (err, rows, fields) => {
      if (!err) {
        res.json({ status: 'Amount Saved' });
      } else {
        console.log(err);
      }
    });
  
  });


module.exports=router;