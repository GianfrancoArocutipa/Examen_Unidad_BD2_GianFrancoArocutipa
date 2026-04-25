/* Gianfranco Arocutipa - Program.cs Configurado para Examen */
using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);

// 1. Configurar CORS (Permite que React se conecte a la API)
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader();
    });
});

// 2. Agregar Controladores y Swagger (OpenAPI)
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "API Ventas UPT", Version = "v1" });
});

var app = builder.Build();

// 3. Configurar el Pipeline de HTTP
// Forzamos Swagger tanto en desarrollo como en producción para facilitar la revisión
app.UseSwagger();
app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "API Ventas v1"));

app.UseHttpsRedirection();

// 4. Habilitar CORS
app.UseCors("AllowAll");

// 5. Mapear los Controladores
app.MapControllers();

// 6. Endpoint de Salud (Health Check para Render)
app.MapGet("/health", () => Results.Ok("API Online"));

app.Run();