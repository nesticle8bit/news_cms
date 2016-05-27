using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace News_System.Models
{
    [MetadataType(typeof(Sector_Validation))]
    public partial class Sector
    {
    }

    public class Sector_Validation
    {
        [Display(Name="Sector")]
        public string Name { get; set; }
    }
}