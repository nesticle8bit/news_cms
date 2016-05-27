using System.ComponentModel.DataAnnotations;

namespace News_System.Models
{
    [MetadataType(typeof(CivilStatus_Validation))]
    public partial class CivilStatus
    {
    }
    public class CivilStatus_Validation
    {
        [Display(Name="Civil Status")]
        public string Name { get; set; }
    }
}