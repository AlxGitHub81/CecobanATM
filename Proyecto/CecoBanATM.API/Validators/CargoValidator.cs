using CecobanATM.API.Dtos;
using FluentValidation;

namespace CecobanATM.BLL.Validators
{
	
	public class CargoValidator : AbstractValidator<CargoRequest>
	{
		public CargoValidator() {
			RuleFor(x => x.Numero)
				.NotEmpty().WithMessage("El número de cuenta es requerido")
				.Must(w => w.ToString().Length <= 10).WithMessage("La longitud de la cuenta debe ser máximo 10 caracteres");

			RuleFor(x => x.Monto)
				.NotEmpty().WithMessage("El importe es requerido");

			RuleFor(x => x.Monto)
				.GreaterThan(0).WithMessage("El importe debe ser mayor a cero");

			RuleFor(x => x.Monto)
				.LessThanOrEqualTo(8000).WithMessage("El importe debe ser menor a $8,000");
		}
	}
}
