using System.ComponentModel.DataAnnotations;

namespace News_System.Models
{
    [MetadataType(typeof(Comment_Validation))]
    public partial class Comment
    {
    }
    public class Comment_Validation
    {
        [Display(Name="Comment")]
        public string Comment1 { get; set; }
        [DisplayFormat(DataFormatString = "{0:MMMM dd, yyyy}")]
        public System.DateTime Time { get; set; }
    }
}