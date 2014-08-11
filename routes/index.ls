require! \express
router = express .Router!

router .get \/ (req, res) !->
  res .render \index do
    title: 'Express '

module.exports = router
