using CecobanATM.DAL.Enumeraciones;
using CecobanATM.DAL.Interfaces;
using Dapper;
using Microsoft.Data.SqlClient;
using System.Data;

namespace CecobanATM.DAL.Implementacion
{
	public class SPGenericRepository : ISPGenericRepository
	{
		private readonly IDictionary<DbConnectionEnum, string> _connectionDict;

		public SPGenericRepository(IDictionary<DbConnectionEnum, string> connectionDict)
		{
			_connectionDict = connectionDict;
		}

		public DbConnectionEnum defaultConnName { get; set; } = DbConnectionEnum.ATMDB;

		public async Task<List<T>> CallSP<T>(string spName, IDictionary<string, object> parameters)
		{
			DynamicParameters spParameters = new DynamicParameters();

			parameters.ToList().ForEach(p =>
			{
				spParameters.Add(name: p.Key, value: p.Value);
			});

			using var connection = CreateConnection(defaultConnName);
			return (await connection.QueryAsync<T>(sql: spName, param: spParameters, commandType: CommandType.StoredProcedure)).ToList();
		}

		public async Task<List<T>> CallSP<T>(string spName, IDictionary<string, object> parameters, DbConnectionEnum connectionName)
		{
			DynamicParameters spParameters = new DynamicParameters();

			parameters.ToList().ForEach(p =>
			{
				spParameters.Add(name: p.Key, value: p.Value);
			});

			using var connection = CreateConnection(connectionName);
			return (await connection.QueryAsync<T>(sql: spName, param: spParameters, commandType: CommandType.StoredProcedure)).ToList();
		}

		public IDbConnection CreateConnection(DbConnectionEnum connectionName)
		{
			string connectionString = string.Empty;

			if (_connectionDict.TryGetValue(connectionName, out connectionString))
			{
				return new SqlConnection(connectionString);
			}

			throw new ArgumentNullException();
		}
	}
}
