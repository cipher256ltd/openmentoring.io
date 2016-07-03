var config = require('../metalsmith.json')
module.exports = {
  "content": {
    "options": config,
    "src": "_tmp",
    "dest": "_site"
  }
}
