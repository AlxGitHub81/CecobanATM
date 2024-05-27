using CecobanATM.API.Extensiones;
using CecobanATM.API.Middleware;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddServices(builder.Configuration);
builder.Services.AddDBContext(builder.Configuration);
builder.Services.AddVersioning(builder.Configuration);
builder.Services.AddValidation(builder.Configuration);
builder.Services.AddMapper(builder.Configuration);

builder.Services.AddExceptionHandler<GlobalExceptionHandler>();
builder.Services.AddProblemDetails();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
	app.UseDeveloperExceptionPage();
	app.UseSwagger();
	app.UseSwaggerUI();
	
}

app.UseExceptionHandler();
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
