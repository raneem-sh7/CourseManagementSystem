using Microsoft.AspNetCore.Mvc;
using CourseManagementSystem.Models;
using Microsoft.EntityFrameworkCore;


namespace CourseManagementSystem.Controllers
{
    public class CourseController : Controller
    {
        private readonly CourseManagmentDbContext _context;

        public CourseController(CourseManagmentDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var Courses = _context.Courses.Include(c => c.Teachear ).Include(c=>c.Section).ToList();

            return View(Courses);
        }

        public IActionResult Create()
        {
            var teachers = _context.Teachers.ToList();
            var sections = _context.Sections.ToList();
            ViewBag.Teachers = teachers;
            ViewBag.Sections = sections;

            return View();
        }

        [HttpPost]
        public IActionResult Create(Course course) 
        {
            _context.Courses.Add(course);
            _context.SaveChanges();
            

            return RedirectToAction("Index");
        }
        
    }
}
