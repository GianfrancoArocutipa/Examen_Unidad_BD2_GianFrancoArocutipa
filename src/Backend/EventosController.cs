using Microsoft.AspNetCore.Mvc;
using Backend.Models;

namespace Backend.Controllers {
    [ApiController]
    [Route("api/[controller]")]
    public class EventosController : ControllerBase {
        [HttpGet]
        public IActionResult Get() {
            var eventos = new List<Evento> {
                new Evento { Id = 1, Nombre = "Concierto Rock UPT", Precio = 150.00m, Stock = 50 },
                new Evento { Id = 2, Nombre = "Festival de Teatro", Precio = 45.00m, Stock = 30 }
            };
            return Ok(eventos);
        }
    }
}