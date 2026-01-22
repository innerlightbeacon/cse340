const utilities = require("../utilities/")
const baseController = {}

/* ***************************
 * Build Home Page
 * ************************** */
baseController.buildHome = async function(req, res){
  const nav = await utilities.getNav()
  res.render("index", { title: "Home", nav })
}

/* ***************************
 * Intentional 500 Error (Task 3)
 * ************************** */
baseController.triggerError = async function (req, res, next) {
  try {
    throw new Error("Intentional Server Error")
  } catch (error) {
    error.status = 500
    next(error)
  }
}

module.exports = baseController
