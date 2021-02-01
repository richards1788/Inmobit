const { Router }=require('express')
const router = Router()
const mysqlConnection = require('../database');

router.post('/city', (req, res) => {
  const {cityname } = req.body;
  console.log(req.body);
  const query = "CALL PR_INSERTCITY( ? );";
  mysqlConnection.query(query, [ cityname], (err, rows, fields) => {
    if (!err) {
      res.json({ status: 'City Saved' });
    } else {
      console.log(err);
    }
  });

});


module.exports=router;