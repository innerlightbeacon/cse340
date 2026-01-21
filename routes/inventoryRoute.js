const express = require("express")
const router = express.Router()

router.get("/", (req, res) => {
  res.send("Inventory route works")
})

module.exports = router
