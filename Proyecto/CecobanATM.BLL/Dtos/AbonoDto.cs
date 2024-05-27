namespace CecobanATM.BLL.Dtos
{
	public class AbonoDto
	{
		public Int32 Numero { get; set; }
		public Decimal Monto { get; set; }
		public int Tipo { get; set; }
		public string TerminalKey { get; set; }
		public string Concepto { get; set; }
	}
}
