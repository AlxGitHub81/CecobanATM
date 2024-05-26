using Ardalis.Result.AspNetCore;
using Ardalis.Result;
using Ardalis.Result.FluentValidation;
using Asp.Versioning;
using CecobanATM.BLL.Dtos;
using Microsoft.AspNetCore.Mvc;
using FluentValidation;
using AutoMapper;
using CecobanATM.BLL.Interfaces;
using CecobanATM.API.Dtos;
using CecobanATM.BLL.Enumeraciones;

namespace CecobanATM.API.Controllers
{
	[Route("api/v{version:apiVersion}/[controller]")]
	[ApiVersion("1.0")]
	public class CargosController : Controller
	{
		private readonly IValidator<CargoRequest> _CargoValidator;
		private readonly IMapper _Mapper;
		private readonly ICargos _ServicioCargos;
		public CargosController(IValidator<CargoRequest> cargoValidator, IMapper mapper, ICargos servicioCargos)
		{
			_CargoValidator = cargoValidator;
			_Mapper = mapper;
			_ServicioCargos = servicioCargos;
		}

		[TranslateResultToActionResult]
		[HttpPost]
		public async Task<Result<decimal>> RegistraCargo([FromBody] CargoRequest CargoData)
		{

			var validacion = await _CargoValidator.ValidateAsync(CargoData);

			if (!validacion.IsValid)
			{
				return Result.Invalid(validacion.AsErrors());
			}

			var abono = _Mapper.Map<CargoDto>(CargoData);

			var response = await _ServicioCargos.RegistraCargo(abono);

			switch (response.Estado)
			{
				case GenericResponseEnum.Correcto:
					return Result.Success();
				case GenericResponseEnum.Invalido:
					return Result.Invalid(new ValidationError() { ErrorMessage = response.Mensaje });
				default:
					return Result.Error(response.Mensaje);
			}

		}
	}
}
