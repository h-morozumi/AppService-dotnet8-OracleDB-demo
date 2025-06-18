using Oracle.ManagedDataAccess.Client;
using System.Data;
using Dapper;                         // 使いやすいので軽量 ORM を併用
using MyAspNet8App.Models;


namespace MyAspNet8App.Data;

public interface IEmpRepository
{
    Task<IEnumerable<Emp>> GetAllAsync();
}

public class EmpRepository : IEmpRepository
{
    private readonly string _connStr;
    public EmpRepository(IConfiguration cfg)
    {
        _connStr = cfg.GetConnectionString("OracleDb") 
            ?? throw new InvalidOperationException("Connection string not found.");
    }

    public async Task<IEnumerable<Emp>> GetAllAsync()
    {
        await using var conn = new OracleConnection(_connStr);
        const string sql = """
            SELECT empno   AS EmpNo,
                   ename   AS EName,
                   job     AS Job,
                   mgr     AS Mgr,
                   hiredate,
                   sal,
                   comm,
                   deptno  AS DeptNo
            FROM   emp
            ORDER  BY empno
            """;

        return await conn.QueryAsync<Emp>(sql);
    }
}
