using CecobanATM.BLL.Dtos;

namespace CecobanATM.BLL.Interfaces
{
	public interface IAbonos
	{
		Task<bool> RegistraAbono(AbonoDto AbonoData);
	}
}
