
using Asp.Versioning;
using CecobanATM.BLL.Interfaces;
using CecobanATM.BLL.Services;
using CecobanATM.DAL.Enumeraciones;
using CecobanATM.DAL.Implementacion;
using CecobanATM.DAL.Interfaces;
using FluentValidation;
using System.Reflection;

namespace CecoBanATM.API.Extensiones
{
	public static class AddDependenciesExtension
	{
		public static void AddServices(this IServiceCollection services, IConfiguration configuration)
		{

			services.AddTransient<ISPGenericRepository, SPGenericRepository>();
			services.AddScoped<IAbonos, AbonosService>();
			services.AddScoped<ICargos, CargosService>();
			services.AddScoped<ICuentas, CuentasService>();
			services.AddScoped<ITarjetas, TarjetasService>();
			
		}

		public static void AddDBContext(this IServiceCollection services, IConfiguration configuration)
		{
			var connectionDict = new Dictionary<DbConnectionEnum, string>
			{
				{ DbConnectionEnum.ATMDB, configuration.GetConnectionString("ATM") },
			};

			services.AddSingleton<IDictionary<DbConnectionEnum, string>>(connectionDict);
		}

		public static void AddVersioning(this IServiceCollection services, IConfiguration configuration)
		{
			services.AddApiVersioning(o =>
			{
				o.AssumeDefaultVersionWhenUnspecified = true;
				o.DefaultApiVersion = new ApiVersion(1, 0);
				o.ReportApiVersions = true;
				o.ApiVersionReader = ApiVersionReader.Combine(
						new QueryStringApiVersionReader("api-version"),
						new HeaderApiVersionReader("x-version"),
						new MediaTypeApiVersionReader("ver"));
			})
			.AddApiExplorer(opt =>
			{
				opt.SubstituteApiVersionInUrl = true;
				opt.GroupNameFormat = "'v'VW";
			});
		}


		public static void AddValidation(this IServiceCollection services, IConfiguration configuration)
		{
			services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());
		}

		public static void AddMapper(this IServiceCollection services, IConfiguration configuration)
		{
			services.AddAutoMapper(Assembly.GetExecutingAssembly());
		}

	}
}
