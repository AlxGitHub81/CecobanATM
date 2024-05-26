using CecobanATM.BLL.Dtos;
using CecobanATM.BLL.Interfaces;
using CecobanATM.DAL.Interfaces;
using Newtonsoft.Json;

namespace CecobanATM.BLL.Services
{
	public class CuentasService : ICuentas
	{
		private readonly ISPGenericRepository _genericRepository;

		public CuentasService(ISPGenericRepository genericRepository)
		{
			_genericRepository = genericRepository;
		}

		public async Task<CuentaDto> GetById(Int32 id)
		{

			IDictionary<string, object> parameters = new Dictionary<string, object>
			{
				{ "Opcion", 1 },
				{ "Parametros", JsonConvert.SerializeObject(new CuentaDto(){Numero=id})}
			};

			var response = await _genericRepository.CallSP<CuentaDto>("Cuentas_SP", parameters);

			return response.FirstOrDefault() ?? new CuentaDto();
		}
	}
}
