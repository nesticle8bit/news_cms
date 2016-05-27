using System;
using System.ComponentModel.DataAnnotations;

namespace News_System.Models
{
    [MetadataType(typeof(Post_Validation))]
    public partial class Post
    {
    }
    public class Post_Validation
    {
        [DisplayFormat(DataFormatString = "{0:MMMM dd, yyyy}")]
        public System.DateTime Time { get; set; }
        //Este es el contenedor de los Tags del View Create
        public string Tags { get; set; }
        [Display(Name="Disabled Comments")]
        public bool DisabledComments { get; set; }
    }
}