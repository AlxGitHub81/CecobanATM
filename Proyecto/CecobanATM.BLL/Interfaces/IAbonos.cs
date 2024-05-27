using CecobanATM.BLL.Dtos;

namespace CecobanATM.BLL.Interfaces
{
	public interface IAbonos
	{
		Task<GenericResponse<AbonoDto>> RegistraAbono(AbonoDto AbonoData);
	}
}
