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
    public class ScoresController : Controller
    {
        private StudyWebEntities db = new StudyWebEntities();

        // GET: Scores
        public ActionResult Index()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            var score = db.Score.Include(s => s.Account).Include(s => s.Test);
            return View(score.ToList());
        }

        // GET: Scores/Details/5
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
            Score score = db.Score.Find(id);
            if (score == null)
            {
                return HttpNotFound();
            }
            return View(score);
        }

        // GET: Scores/Create
        public ActionResult Create()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname");
            ViewBag.idTest = new SelectList(db.Test, "id", "nameTest");
            return View();
        }

        // POST: Scores/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,idTest,idUser,score1,display")] Score score)
        {
            if (ModelState.IsValid)
            {
                db.Score.Add(score);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idUser = new SelectList(db.Account, "id", "fullname", score.idUser);
            ViewBag.idTest = new SelectList(db.Test, "id", "nameTest", score.idTest);
            return View(score);
        }

        // GET: Scores/Edit/5
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
            Score score = db.Score.Find(id);
            if (score == null)
            {
                return HttpNotFound();
            }
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname", score.idUser);
            ViewBag.idTest = new SelectList(db.Test, "id", "nameTest", score.idTest);
            return View(score);
        }

        // POST: Scores/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,idTest,idUser,score1,display")] Score score)
        {
            if (ModelState.IsValid)
            {
                db.Entry(score).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname", score.idUser);
            ViewBag.idTest = new SelectList(db.Test, "id", "nameTest", score.idTest);
            return View(score);
        }

        // GET: Scores/Delete/5
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
            Score score = db.Score.Find(id);
            if (score == null)
            {
                return HttpNotFound();
            }
            return View(score);
        }

        // POST: Scores/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Score score = db.Score.Find(id);
            db.Score.Remove(score);
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

        public ActionResult ScoreUser(int? id)
        {
            List<Score> scores = db.Score.Where(s => s.idUser == id).ToList();
            // Set vào ViewBag
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname");
            return View(scores);
        }

        public ActionResult newScore(Score score)
        {
            if (ModelState.IsValid)
            {
                score.idTest = (int)Session["idTest"];
                score.idUser = (int)Session["idUser"];
                score.score1 = (float)Session["score"];
                score.dateAdd = DateTime.Now;
                score.display = true;
                db.Entry(score).State = EntityState.Modified;
                db.Score.Add(score);
                db.SaveChanges();
            }
            ViewBag.idUser = new SelectList(db.Account, "id", "fullname", score.idUser);
            ViewBag.idTest = new SelectList(db.Test, "id", "nameTest", score.idTest);
            return RedirectToAction("ListClassTest", "Classses");
        }
    }
}
