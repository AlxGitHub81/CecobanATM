using Ardalis.Result.AspNetCore;
using Ardalis.Result;
using Asp.Versioning;
using CecobanATM.BLL.Dtos;
using CecobanATM.BLL.Services;
using Microsoft.AspNetCore.Mvc;
using CecobanATM.BLL.Interfaces;

namespace CecoBanATM.API.Controllers
{
	[Route("api/v{version:apiVersion}/[controller]")]
	[ApiVersion("1.0")]
	public class CuentaController : Controller
	{
		private readonly ICuentas SrvCuentas;

		public CuentaController(ICuentas srvCuentas)
		{
			SrvCuentas = srvCuentas;
		}

		[TranslateResultToActionResult]
		[HttpGet]
		[Route("ConsultaMonto")]
		public async Task<Result<decimal>> ConsultaMonto([FromBody] Int32 Numero)
		{
			var response = await SrvCuentas.GetById(Numero);

			return Result.Success(response.Monto);
		}
	}
}
