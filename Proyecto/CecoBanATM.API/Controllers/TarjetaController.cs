using Ardalis.Result;
using Ardalis.Result.AspNetCore;
using Ardalis.Result.FluentValidation;
using Asp.Versioning;
using AutoMapper;
using CecobanATM.API.Dtos;
using CecobanATM.BLL.Dtos.Tarjetas;
using CecobanATM.BLL.Enumeraciones;
using CecobanATM.BLL.Interfaces;
using FluentValidation;
using Microsoft.AspNetCore.Mvc;

namespace CecobanATM.API.Controllers
{
	[Route("api/v{version:apiVersion}/[controller]")]
	[ApiVersion("1.0")]
	public class TarjetaController : Controller
	{

		private readonly ITarjetas _TarjetasService;
		private readonly IValidator<CambioNIPRequest> _CambioValidator;
		private readonly IMapper _Mapper;

		public TarjetaController(ITarjetas tarjetasService,
											IValidator<CambioNIPRequest> cambioValidator,
											IMapper mapper)
		{
			_TarjetasService = tarjetasService;
			_CambioValidator = cambioValidator;
			_Mapper = mapper;
		}

		[TranslateResultToActionResult]
		[HttpPost]
		[Route("CambioNIP")]
		public async Task<Result<string>> CambioNIP([FromBody] CambioNIPRequest TarjetaData)
		{
			var validacion = await _CambioValidator.ValidateAsync(TarjetaData);

			if (!validacion.IsValid)	
			{
				return Result.Invalid(validacion.AsErrors());
			}

			var abono = _Mapper.Map<CambioNIPDto>(TarjetaData);

			var response =await  _TarjetasService.CambioNip(abono);

			switch (response.Estado)
			{
				case GenericResponseEnum.Correcto:
					return Result<string>.Success(response.Mensaje);
				case GenericResponseEnum.Invalido:
					return Result.Invalid(new ValidationError() { ErrorMessage = response.Mensaje });
				default:
					return Result.Error(response.Mensaje);
			}

		}
	}
}
