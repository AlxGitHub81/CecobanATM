﻿namespace CecobanATM.API.Dtos
{
	public class CargoRequest
	{
		public Int64 Numero { get; set; }
		public Decimal Monto { get; set; }
		public int Tipo { get; set; }
		public string TerminalKey { get; set; }
		public string Concepto { get; set; }

	}
}
