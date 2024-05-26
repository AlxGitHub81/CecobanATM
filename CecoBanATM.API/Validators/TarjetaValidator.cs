using CecobanATM.API.Dtos;
using FluentValidation;

namespace CecobanATM.API.Validators.Tarjeta
{
	public class CambioNipValidator : AbstractValidator<CambioNIPRequest>
	{
		public CambioNipValidator()
		{
			RuleFor(x => x.Numero)
				.NotEmpty().WithMessage("El número de cuenta es obligatorio");

			RuleFor(x => x.Codigo)
				.NotEmpty().WithMessage("El código nip es obligatorio");

			RuleFor(x => x.CodigoNuevo)
				.NotEmpty().WithMessage("El código nip es obligatorio");

		}
	}
}
