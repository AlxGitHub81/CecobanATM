using CecobanATM.BLL.Dtos;
using CecobanATM.BLL.Enumeraciones;
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

		public async Task<GenericResponse<CargoDto>> RegistraCargo(CargoDto CargoData)
		{

			var response = new GenericResponse<CargoDto>();

			_repository.CreateConnection(DAL.Enumeraciones.DbConnectionEnum.ATMDB);

			IDictionary<string, object> parameters = new Dictionary<string, object>
			{
				{ "Parametros", JsonConvert.SerializeObject(CargoData)}
			};

			var SpResponses = await _repository.CallSP<SpGenericResponse>("Cargos_SP", parameters);

			var Response = SpResponses.FirstOrDefault();

			if (Response == null)
			{
				response.Estado = GenericResponseEnum.Error;
				response.Mensaje = "Ocurrió un error en la operación";
			}
			else
			{
				switch (Response.Resultado)
				{
					case 1:
						response.Estado = GenericResponseEnum.Correcto;
						response.Mensaje = "Operación realizada";
						break;
					case 2:
						response.Estado = GenericResponseEnum.Invalido;
						response.Mensaje = Response.Descripcion;
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
