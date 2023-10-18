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
    public class ClasssesController : Controller
    {
        private StudyWebEntities db = new StudyWebEntities();

        // GET: Classses
        public ActionResult Index()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            return View(db.Classs.ToList());
        }

        // GET: Classses/Details/5
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
            Classs classs = db.Classs.Find(id);
            if (classs == null)
            {
                return HttpNotFound();
            }
            return View(classs);
        }

        // GET: Classses/Create
        public ActionResult Create()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            return View();
        }

        // POST: Classses/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Classs classs, HttpPostedFileBase fileUpload)
        {
            if(fileUpload != null && fileUpload.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesClass"), _fileName);
                fileUpload.SaveAs(_path);
                classs.imageClass = _fileName;
            }
            if (ModelState.IsValid)
            {
                db.Configuration.ValidateOnSaveEnabled = false;
                db.Classs.Add(classs);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(classs);
        }

        // GET: Classses/Edit/5
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
            Classs classs = db.Classs.Find(id);
            if (classs == null)
            {
                return HttpNotFound();
            }
            return View(classs);
        }
        
        // POST: Classses/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Classs classs, HttpPostedFileBase fileUpload)
        {
            if (fileUpload != null && fileUpload.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesClass"), _fileName);
                fileUpload.SaveAs(_path);
                classs.imageClass = _fileName;
            }
            else
            {
                classs.imageClass = classs.imageClass;
            }
            if (ModelState.IsValid)
            {
                db.Entry(classs).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index") ;
            }
            return View(classs);
        }

        // GET: Classses/Delete/5
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
            Classs classs = db.Classs.Find(id);
            if (classs == null)
            {
                return HttpNotFound();
            }
            return View(classs);
        }

        // POST: Classses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Classs classs = db.Classs.Find(id);
            db.Classs.Remove(classs);
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


        public ActionResult ListClass()
        {
            return View(db.Classs.ToList());
        }

        public ActionResult ListClassTest()
        {
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            return View(db.Classs.ToList());
        }
        public ActionResult ListClassVideo()
        {
            return View(db.Classs.ToList());
        }
    }
}
