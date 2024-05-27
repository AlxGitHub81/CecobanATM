using CecobanATM.API.Dtos;
using CecobanATM.BLL.Dtos.Tarjetas;
using AutoMapper;
using CecobanATM.BLL.Dtos;

namespace CecobanATM.API.Mapper
{
	public class AutoMapperProfile:Profile
	{
		public AutoMapperProfile() {

			CreateMap<CambioNIPRequest, CambioNIPDto>();
			CreateMap<AbonoRequest, AbonoDto>();
			CreateMap<CargoRequest, CargoDto>();
		}
	}
}
