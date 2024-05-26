using CecobanATM.BLL.Dtos;
using CecobanATM.BLL.Dtos.Tarjetas;
using CecobanATM.BLL.Interfaces;
using CecobanATM.DAL.Dtos;
using CecobanATM.DAL.Interfaces;
using Newtonsoft.Json;
using System;

namespace CecobanATM.BLL.Services
{
	public class TarjetasService : ITarjetas
	{

		private readonly ISPGenericRepository _repository;

		public TarjetasService(ISPGenericRepository repository)
		{
			_repository = repository;
		}

		public async Task<bool> CambioNip(CambioNIPDto tarjeta)
		{

			_repository.CreateConnection(DAL.Enumeraciones.DbConnectionEnum.ATMDB);

			IDictionary<string, object> parameters = new Dictionary<string, object>
			{
				{ "Opcion", 1 },
				{ "Parametros", JsonConvert.SerializeObject(tarjeta)}
			};

			var SpResponses = await _repository.CallSP<SpGenericResponse>("Tarjetas_SP", parameters);

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
