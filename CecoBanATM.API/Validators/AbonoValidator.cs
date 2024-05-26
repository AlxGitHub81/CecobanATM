using CecobanATM.API.Dtos;
using FluentValidation;


namespace CecobanATM.BLL.Validators
{
	public class AbonoValidator:AbstractValidator<AbonoRequest>
	{
		public AbonoValidator() {

			RuleFor(x => x.Numero)
				.NotEmpty().WithMessage("El número de cuenta es requerido");

			RuleFor(x => x.Monto)
				.NotEmpty().WithMessage("El importe es requerido");

			RuleFor(x => x.Monto)
				.GreaterThan(0).WithMessage("El importe debe ser mayor a cero");

			RuleFor(x => x.Monto)
				.LessThanOrEqualTo(25000).WithMessage("El importe debe ser menor a $25,000");


		}
	}
}
