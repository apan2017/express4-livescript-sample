require! express
router = express.Router!

router.get \/ (req, res) !->
  'respond with a resource' |> res.send

module.exports = router
