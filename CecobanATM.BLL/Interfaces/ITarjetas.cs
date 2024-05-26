using CecobanATM.BLL.Dtos.Tarjetas;

namespace CecobanATM.BLL.Interfaces
{
	public interface ITarjetas
	{
		Task<bool> CambioNip(CambioNIPDto tarjeta);

	}
}
