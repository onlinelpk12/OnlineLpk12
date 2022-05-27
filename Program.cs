using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineLpk12.Data.Context;
using OnlineLpk12.Services.Implementation;
using OnlineLpk12.Services.Interface;
using System.Net.Http.Headers;
using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter());
});
builder.Services.Configure<ApiBehaviorOptions>(options =>
{
    options.SuppressModelStateInvalidFilter = true;
});
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
string connectionString = builder.Configuration.GetConnectionString("OnlineLPK12");
builder.Services.AddDbContext<OnlineLpk12DbContext>(options => options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString)));
builder.Services.AddTransient<IStudentProgressService, StudentProgressService>();
builder.Services.AddTransient<IUserService, UserService>();
builder.Services.AddTransient<ISparcService, SparcService>();
builder.Services.AddTransient<ILogService, LogService>();
builder.Services.AddTransient<ITeacherService, TeacherService>();
builder.Services.AddTransient<IStudentService, StudentService>();

builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(
            builder =>
            {
                builder.WithOrigins("http://localhost:8080", "http://localhost:8081",
                    "http://localhost:8082", "http://localhost:8083",
                    "http://localhost:8084", "http://localhost:8085",
                    "http://localhost:8086", "http://127.0.0.1:5500",
                    "https://127.0.0.1:5500")
                .AllowAnyMethod()
                .AllowAnyHeader();
            });
});

builder.Services.AddHttpClient("Sparc", httpClient =>
{
    httpClient.BaseAddress = new Uri("http://wave.ttu.edu/ajax.php");
    httpClient.DefaultRequestHeaders.Clear();
    httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/x-www-form-urlencoded"));
    httpClient.DefaultRequestHeaders.Add("User-Agent", ".NET Foundation Repository Reporter");
});

var app = builder.Build();

// Configure the HTTP request pipeline.
//if (app.Environment.IsDevelopment())
//{
app.UseSwagger();
app.UseSwaggerUI();
//}
app.UseCors();
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
