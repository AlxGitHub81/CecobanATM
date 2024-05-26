using Ardalis.Result.AspNetCore;
using Ardalis.Result;
using Ardalis.Result.FluentValidation;
using Asp.Versioning;
using Microsoft.AspNetCore.Mvc;
using FluentValidation;
using CecobanATM.BLL.Interfaces;
using CecobanATM.API.Dtos;
using AutoMapper;
using CecobanATM.BLL.Dtos;
using CecobanATM.BLL.Enumeraciones;

namespace CecobanATM.API.Controllers
{
	[Route("api/v{version:apiVersion}/[controller]")]
	[ApiVersion("1.0")]
	public class AbonosController : Controller
	{
		private readonly IValidator<AbonoRequest> _AbonoValidator;
		private readonly IAbonos _ServicioAbonos;
		private readonly IMapper _Mapper;
		public AbonosController(IValidator<AbonoRequest> AbonoValidator, IAbonos servicioAbonos, IMapper mapper)
		{
			_AbonoValidator = AbonoValidator;
			_ServicioAbonos = servicioAbonos;
			_Mapper = mapper;
		}

		[TranslateResultToActionResult]
		[HttpPost]
		//[Route("RegistraAbono")]
		public async Task<Result<decimal>> Abono([FromBody] AbonoRequest AbonoData)
		{
			var validacion = await _AbonoValidator.ValidateAsync(AbonoData);

			if (!validacion.IsValid)
			{
				return Result.Invalid(validacion.AsErrors());
			}

			var abono = _Mapper.Map<AbonoDto>(AbonoData);

			var response = await _ServicioAbonos.RegistraAbono(abono);

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
