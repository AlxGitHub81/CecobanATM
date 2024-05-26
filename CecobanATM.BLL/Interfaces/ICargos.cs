using CecobanATM.BLL.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CecobanATM.BLL.Interfaces
{
	public interface ICargos
	{
		Task<bool> RegistraCargo(CargoDto CargoData);
	}
}
