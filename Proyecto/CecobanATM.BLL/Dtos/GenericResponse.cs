using CecobanATM.BLL.Enumeraciones;

namespace CecobanATM.BLL.Dtos
{
	public class GenericResponse<T>
	{
		public GenericResponseEnum Estado { get; set; }

		public string Mensaje { get; set; }

		public T? Entity { get; set; }

		public List<T?> ListaEntity { get; set; }
	}
}
