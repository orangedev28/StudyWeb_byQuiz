using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StudyWeb.Models;

namespace StudyWeb.Controllers
{
    public class SubjectsController : Controller
    {
        private StudyWebEntities db = new StudyWebEntities();

        // GET: Subjects
        public ActionResult Index()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            var subjects = db.Subjects.Include(s => s.Classs);
            return View(subjects.ToList());
        }

        // GET: Subjects/Details/5
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
            Subjects subjects = db.Subjects.Find(id);
            if (subjects == null)
            {
                return HttpNotFound();
            }
            return View(subjects);
        }

        // GET: Subjects/Create
        public ActionResult Create()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            ViewBag.idClass = new SelectList(db.Classs, "id", "className");
            return View();
        }

        // POST: Subjects/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Subjects subjects, HttpPostedFileBase fileUpload)
        {
            if (fileUpload != null && fileUpload.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesSubject"), _fileName);
                fileUpload.SaveAs(_path);
                subjects.imageSubjects = _fileName;
            }
            if (ModelState.IsValid)
            {
                db.Configuration.ValidateOnSaveEnabled = false;
                db.Subjects.Add(subjects);
                db.SaveChanges();
                return RedirectToAction("ListSubjectsAdmin","Subjects", new { id = subjects.idClass});
            }
            ViewBag.idClass = new SelectList(db.Classs, "id", "className", subjects.idClass);
            return View(subjects);
        }

        // GET: Subjects/Edit/5
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
            Subjects subjects = db.Subjects.Find(id);
            if (subjects == null)
            {
                return HttpNotFound();
            }
            ViewBag.idClass = new SelectList(db.Classs, "id", "className", subjects.idClass);
            return View(subjects);
        }

        // POST: Subjects/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Subjects subjects,  HttpPostedFileBase fileUpload)
        {
            if (fileUpload != null && fileUpload.ContentLength > 0)
            {
               var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesSubject"), _fileName);
                fileUpload.SaveAs(_path);
                subjects.imageSubjects = _fileName;
                if (ModelState.IsValid)
                {
                    db.Entry(subjects).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("ListSubjectsAdmin", "Subjects", new { id = subjects.idClass });
                }
            }
            else
            {
                if (ModelState.IsValid)
                {
                    db.Entry(subjects).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("ListSubjectsAdmin","Subjects", new { id = subjects.idClass });
                }
            }
            ViewBag.idClass = new SelectList(db.Classs, "id", "className", subjects.idClass);
            return View(subjects);
        }

        // GET: Subjects/Delete/5
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
            Subjects subjects = db.Subjects.Find(id);
            if (subjects == null)
            {
                return HttpNotFound();
            }
            return View(subjects);
        }

        // POST: Subjects/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Subjects subjects = db.Subjects.Find(id);
            db.Subjects.Remove(subjects);
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

        public ActionResult ListSubjects(int? id)
        {
            List<Subjects> subjects = db.Subjects.Where(s => s.idClass == id).ToList();
            // Tạo SelectList
            SelectList listSubjects = new SelectList(db.Classs, "id", "className");
            // Set vào ViewBag
            ViewBag.SubjectList = listSubjects;
            return View(subjects.ToList());
        }
        public ActionResult ListSubjectsTest(int? id)
        {
            List<Subjects> subjects = db.Subjects.Where(s => s.idClass == id).ToList();
            // Tạo SelectList
            SelectList listSubjects = new SelectList(db.Classs, "id", "className");
            // Set vào ViewBag
            ViewBag.SubjectList = listSubjects;
            return View(subjects.ToList());
        }
        public ActionResult ListSubjectsVideo(int? id)
        {
            List<Subjects> subjects = db.Subjects.Where(s => s.idClass == id).ToList();
            // Tạo SelectList
            SelectList listSubjects = new SelectList(db.Classs, "id", "className");
            // Set vào ViewBag
            ViewBag.SubjectList = listSubjects;
            return View(subjects.ToList());
        }
        public ActionResult ListSubjectsAdmin(int? id)
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            List<Subjects> subjects = db.Subjects.Where(s => s.idClass == id).ToList();
            // Tạo SelectList
            SelectList listSubjects = new SelectList(db.Classs, "id", "className");
            // Set vào ViewBag
            ViewBag.SubjectList = listSubjects;
            return View(subjects.ToList());
        }
    }
}
