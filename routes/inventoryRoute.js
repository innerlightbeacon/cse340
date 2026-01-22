const express = require("express")
const router = express.Router()
const invController = require("../controllers/invController")
const baseController = require("../controllers/baseController")
const utilities = require("../utilities")

// Classification view
router.get(
  "/type/:classificationId",
  utilities.handleErrors(invController.buildByClassificationId)
)

// Inventory detail view
router.get(
  "/detail/:invId",
  utilities.handleErrors(invController.buildInventoryDetail)
)

// Intentional 500 error route (Task 3)
router.get(
  "/error",
  utilities.handleErrors(baseController.triggerError)
)

module.exports = router
