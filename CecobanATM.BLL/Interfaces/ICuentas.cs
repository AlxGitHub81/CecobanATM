using CecobanATM.BLL.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CecobanATM.BLL.Interfaces
{
	public interface ICuentas
	{
		Task<CuentaDto> GetById(Int32 id);
	}
}
