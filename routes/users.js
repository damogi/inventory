var express = require('express');
var router = express.Router();
var dataBase=require('./dataBase.js');

var query = '';
/* GET users listing. */
router.get('/:userId', function(req, res, next) {
  var user_id = req.params.userId;
  var resResult = '';

  query = 'SELECT "name", "gold" FROM "user" WHERE "user_id" IN ({0});';
  query = query.replace('{0}',user_id);

  try {
    dataBase.execute(query, function(result){
      resResult= JSON.stringify(result);
      res.send(resResult);
    });
  } catch (e) {
    console.log(e);
  }
});

module.exports = router;
