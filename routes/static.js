const express = require("express")
const router = express.Router()

// Serve static assets from public folder
router.use(express.static("public"))

module.exports = router
