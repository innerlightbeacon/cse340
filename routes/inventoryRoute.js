const express = require("express")
const router = express.Router()
const invController = require("../controllers/invController")
const baseController = require("../controllers/baseController")
const utilities = require("../utilities")

/* ***************************
 * Classification View Route
 * *************************** */
router.get(
  "/type/:classificationId",
  utilities.handleErrors(invController.buildByClassificationId)
)

/* ***************************
 * Inventory Detail View Route
 * *************************** */
router.get(
  "/detail/:invId",
  utilities.handleErrors(invController.buildInventoryDetail)
)

/* ***************************
 * Intentional 500 Error Route (Task 3)
 * *************************** */
router.get(
  "/error",
  utilities.handleErrors(baseController.triggerError)
)

module.exports = router
