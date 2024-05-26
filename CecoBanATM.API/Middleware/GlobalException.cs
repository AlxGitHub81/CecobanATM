using Ardalis.Result;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;

namespace CecoBanATM.API.Middleware
{
	public class GlobalExceptionHandler : IExceptionHandler
	{
		private readonly ILogger<GlobalExceptionHandler> logger;
		private readonly IHostEnvironment env;

		public GlobalExceptionHandler(ILogger<GlobalExceptionHandler> logger, IHostEnvironment env)
		{
			this.logger = logger;
			this.env = env;
		}



		public async ValueTask<bool> TryHandleAsync(HttpContext httpContext, Exception exception, CancellationToken cancellationToken)
		{
			logger.LogError(exception, "Ocurrio un error: {Message}", exception.Message);

			httpContext.Response.StatusCode = StatusCodes.Status500InternalServerError;

			var result = Result<ProblemDetails>
								.Error(
									errorMessage: env.IsDevelopment()
											? string.Concat(exception.Message, " ", exception.StackTrace?.ToString())
											: exception.Message);

			await httpContext.Response.WriteAsJsonAsync(result);

			return true;
		}
	}
}
