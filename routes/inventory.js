var express = require('express');
var router = express.Router();
var dataBase=require('./dataBase.js');
var bodyParser = require('body-parser');

var query='';
/* GET users listing. */
router.get('/:userId', function(req, res, next) {
  var user_id=req.params.userId;
  var resResult = '';

  var query = 'SELECT user_id, inventory.item_id, inventory.amount FROM user INNER JOIN inventory ON inventory.user_id = user_id WHERE user_id IN ({0});';
  query=query.replace('{0}',user_id);

  try {
    dataBase.execute(query, function(result){
      resResult=JSON.stringify(result);
      console.log('query OK!');
      console.log(resResult);
      res.send(resResult);
    });

  } catch (e) {
    console.log(e);
  }
});

router.post('/:userId', function(req, res, next) {
  var user_id=req.params.userId;
  var resResult = '';

  var item_id = req.body.item_id;
  var amount = req.body.amount;

  var query = 'UPDATE inventory SET amount = {0} WHERE user_id IN ({1}) AND item_id IN ({2});';
  query=query.replace('{0}',amount);
  query=query.replace('{1}',user_id);
  query=query.replace('{2}',item_id);

  try {
    dataBase.execute(query, function(result){
      console.log('query DONE!');
    });

  } catch (e) {
    console.log(e);
  }
  res.send('se actualizado el inventario')
});

module.exports = router;
