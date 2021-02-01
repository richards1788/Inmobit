const { Router } = require('express')
const router = Router()
const mysqlConnection = require('../database');


router.get('/project', (req, res) => {
  mysqlConnection.query('SELECT * FROM VW_PRINPROJECT', (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
})
router.get('/homework', (req, res) => {
  mysqlConnection.query('SELECT * FROM VW_MANAGEHOMEWORK', (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
})

router.get('/dependence', (req, res) => {
  mysqlConnection.query('SELECT * FROM VW_PRINDEPENDENCE', (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
})

// insert project
router.post('/inproject', (req, res)=>{
  const { 
    nameproject, 
    enddate, 
    valuesproject, 
    projectdescription, 
    fkprojecttype, 
    fkuser
  } = req.body;
  const query =`CALL PR_INSERTPROJECT(?, ?, ?, ?, ?, ?);`;
  mysqlConnection.query(query,[
    nameproject, 
    enddate, 
    valuesproject, 
    projectdescription, 
    fkprojecttype,
    fkuser ], (err, rows, fields)=>{
          if(!err){
              res.json({Status: 'Project seved'});
          }else{
              console.log(err);
          }
      });    
}); 

//update project

router.put('/upproject/:idproject', (req, res)=>{
  const{
    nameproject,
    stateproject,
    enddate,
    valuesproject,  
    projectdescription,
    fkprojecttype,
    fkuser,
  } = req.body;
  const {idproject} = req.params;
  const query = 'CALL PR_UPDATEPROJECT(?,?,?,?,?,?,?,?);';
  mysqlConnection.query(query, [
    nameproject,
    stateproject, 
    enddate, 
    valuesproject, 
    projectdescription, 
    fkprojecttype,
    fkuser,
    idproject,
  ], (err, rows, fields)=>{
    console.log(rows);
    if(!err){
      res.json({status: 'Project Update'});
      }else{
        console.log(err);
      }
  });
});


// insert people
router.post('/people', (req, res) => {
  console.log('oeee')
  const { firstname,
      secondname,
      surname,
      secondsurname,
      telephone,
      numberdocument,
      fkcity,
      fkdocument} = req.body;
  console.log(req.body);
  const query = "CALL PR_INSERTPEOPLE( ?,?,?,?,?,?,?,? );";
  mysqlConnection.query(query, [firstname,
      secondname,
      surname,
      secondsurname,
      telephone,
      numberdocument,
      fkcity,
      fkdocument], (err, rows, fields) => {
          if (!err) {
              res.json({ status: 'People Saved' });
          } else {
              console.log(err);
          }
      });  
});

//update people
router.put('/udpeople/:idpeople', (req, res)=>{
  const{firstname, 
    secondname, 
    surname,
    secondsurname,
    telephone,
    stardate,
    numberdocument,
    statepeople,
    fkcity,
    fkdocument
  } = req.body;
  const {idpeople} = req.params;
  const query = 'CALL PR_UPDATEPEOPLE(?,?,?,?,?,?,?,?,?,?,?);';
  mysqlConnection.query(query, [firstname, 
    secondname,
    surname, 
    secondsurname, 
    telephone, 
    stardate, 
    numberdocument,
    statepeople,
    fkcity,
    fkdocument,
    idpeople], (err, rows, fields)=>{
    console.log(rows);
    if(!err){
      res.json({status: 'People Update'});
      }else{
        console.log(err);
      }
  });
});

//insert user
router.post('/user', (req, res) => {
  const {emailuser, passworduser, fkpeople } = req.body;
  console.log(req.body);
  const query = "CALL PR_INSERTUSER(?,?,?);";
  mysqlConnection.query(query, [ emailuser, passworduser, fkpeople], (err, rows, fields) => {
    if (!err) {
      res.json({ status: 'User Saved' });
    } else {
      console.log(err);
    }
  });
});

// insert city
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

//update city
router.put('/upcity/:idcity', (req, res)=>{
  const{cityname} = req.body;
  const {idcity} = req.params;
  const query = 'CALL PR_UPDATECITY(?,?);';
  mysqlConnection.query(query, [cityname, idcity], (err, rows, fields)=>{
    console.log(rows);
    if(!err){
      res.json({status: 'City Update'});
      }else{
        console.log(err);
      }
  });
});

// insert homeword

router.post('/homework', (req, res) => {
  const { namehomework,
      enddate,
      valueshomework,
      descriptionhomework,
      fkproject,
      fkuser } = req.body;
  console.log(req.body);
  const query = "CALL PR_INSERTHOMEWORK( ?,?,?,?,?,? );";
  mysqlConnection.query(query, [namehomework,
      enddate,
      valueshomework,
      descriptionhomework,
      fkproject,
      fkuser], (err, rows, fields) => {
          if (!err) {
              res.json({ status: 'Homework Saved' });
          } else {
              console.log(err);
          }
      });  
});

// insert advance
router.post('/advance', (req, res) => {
  const {urldocument, descripcion, fkhomework } = req.body;
  console.log(req.body);
  const query = "CALL PR_INSERTADVANCE( ?,?,? );";
  mysqlConnection.query(query, [ urldocument, descripcion, fkhomework], (err, rows, fields) => {
    if (!err) {
      res.json({ status: 'Advance Saved' });
    } else {
      console.log(err);
    }
  });
});

// insert dependence

router.post('/dependence', (req, res) => {
  const {NAMEDEPENDENCE } = req.body;
  console.log(req.body);
  const query = "CALL PR_INSERTADVANCE( ? );";
  mysqlConnection.query(query, [NAMEDEPENDENCE], (err, rows, fields) => {
    if (!err) {
      res.json({ status: 'Dependence Saved' });
    } else {
      console.log(err);
    }
  });
});

//update dependence
router.put('/uddependence/:iddependence', (req, res)=>{
  const{namedependence, statedependence} = req.body;
  const {iddependence} = req.params;
  const query = 'CALL PR_UPDATEDEPENDENCE(?,?,?);';
  mysqlConnection.query(query, [namedependence, statedependence, iddependence], (err, rows, fields)=>{
    console.log(rows);
    if(!err){
      res.json({status: 'Dependence Update'});
      }else{
        console.log(err);
      }
  });
});

// insert cv

router.post('/cv', (req, res) => {
  const {cvdescription, cvprofile, urldocument, fkpeople } = req.body;
  console.log(req.body);
  const query = "CALL PR_INSERTCV( ?,?,?,? );";
  mysqlConnection.query(query, [cvdescription, cvprofile, urldocument, fkpeople], (err, rows, fields) => {
    console.log(query);
    if (!err) {
      res.json({ status: 'Cv Saved' });
    } else {
      console.log(err);
    }
  });
});

//update cv
router.put('/upcv/:idcv', (req, res)=>{
  const{cvdescription, cvprofile, urldocument, fkpeople} = req.body;
  const {idcv} = req.params;
  const query = 'CALL PR_UPDATECV(?,?,?,?,?);';
  mysqlConnection.query(query, [cvdescription, cvprofile, urldocument, fkpeople, idcv], (err, rows, fields)=>{
    console.log(rows);
    if(!err){
      res.json({status: 'Cv Update'});
      }else{
        console.log(err);
      }
  });
});
// insert family reference
router.post('/family', (req, res) => {
  const {familyname, familylastname, familytelephone, familyrelationshi, fkcv } = req.body;
  console.log(req.body);
  const query = "CALL PR_INSERTFAMILYREF( ?,?,?,?,? );";
  mysqlConnection.query(query, [familyname, familylastname, familytelephone, familyrelationshi, fkcv], (err, rows, fields) => {
    console.log(query);
    if (!err) {
      res.json({ status: 'Family Reference Saved' });
    } else {
      console.log(err);
    }
  });
});

//update family reference
router.put('/upfamily/:idfamilyreference', (req, res)=>{
  const{familyname, familylastname, familytelephone, familyrelationshi, fkcv} = req.body;
  const {idfamilyreference} = req.params;
  const query = 'CALL PR_UPDATEFAMILYREFERENCE(?,?,?,?,?,?);';
  mysqlConnection.query(query, [familyname, familylastname, familytelephone, familyrelationshi, fkcv, idfamilyreference], (err, rows, fields)=>{
    console.log(rows);
    if(!err){
      res.json({status: 'Family Reference Update'});
      }else{
        console.log(err);
      }
  });
});

// insert profesional reference
router.post('/profesional', (req, res) => {
  const {companyname, profesionalname, telephone, rolecompany, fkcv } = req.body;
  console.log(req.body);
  const query = "CALL PR_INSERTPROFESIONREF( ?,?,?,?,? );";
  mysqlConnection.query(query, [companyname, profesionalname, telephone, rolecompany, fkcv], (err, rows, fields) => {
    console.log(query);
    if (!err) {
      res.json({ status: 'Family Reference Saved' });
    } else {
      console.log(err);
    }
  });
});

//update family reference
router.put('/upprofesional/:idprofesionalreference', (req, res)=>{
  const{ companyname, profesionalname, telephone,rolecompany, fkcv} = req.body;
  const {idprofesionalreference} = req.params;
  const query = 'CALL PR_UPDATEPROFESIONREFERENCE(?,?,?,?,?,?);';
  mysqlConnection.query(query, [companyname, profesionalname,telephone,rolecompany,fkcv, idprofesionalreference], (err, rows, fields)=>{
    if(!err){
      res.json({status: 'Profesional Reference Update'});
      }else{
        console.log(err);
      }
  });
});

// insert experience
router.post('/experience', (req, res)=>{
  const{timesexperience,workposition,companyname,fkcv,fkcity} = req.body;
  console.log(req.body);
  const query = "CALL PR_INSERTWORKEXPERIECE(?,?,?,?,?);";
  mysqlConnection.query(query, [timesexperience,workposition,companyname,fkcv,fkcity], (err, rows, fields)=>{
    if(!err){
      res.json({status: 'Experience Saved'})
    }else{
      console.log(err)
    }
  });
});

router.put('/upexperience/:idexperience',(req, res)=>{
  const{timesexperience, workposition, companyname, fkcv, fkcity}=req.body;
  const{idexperience}= req.params;
  const query= 'CALL PR_UPDATEWORKEXPERIENCE(?,?,?,?,?,?);';
  mysqlConnection.query(query,[timesexperience, workposition, companyname,fkcv,fkcity,idexperience], (err,rows, fields)=>{
  if(!err){
    res.json({status: 'Experience Update'});
  }else{
    console.log(err);
  }
  });
});

// insert title
router.post('/title', (req, res)=>{
  const{institutename, titlecategory, obtainingdate}= req.body;
  const query = "CALL PR_INSERTTITLE(?,?,?);";
  mysqlConnection.query(query, [institutename, titlecategory, obtainingdate], (err, rows, fields)=>{
    if(!err){
      res.json({status: 'Title Saved'})
    }else{
      console.log(err);
    }
  });
});

// Update Title
router.put('/uptitle/:idtitle', (req, res)=>{
  const{institutename, titlecategory, obtainingdate} = req.body;
  const{idtitle} = req.params;
  const query = 'CALL PR_UPDATETITLE(?,?,?,?);';
  mysqlConnection.query(query,[institutename, titlecategory, obtainingdate, idtitle], (err,rows, fields)=>{
    if(!err){
      res.json({status: 'Update Title'})
    }else{
      console.log(err);
    }
  });
});



module.exports = router;