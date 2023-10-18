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
    public class QuestionsController : Controller
    {
        private StudyWebEntities db = new StudyWebEntities();

        // GET: Questions
        public ActionResult Index()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            var question = db.Question.Include(q => q.Test);
            return View(question.ToList());
        }

        // GET: Questions/Details/5
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
            Question question = db.Question.Find(id);
            if (question == null)
            {
                return HttpNotFound();
            }
            return View(question);
        }

        // GET: Questions/Create
        public ActionResult Create()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            ViewBag.idTest = new SelectList(db.Test, "id", "nameTest");
            return View();
        }

        // POST: Questions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,idTest,question1,imageQuestion1,imageQuestion2,imageQuestion3,imageQuestion4,answer1,answer2,answer3,answer4,correctAnswer,imageAnswer1,imageAnswer2,imageAnswer3,imageAnswer4,score,status,display")] Question question)
        {
            if (ModelState.IsValid)
            {
                db.Question.Add(question);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idTest = new SelectList(db.Test, "id", "nameTest", question.idTest);
            return View(question);
        }

        // GET: Questions/Edit/5
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
            Question question = db.Question.Find(id);
            if (question == null)
            {
                return HttpNotFound();
            }
            ViewBag.idTest = new SelectList(db.Test, "id", "nameTest", question.idTest);
            return View(question);
        }

        // POST: Questions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,idTest,question1,imageQuestion1,imageQuestion2,imageQuestion3,imageQuestion4,answer1,answer2,answer3,answer4,correctAnswer,imageAnswer1,imageAnswer2,imageAnswer3,imageAnswer4,score,status,display")] Question question)
        {
            if (ModelState.IsValid)
            {
                db.Entry(question).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idTest = new SelectList(db.Test, "id", "nameTest", question.idTest);
            return View(question);
        }

        // GET: Questions/Delete/5
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
            Question question = db.Question.Find(id);
            if (question == null)
            {
                return HttpNotFound();
            }
            return View(question);
        }

        // POST: Questions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Question question = db.Question.Find(id);
            db.Question.Remove(question);
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
        public ActionResult AddQuestion()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            ViewBag.idTest = new SelectList(db.Test, "id", "nameTest");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddQuestion(Question question, HttpPostedFileBase fileUpload)
        {
            if (fileUpload != null && fileUpload.ContentLength > 0)
            {
                var newFileName = Guid.NewGuid();
                var _extension = Path.GetExtension(fileUpload.FileName);
                string newName = newFileName + _extension;
                string _fileName = Path.GetFileName(newName);
                var _path = Path.Combine(Server.MapPath("~/ImagesQuestion"), _fileName);
                fileUpload.SaveAs(_path);
                question.imageQuestion1 = _fileName;
            }
            if (ModelState.IsValid)
            {
                if (TempData.ContainsKey("idTest"))
                {
                    question.idTest = (int)TempData["idTest"];
                }
                question.status = "Hoàn tất";
                db.Configuration.ValidateOnSaveEnabled = false;
                db.Question.Add(question);
                db.SaveChanges();
                return RedirectToAction("ListQuestionAdmin","Questions", new { id = Session["idTest"] });
            }
            return View(question);
        }
        public ActionResult ListQuestion(int? id)
        {
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            Session["idTest"] = id;
            List<Question> question = db.Question.Where(s => s.idTest == id).ToList();
            // Tạo SelectList
            SelectList listQuestion = new SelectList(db.Classs, "id", "className");
            // Set vào ViewBag
            ViewBag.TestList = listQuestion;
            this.Session["correctAnswer"] = question;
            return View(question.ToList());
        }
        public ActionResult ListQuestionAdmin(int? id)
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            List<Question> question = db.Question.Where(s => s.idTest == id).ToList();
            // Tạo SelectList
            SelectList listQuestion = new SelectList(db.Classs, "id", "className");
            // Set vào ViewBag
            TempData["idTest"] = id;
            ViewBag.TestList = listQuestion;
            Session["idTest"] = id;
            this.Session["correctAnswer"] = question;
            return View(question.ToList());
        }
        [HttpPost]
        public ActionResult ResultTest(int? id,FormCollection form)
        {
            List<Question> question = db.Question.Where(s => s.idTest == id).ToList();
            float score = 0;
            int aTrue = 0;
            int i = 0;
            List<string> listAnswer = new List<string>();
            foreach (var item in question)
            {
                i++;
                if (form[item.id.ToString()] !=null)
                {
                    string value = form[item.id.ToString()].ToString();
                    listAnswer.Add(value);
                    if (value == item.correctAnswer)
                    {
                        score = score + (float)item.score;
                        aTrue = aTrue + 1;
                    }
                }
                else
                {
                    listAnswer.Add("trống");
                    score = score + 0;
                }
            }

            ViewBag.listAnswer = listAnswer;
            Session["idTest"] = id;
            Session["score"] = score;
            Session["true"] = aTrue;
            Session["total"] = i;
            return View(question);
        }
    }
}
