namespace MyAspNet8App.Models;

public class Emp
{
    public int    EmpNo   { get; set; }
    public string EName   { get; set; } = default!;
    public string Job     { get; set; } = default!;
    public int?   Mgr     { get; set; }
    public DateTime HireDate { get; set; }
    public decimal Sal    { get; set; }
    public decimal? Comm  { get; set; }
    public int    DeptNo  { get; set; }
}
