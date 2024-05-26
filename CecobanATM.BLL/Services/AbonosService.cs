using CecobanATM.BLL.Dtos;
using CecobanATM.BLL.Interfaces;
using CecobanATM.DAL.Dtos;
using CecobanATM.DAL.Interfaces;
using Newtonsoft.Json;

namespace CecobanATM.BLL.Services
{
	public class AbonosService : IAbonos
	{
		private readonly ISPGenericRepository _repository;

		public AbonosService(ISPGenericRepository repository)
		{
			_repository = repository;
		}

		public async Task<bool> RegistraAbono(AbonoDto AbonoData)
		{
			_repository.CreateConnection(DAL.Enumeraciones.DbConnectionEnum.ATMDB);

			IDictionary<string, object> parameters = new Dictionary<string, object>
			{
				{ "Opcion", 1 },
				{ "Parametros", JsonConvert.SerializeObject(AbonoData)}
			};

			var SpResponses = await _repository.CallSP<SpGenericResponse>("Abonos_SP", parameters);

			var Response = SpResponses.FirstOrDefault();

			if (Response == null)
			{
				return false;
			}
			else
			{
				if (Response.Resultado == 1)
					return true;
				else
					return false;
			}
		}
	}
}
