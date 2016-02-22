using System.ComponentModel.DataAnnotations;

namespace News_System.Models
{
    [MetadataType(typeof(Gender_Validation))]
    public partial class Gender
    {
    }
    public class Gender_Validation
    {
        [Display(Name="Gender")]
        public string Name { get; set; }
    }
}