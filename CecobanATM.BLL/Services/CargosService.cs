using CecobanATM.BLL.Dtos;
using CecobanATM.BLL.Interfaces;
using CecobanATM.DAL.Dtos;
using CecobanATM.DAL.Interfaces;
using Newtonsoft.Json;

namespace CecobanATM.BLL.Services
{
	public class CargosService : ICargos
	{
		private readonly ISPGenericRepository _repository;

		public CargosService(ISPGenericRepository repository)
		{
			_repository = repository;
		}

		public async Task<bool> RegistraCargo(CargoDto CargoData)
		{
			_repository.CreateConnection(DAL.Enumeraciones.DbConnectionEnum.ATMDB);

			IDictionary<string, object> parameters = new Dictionary<string, object>
			{
				{ "Opcion", 1 },
				{ "Parametros", JsonConvert.SerializeObject(CargoData)}
			};

			var SpResponses = await _repository.CallSP<SpGenericResponse>("Cargos_SP", parameters);

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
