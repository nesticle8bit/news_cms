using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace News_System.Models
{
    [MetadataType(typeof(Social_Validation))]
    public partial class Social
    {
    }
    public class Social_Validation
    {
        [Display(Name="Url")]
        public string Link { get; set; }
    }
}