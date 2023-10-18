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
    public class VideosController : Controller
    {
        private StudyWebEntities db = new StudyWebEntities();

        // GET: Videos
        public ActionResult Index()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            var video = db.Video.Include(v => v.Subjects);
            return View(video.ToList());
        }

        // GET: Videos/Details/5
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
            Video video = db.Video.Find(id);
            if (video == null)
            {
                return HttpNotFound();
            }
            return View(video);
        }

        // GET: Videos/Create
        public ActionResult Create()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName");
            return View();
        }

        // POST: Videos/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Video video, HttpPostedFileBase fileUpload)
        {
            if (fileUpload != null && fileUpload.ContentLength > 0)
            {
                string _fileName = Path.GetFileName(fileUpload.FileName);
                string _path = Path.Combine(Server.MapPath("~/Video"), _fileName);
                fileUpload.SaveAs(_path);
                video.linkVideo = _fileName;
            }
            if (ModelState.IsValid)
            {
                video.dateUpload = DateTime.Now;
                video.status = "Chưa xem";
                db.Video.Add(video);
                db.SaveChanges();
                return RedirectToAction("ListVideoAdmin","Videos", new { id = video.idSubjects}) ;
            }

            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName", video.idSubjects);
            return View(video);
        }

        // GET: Videos/Edit/5
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
            Video video = db.Video.Find(id);
            if (video == null)
            {
                return HttpNotFound();
            }
            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName", video.idSubjects);
            return View(video);
        }

        // POST: Videos/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Video video, HttpPostedFileBase fileUpload)
        {
            
            if (fileUpload != null && fileUpload.ContentLength > 0)
            {
                string _fileName = Path.GetFileName(fileUpload.FileName);
                string _path = Path.Combine(Server.MapPath("~/Video"), _fileName);
                fileUpload.SaveAs(_path);
                video.linkVideo = _fileName;
            }
            else
            {
                ViewBag.edtVideo = "Chưa chọn ảnh";
                return View();
            }    
            
            if (ModelState.IsValid)
            {
                db.Entry(video).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ListVideoAdmin", "Videos", new { id = video.idSubjects });
            }
            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName", video.idSubjects);
            return View(video);
        }

        // GET: Videos/Delete/5
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
            Video video = db.Video.Find(id);
            if (video == null)
            {
                return HttpNotFound();
            }
            return View(video);
        }

        // POST: Videos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Video video = db.Video.Find(id);
            db.Video.Remove(video);
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
        public ActionResult ListVideo(int? id)
        {
            List<Video> video = db.Video.Where(v => v.idSubjects == id).ToList();
            return View(video.ToList());
        }

        public ActionResult ListVideoAdmin(int? id)
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            List<Video> videos  = db.Video.Where(s => s.idSubjects == id).ToList();
            // Tạo SelectList
            SelectList listVideos = new SelectList(db.Subjects, "id", "subjectName");
            // Set vào ViewBag
            ViewBag.SubjectList = listVideos;
            return View(videos.ToList());
        }



    }
}
