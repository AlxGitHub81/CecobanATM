using CecobanATM.API.Dtos;
using FluentValidation;

namespace CecobanATM.API.Validators.Tarjeta
{
	public class CambioNipValidator : AbstractValidator<CambioNIPRequest>
	{
		public CambioNipValidator()
		{
			RuleFor(x => x.Numero)
				.NotEmpty().WithMessage("El número de cuenta es obligatorio")
				.Must(w => w.ToString().Length <= 10).WithMessage("La longitud de la cuenta debe ser máximo 10 caracteres");

			RuleFor(x => x.Codigo)
				.NotEmpty().WithMessage("El código nip es obligatorio");

			RuleFor(x => x.CodigoNuevo)
				.NotEmpty().WithMessage("El código nip es obligatorio");

		}
	}
}
