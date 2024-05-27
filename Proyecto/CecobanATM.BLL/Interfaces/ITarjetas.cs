using CecobanATM.BLL.Dtos;
using CecobanATM.BLL.Dtos.Tarjetas;

namespace CecobanATM.BLL.Interfaces
{
	public interface ITarjetas
	{
		Task<GenericResponse<CambioNIPDto>> CambioNip(CambioNIPDto tarjeta);

	}
}
