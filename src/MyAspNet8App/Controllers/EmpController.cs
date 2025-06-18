using Microsoft.AspNetCore.Mvc;
using MyAspNet8App.Data;

namespace MyAspNet8App.Controllers;

public class EmpController : Controller
{
    private readonly IEmpRepository _repo;
    public EmpController(IEmpRepository repo) => _repo = repo;

    public async Task<IActionResult> Index()
    {
        var emps = await _repo.GetAllAsync();
        return View(emps);    // Views/Emp/Index.cshtml
    }
}
