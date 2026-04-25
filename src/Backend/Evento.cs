using System.ComponentModel.DataAnnotations;

namespace Backend.Models {
    public class Evento {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Nombre { get; set; } = string.Empty;
        public decimal Precio { get; set; }
        public int Stock { get; set; }
    }
}