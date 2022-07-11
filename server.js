const app = require('../chalenger_arcondicionado/api')

app.listen(process.env.API_PORT, function (err) {
  if (!err) console.log('API - Online', ' | Port:' + process.env.API_PORT);
  else console.log(err);
});

