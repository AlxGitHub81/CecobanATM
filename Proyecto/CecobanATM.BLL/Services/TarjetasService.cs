using Azure;
using CecobanATM.BLL.Dtos;
using CecobanATM.BLL.Dtos.Tarjetas;
using CecobanATM.BLL.Enumeraciones;
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

		public async Task<GenericResponse<CambioNIPDto>> CambioNip(CambioNIPDto tarjeta)
		{
			var response = new GenericResponse<CambioNIPDto>();

			_repository.CreateConnection(DAL.Enumeraciones.DbConnectionEnum.ATMDB);

			IDictionary<string, object> parameters = new Dictionary<string, object>
			{
				{ "Opcion", 1 },
				{ "Parametros", JsonConvert.SerializeObject(tarjeta)}
			};

			var SpResponses = await _repository.CallSP<SpGenericResponse>("Tarjetas_SP", parameters);

			if (SpResponses == null)
			{
				response.Estado = GenericResponseEnum.Error;
				response.Mensaje = "Ocurrió un error en la operación";
			}
			else
			{
				var responseData = SpResponses.FirstOrDefault();

				switch (responseData.Resultado)
				{
					case 1:
						response.Estado = GenericResponseEnum.Correcto;
						response.Mensaje = "Operación realizada";
						break;
					case 2:
						response.Estado = GenericResponseEnum.Invalido;
						response.Mensaje = responseData.Descripcion;
						break;
					default:
						response.Estado = GenericResponseEnum.Error;
						response.Mensaje = "Ocurrió un error en la operación";
						break;
				}
			}

			return response;
		}
	}
}
