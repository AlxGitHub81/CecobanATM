using CecobanATM.BLL.Dtos;

namespace CecobanATM.BLL.Interfaces
{
	public interface ICargos
	{
		Task<GenericResponse<CargoDto>> RegistraCargo(CargoDto CargoData);
	}
}
