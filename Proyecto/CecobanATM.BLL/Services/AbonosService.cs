using CecobanATM.BLL.Dtos;
using CecobanATM.BLL.Enumeraciones;
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

		public async Task<GenericResponse<AbonoDto>> RegistraAbono(AbonoDto AbonoData)
		{
			var response = new GenericResponse<AbonoDto>();

			_repository.CreateConnection(DAL.Enumeraciones.DbConnectionEnum.ATMDB);

			IDictionary<string, object> parameters = new Dictionary<string, object>
			{
				{ "Opcion", 1 },
				{ "Parametros", JsonConvert.SerializeObject(AbonoData)}
			};

			var SpResponses = await _repository.CallSP<SpGenericResponse>("Abonos_SP", parameters);
					

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
