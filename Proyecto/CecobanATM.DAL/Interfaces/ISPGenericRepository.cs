using CecobanATM.DAL.Enumeraciones;
using System.Data;

namespace CecobanATM.DAL.Interfaces
{
	public interface ISPGenericRepository
	{
		DbConnectionEnum defaultConnName { get; set; }
		IDbConnection CreateConnection(DbConnectionEnum connectionName);

		Task<List<T>> CallSP<T>(string spName, IDictionary<string, object> parameters);

		Task<List<T>> CallSP<T>(string spName, IDictionary<string, object> parameters, DbConnectionEnum connectionName);
	}
}
