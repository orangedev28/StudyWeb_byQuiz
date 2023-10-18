using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using StudyWeb.Models;

namespace StudyWeb.Controllers
{
    public class ContactsController : Controller
    {
        private StudyWebEntities db = new StudyWebEntities();

        // GET: Contacts
        public ActionResult Index()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            return View(db.Contacts.ToList());
        }

        // GET: Contacts/Details/5
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
            Contacts contacts = db.Contacts.Find(id);
            if (contacts == null)
            {
                return HttpNotFound();
            }
            return View(contacts);
        }
        

        // GET: Contacts/Create
        public ActionResult Create()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            return View();
        }

        // POST: Contacts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,fullname,maill,phone,address,message,dateSend,status")] Contacts contacts)
        {
            if (ModelState.IsValid)
            {
                db.Contacts.Add(contacts);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(contacts);
        }

        // GET: Contacts/Edit/5
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
            Contacts contacts = db.Contacts.Find(id);
            if (contacts == null)
            {
                return HttpNotFound();
            }
            return View(contacts);
        }

        // POST: Contacts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,fullname,maill,phone,address,message,dateSend,status")] Contacts contacts)
        {
            if (ModelState.IsValid)
            {
                db.Entry(contacts).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(contacts);
        }

        // GET: Contacts/Delete/5
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
            Contacts contacts = db.Contacts.Find(id);
            if (contacts == null)
            {
                return HttpNotFound();
            }
            return View(contacts);
        }

        // POST: Contacts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Contacts contacts = db.Contacts.Find(id);
            db.Contacts.Remove(contacts);
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
        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(Contacts contacts)
        {

            if(String.IsNullOrEmpty(contacts.fullname))
            {
                ViewData["ErrorFullname"] = "Chưa nhập tên!";
            }
            if (String.IsNullOrEmpty(contacts.maill))
            {
                ViewData["ErrorMail"] = "Chưa nhập email!";
            }
            if (String.IsNullOrEmpty(contacts.phone))
            {
                ViewData["ErrorPhone"] = "Chưa nhập số điện thoại!";
            }
            if (String.IsNullOrEmpty(contacts.address))
            {
                ViewData["ErrorAddress"] = "Chưa nhập địa chỉ!";
            }
            if (String.IsNullOrEmpty(contacts.message))
            {
                ViewData["ErrorMessage"] = "Chưa nhập nội dung!";
            }
            else
            {
                if (ModelState.IsValid)
                {
                    contacts.dateSend = DateTime.Now;
                    contacts.status = "Chưa duyệt";
                    db.Contacts.Add(contacts);
                    db.SaveChanges();
                    return RedirectToAction("Index", "Home");
                }
            }
            return View(contacts);
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Approval(int? id)
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            Contacts contacts = db.Contacts.Find(id);
            contacts.status = "Đã duyệt";
            db.SaveChanges();
            return View(contacts);
        }
        public ActionResult SendMail(int? id)
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contacts contacts = db.Contacts.Find(id);
            if (contacts == null)
            {
                return HttpNotFound();
            }
            return View(contacts);
        }
        public ActionResult WriteMail(string to, string content)
        {
            string from, pass;
            from = "studyweb.free@gmail.com";
            pass = "luepinittfinmcxr";
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(to.Trim());
            mail.From = new MailAddress(from);
            mail.Subject = "Website study free";
            mail.Body =  content;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(from, pass);
            try
            {
                smtp.Send(mail);
                @ViewBag.success = "Gửi thành công!";
            }
            catch (Exception)
            {
                throw;
            }
            return View();
        }

    }
}
