using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StudyWeb.Models;

namespace StudyWeb.Controllers
{
    public class TestsController : Controller
    {
        private StudyWebEntities db = new StudyWebEntities();

        // GET: Tests
        public ActionResult Index()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            var test = db.Test.Include(t => t.Subjects);
            return View(test.ToList());
        }

        // GET: Tests/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Test test = db.Test.Find(id);
            if (test == null)
            {
                return HttpNotFound();
            }
            return View(test);
        }

        // GET: Tests/Create
        public ActionResult Create()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName");
            return View();
        }

        // POST: Tests/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,idSubjects,nameTest,timeTest,dateUpload,status,display")] Test test)
        {
            if (ModelState.IsValid)
            {
                test.dateUpload = DateTime.Now;
                test.status = "Chưa hoàn thành";
                db.Test.Add(test);
                db.SaveChanges();
                return RedirectToAction("ListTestAdmin","Tests", new { id = test.idSubjects});
            }

            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName", test.idSubjects);
            return View(test);
        }

        // GET: Tests/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Test test = db.Test.Find(id);
            if (test == null)
            {
                return HttpNotFound();
            }
            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName", test.idSubjects);
            return View(test);
        }

        // POST: Tests/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,idSubjects,nameTest,timeTest,dateUpload,status,display")] Test test)
        {
            if (ModelState.IsValid)
            {
                db.Entry(test).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName", test.idSubjects);
            return View(test);
        }

        // GET: Tests/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Test test = db.Test.Find(id);
            if (test == null)
            {
                return HttpNotFound();
            }
            return View(test);
        }

        // POST: Tests/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Test test = db.Test.Find(id);
            db.Test.Remove(test);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public ActionResult ListTest(int? id)
        {
            List<Test> test = db.Test.Where(s => s.idSubjects == id).ToList();
            // Tạo SelectList
            SelectList listTest = new SelectList(db.Score, "idUser", "score1");
            // Set vào ViewBag
            ViewBag.TestList = listTest;
            return View(test.ToList());
        }
        public ActionResult Test(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Test test = db.Test.Find(id);
            if (test == null)
            {
                
                return HttpNotFound();
            }
            Session["timeTest"] = db.Test.Where(s => s.id == id).ToList().FirstOrDefault().timeTest;
            return View(test);
        }
        public ActionResult ListTestAdmin(int? id)
        {
            List<Test> test = db.Test.Where(s => s.idSubjects == id).ToList();
            // Tạo SelectList
            SelectList listTest = new SelectList(db.Classs, "id", "className");
            // Set vào ViewBag
            ViewBag.TestList = listTest;
            return View(test.ToList());
        }
    }
}
