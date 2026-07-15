using Microsoft.AspNetCore.Mvc;
using CourseManagementSystem.Models;

namespace CourseManagementSystem.Controllers
{
    public class StudentController : Controller
    {
        private readonly CourseManagmentDbContext _context;

        public StudentController(CourseManagmentDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var students = _context.Students.ToList();

            return View(students);
        }
       
        
        [HttpPost]
        public IActionResult Create(Student student)
        {
            _context.Students.Add(student);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }
      
        public IActionResult Edit(int id)
        {
            var student = _context.Students.Find(id);

            if (student == null)
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(Student student)
        {
            _context.Students.Add(student);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }
    }

}