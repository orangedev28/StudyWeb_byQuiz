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
    public class PostsController : Controller
    {
        private StudyWebEntities db = new StudyWebEntities();

        // GET: Posts
        public ActionResult Index()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            var posts = db.Posts.Include(p => p.Account);
            return View(posts.ToList());
        }

        // GET: Posts/Details/5
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
            Posts posts = db.Posts.Find(id);
            if (posts == null)
            {
                return HttpNotFound();
            }
            return View(posts);
        }

        // GET: Posts/Create
        public ActionResult Create()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname");
            return View();
        }

        // POST: Posts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,idUser,contentPosts,imagePosts1,imagePosts2,imagePosts3,imagePosts4,datePost,countLike,countComment,status,display")] Posts posts)
        {

            if (ModelState.IsValid)
            {
                db.Posts.Add(posts);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idUser = new SelectList(db.Account, "id", "fullname", posts.idUser);
            return View(posts);
        }

        // GET: Posts/Edit/5
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
            Posts posts = db.Posts.Find(id);
            if (posts == null)
            {
                return HttpNotFound();
            }
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname", posts.idUser);
            return View(posts);
        }

        // POST: Posts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,idUser,contentPosts,imagePosts1,imagePosts2,imagePosts3,imagePosts4,datePost,countLike,countComment,status,display")] Posts posts)
        {
            if (ModelState.IsValid)
            {
                db.Entry(posts).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname", posts.idUser);
            return View(posts);
        }

        // GET: Posts/Delete/5
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
            Posts posts = db.Posts.Find(id);
            if (posts == null)
            {
                return HttpNotFound();
            }
            return View(posts);
        }

        // POST: Posts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Posts posts = db.Posts.Find(id);
            db.Posts.Remove(posts);
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
        public ActionResult ListPosts()
        {
            var posts = db.Posts.Include(p => p.Account).OrderByDescending(p => p.id);
            return View(posts.ToList());
        }
        [HttpGet]
        public ActionResult AddPosts()
        {
            if(Session["idUser"] == null)
            {
                return RedirectToAction("Login","Accounts");
            }
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddPosts(Posts posts, HttpPostedFileBase fileUpload1, HttpPostedFileBase fileUpload2, HttpPostedFileBase fileUpload3, HttpPostedFileBase fileUpload4)
        {
            if (fileUpload1 != null && fileUpload1.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload1.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload1.SaveAs(_path);
                posts.imagePosts1 = _fileName;
            }
            if (fileUpload2 != null && fileUpload2.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload2.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload2.SaveAs(_path);
                posts.imagePosts2 = _fileName;
            }
            if (fileUpload3 != null && fileUpload3.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload3.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload3.SaveAs(_path);
                posts.imagePosts3 = _fileName;
            }
            if (fileUpload4 != null && fileUpload4.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload4.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload4.SaveAs(_path);
                posts.imagePosts4 = _fileName;
            }
            if (ModelState.IsValid)
            {
                if(posts.contentPosts == null)
                {
                    return RedirectToAction("AddPosts", "Posts");
                }
                else
                {
                    posts.idUser = (int) Session["idUser"];
                    posts.datePost = DateTime.Now; 
                    posts.status = "";
                    posts.display = true;
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.Posts.Add(posts);
                    db.SaveChanges();
                    ViewBag.success = "Đăng bài thành công";
                }
            }
            return RedirectToAction("ListPosts", "Posts");
        }

        public ActionResult PostsOfUser(int? id)
        {
            List<Posts> posts = db.Posts.Where(s => s.idUser == id).ToList();
            // Tạo SelectList
            SelectList listPosts = new SelectList(db.Posts, "id", "idUser");
            // Set vào ViewBag
            ViewBag.SubjectList = listPosts;
            return View(posts.ToList());
        }


        public ActionResult UserEditPosts(int? id)
        {
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Posts posts = db.Posts.Find(id);
            if (posts == null)
            {
                return HttpNotFound();
            }
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname", posts.idUser);
            return View(posts);
        }
        [HttpPost, ActionName("UserEditPosts")]
        [ValidateAntiForgeryToken]
        public ActionResult UserEditPostsConfirmed(Posts posts, HttpPostedFileBase fileUpload1, HttpPostedFileBase fileUpload2, HttpPostedFileBase fileUpload3, HttpPostedFileBase fileUpload4)
        {
            if (fileUpload1 != null && fileUpload1.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload1.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload1.SaveAs(_path);
                posts.imagePosts1 = _fileName;
            }
            if (fileUpload2 != null && fileUpload2.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload2.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload2.SaveAs(_path);
                posts.imagePosts2 = _fileName;
            }
            if (fileUpload3 != null && fileUpload3.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload3.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload3.SaveAs(_path);
                posts.imagePosts3 = _fileName;
            }
            if (fileUpload4 != null && fileUpload4.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload4.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesPosts"), _fileName);
                fileUpload4.SaveAs(_path);
                posts.imagePosts4 = _fileName;
            }
            if (fileUpload1 == null && fileUpload2 == null && fileUpload3 == null && fileUpload4 == null)
            {
                if (ModelState.IsValid)
                {
                    if (posts.contentPosts == null)
                    {
                        return RedirectToAction("UserEditPosts", "Posts");
                    }
                    else
                    {
                        db.Entry(posts).State = EntityState.Modified;
                        posts.idUser = (int)Session["idUser"];
                        posts.datePost = DateTime.Now;
                        posts.status = "";
                        posts.display = true;
                        db.SaveChanges();
                        ViewBag.success = "Lưu thành công!";
                    }
                }
            }
            if (ModelState.IsValid)
            {
                if (posts.contentPosts == null)
                {
                    return RedirectToAction("UserEditPosts", "Posts");
                }
                else
                {
                    db.Entry(posts).State = EntityState.Modified;
                    posts.idUser = (int)Session["idUser"];
                    posts.datePost = DateTime.Now;
                    posts.status = "";
                    posts.display = true;
                    db.SaveChanges();
                }
            }
            ViewBag.err = "Lưu thất bại!";
            return RedirectToAction("PostsOfUser", "Posts", new { id = posts.idUser });
        }
        public ActionResult UserDeletePosts(int? id)
        {
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Posts posts = db.Posts.Find(id);
            if (posts == null)
            {
                return HttpNotFound();
            }
            return View(posts);
        }

        // POST: Posts/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UserDeletePosts(int id)
        {
            Posts posts = db.Posts.Find(id);
            posts.display = false;
            db.SaveChanges();
            return RedirectToAction("DetailUser","Accounts", new { id = posts.idUser });
        }
    }
}
