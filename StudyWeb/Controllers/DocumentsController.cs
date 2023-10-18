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
    public class DocumentsController : Controller
    {
        private StudyWebEntities db = new StudyWebEntities();

        // GET: Documents
        public ActionResult Index()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            var document = db.Document.Include(d => d.Subjects);
            return View(document.ToList());
        }

        // GET: Documents/Details/5
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
            Document document = db.Document.Find(id);
            if (document == null)
            {
                return HttpNotFound();
            }
            return View(document);
        }

        // GET: Documents/Create
        public ActionResult Create()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName");
            return View();
        }

        // POST: Documents/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Document document, HttpPostedFileBase fileUpload)
        {
            if (fileUpload != null && fileUpload.ContentLength > 0)
            {
                string _fileName = Path.GetFileName(fileUpload.FileName);
                string _path = Path.Combine(Server.MapPath("~/DocumentFile"), _fileName);
                fileUpload.SaveAs(_path);
                document.linkDocument = _fileName;
            }
            if (ModelState.IsValid)
            {
                document.imageDocument = "";
                document.status = "Chưa đọc";
                document.dateUpload = DateTime.Now;
                db.Document.Add(document);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName", document.idSubjects);
            return View(document);
        }

        // GET: Documents/Edit/5
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
            Document document = db.Document.Find(id);
            if (document == null)
            {
                return HttpNotFound();
            }
            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName", document.idSubjects);
            return View(document);
        }

        // POST: Documents/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,idSubjects,contentDocument,linkDocument,imageDocument,dateUpload,status,display")] Document document)
        {
            if (ModelState.IsValid)
            {
                db.Entry(document).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName", document.idSubjects);
            return View(document);
        }

        // GET: Documents/Delete/5
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
            Document document = db.Document.Find(id);
            if (document == null)
            {
                return HttpNotFound();
            }
            return View(document);
        }

        // POST: Documents/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Document document = db.Document.Find(id);
            db.Document.Remove(document);
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


        public ActionResult Document(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Document document = db.Document.Find(id);
            if (document == null)
            {
                return HttpNotFound();
            }
            return View(document);
        }
        public ActionResult ListDocument(int? id)
        {
            List<Document> documents = db.Document.Where(s => s.idSubjects == id).ToList();
            SelectList ListLesson = new SelectList(db.Lesson, "id", "contentLesson", "linkLesson");
            ViewBag.DocumentList = ListLesson;
            return View(documents.ToList());
        }
        public ActionResult ListDocumentAdmin(int? id)
        {
            List<Document> documents = db.Document.Where(s => s.idSubjects == id).ToList();
            SelectList ListLesson = new SelectList(db.Lesson, "id", "contentLesson", "linkLesson");
            ViewBag.DocumentList = ListLesson;
            return View(documents.ToList());
        }
    }
}
