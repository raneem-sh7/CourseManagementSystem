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
    }
}
