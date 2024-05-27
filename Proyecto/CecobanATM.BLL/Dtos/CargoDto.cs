using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CecobanATM.BLL.Dtos
{
	public class CargoDto
	{
		public Int64 Numero { get; set; }
		public Decimal Monto { get; set; }
		public int Tipo { get; set; }
		public string TerminalKey { get; set; }
		public string Concepto { get; set; }
	}
}
