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
    public class CommentsController : Controller
    {
        private StudyWebEntities db = new StudyWebEntities();

        // GET: Comments
        public ActionResult Index()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            var comment = db.Comment.Include(c => c.Account).Include(c => c.Posts);
            return View(comment.ToList());
        }

        // GET: Comments/Details/5
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
            Comment comment = db.Comment.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // GET: Comments/Create
        public ActionResult Create()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname");
            ViewBag.idPosts = new SelectList(db.Posts, "id", "contentPosts");
            return View();
        }

        // POST: Comments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,idPosts,idUser,idComment,contentComment,imageComment1,imageComment2,imageComment3,imageComment4,likeComment,dateComment,display")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                db.Comment.Add(comment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idUser = new SelectList(db.Account, "id", "fullname", comment.idUser);
            ViewBag.idPosts = new SelectList(db.Posts, "id", "contentPosts", comment.idPosts);
            return View(comment);
        }

        // GET: Comments/Edit/5
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
            Comment comment = db.Comment.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname", comment.idUser);
            ViewBag.idPosts = new SelectList(db.Posts, "id", "contentPosts", comment.idPosts);
            return View(comment);
        }

        // POST: Comments/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,idPosts,idUser,idComment,contentComment,imageComment1,imageComment2,imageComment3,imageComment4,likeComment,dateComment,display")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(comment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname", comment.idUser);
            ViewBag.idPosts = new SelectList(db.Posts, "id", "contentPosts", comment.idPosts);
            return View(comment);
        }

        // GET: Comments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comment.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // POST: Comments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Comment comment = db.Comment.Find(id);
            db.Comment.Remove(comment);
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
        public ActionResult ListComments(int? id )
        {
            TempData["idPosts"] = id;
            List<Comment> comments = db.Comment.Where(s => s.idPosts == id).ToList();
            // Set vào ViewBag
            Session["idPosts"] = id;
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname");
            ViewBag.idPosts = new SelectList(db.Posts, "id", "contentPosts");
            return View(comments);
        }
        public ActionResult CommentPosts()
        {
            if(Session["idUser"] == null)
            {
                return RedirectToAction("Login","Accounts");
            }
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CommentPosts(Comment comment, int? id, HttpPostedFileBase fileUpload1, HttpPostedFileBase fileUpload2, HttpPostedFileBase fileUpload3, HttpPostedFileBase fileUpload4)
        {
            if(id == null){
                if (TempData.ContainsKey("idPosts"))
                {
                    id = (int) TempData["idPosts"];
                }            
            }
            if (fileUpload1 != null && fileUpload1.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload1.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload1.SaveAs(_path);
                comment.imageComment1 = _fileName;
            }
            if (fileUpload2 != null && fileUpload2.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload2.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload2.SaveAs(_path);
                comment.imageComment2 = _fileName;
            }
            if (fileUpload3 != null && fileUpload3.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload3.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload3.SaveAs(_path);
                comment.imageComment3 = _fileName;
            }
            if (fileUpload4 != null && fileUpload4.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload4.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload4.SaveAs(_path);
                comment.imageComment4 = _fileName;
            }
            
            if (comment.contentComment == null)
            {
                return RedirectToAction("CommentPosts", "Comments");
            }
            else
            {
                comment.idPosts = id;
                comment.idUser = (int)Session["idUser"];
                comment.dateComment = DateTime.Now;
                comment.display = true;
                db.Configuration.ValidateOnSaveEnabled = false;
                db.Comment.Add(comment);
                db.SaveChanges();
                ViewBag.success = "Đăng bài thành công";
            }
            return RedirectToAction("ListComments", "Comments", new {id = id });
        }
        public ActionResult CommentOfUser(int? id)
        {
            List<Comment> comments = db.Comment.Where(c => c.idUser == id).ToList();
            SelectList listComments = new SelectList(db.Account, "id", "fullname");
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname");
            ViewBag.idPosts = new SelectList(db.Posts, "id", "contentPosts");
            ViewBag.listComments = listComments;
            Session["idPosts"] = id;
            return View(comments.ToList());
        }

        public ActionResult UserEditComment(int? id)
        {
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comment.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname", comment.idUser);
            ViewBag.idPosts = new SelectList(db.Posts, "id", "contentPosts", comment.idPosts);
            return View(comment);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UserEditComment(int? id, Comment comment, HttpPostedFileBase fileUpload1, HttpPostedFileBase fileUpload2, HttpPostedFileBase fileUpload3, HttpPostedFileBase fileUpload4)
        {
            if (fileUpload1 != null && fileUpload1.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload1.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload1.SaveAs(_path);
                comment.imageComment1 = _fileName;
            }
            if (fileUpload2 != null && fileUpload2.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload2.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload2.SaveAs(_path);
                comment.imageComment2 = _fileName;
            }
            if (fileUpload3 != null && fileUpload3.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload3.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload3.SaveAs(_path);
                comment.imageComment3 = _fileName;
            }
            if (fileUpload4 != null && fileUpload4.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload4.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload4.SaveAs(_path);
                comment.imageComment4 = _fileName;
            }
            if (fileUpload1 == null && fileUpload2 == null && fileUpload3 == null && fileUpload4 == null)
            {
                if (ModelState.IsValid)
                {
                    if (comment.contentComment == null)
                    {
                        return RedirectToAction("UserEditComment", "Comments", new { id = comment.id});
                    }
                    else
                    {
                        db.Entry(comment).State = EntityState.Modified;
                        comment.idPosts = (int)Session["idPosts"];
                        comment.idUser = (int)Session["idUser"];
                        comment.dateComment = DateTime.Now;
                        comment.display = true;
                        db.SaveChanges();
                    }
                    return RedirectToAction("CommentOfUser", "Comments", new { id = (int) Session["idUser"] });
                }
            }
            if (ModelState.IsValid)
            {
                comment.idUser = (int)Session["idUser"];
                comment.idPosts = (int)Session["idPosts"];
                comment.dateComment = DateTime.Now;
                comment.display = true;
                db.Entry(comment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("CommentOfUser", "Comments", new { id = (int)Session["idUser"] });
            }
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname", comment.idUser);
            ViewBag.idPosts = new SelectList(db.Posts, "id", "contentPosts", comment.idPosts);
            return View(comment);
        }
    }
}
