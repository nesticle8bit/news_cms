using System.ComponentModel.DataAnnotations;

namespace News_System.Models
{
    [MetadataType(typeof(Messenger_Validation))]
    public partial class Messenger
    {
    }
    public class Messenger_Validation
    {
        [Display(Name="Messenger")]
        public string Name { get; set; }
    }
}