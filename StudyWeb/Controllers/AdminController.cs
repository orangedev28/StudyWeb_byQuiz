using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StudyWeb.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            return View();
        }
        public ActionResult About()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            return View();
        }
    }
}