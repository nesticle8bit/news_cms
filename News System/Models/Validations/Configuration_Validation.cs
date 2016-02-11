using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace News_System.Models
{
    [MetadataType(typeof(Configuration_Validation))]
    public partial class Configuration
    {
    }

    public class Configuration_Validation
    {
        [Required]
        [Display(Name = "Website Title")]
        public string WebsiteTitle { get; set; }
        [Required]
        public string Slogan { get; set; }
        [Required]
        public string Url { get; set; }
        [AllowHtml]
        [Display(Name = "Ads 300x250")]
        public string Ads_300 { get; set; }
        [AllowHtml]
        [Display(Name = "Ads 970x90")]
        public string Ads_970 { get; set; }
        [AllowHtml]
        [Display(Name = "Ads 728x90")]
        public string Ads_728 { get; set; }
        [Required]
        public string Email { get; set; }
        [AllowHtml]
        [Display(Name = "Google Analytics")]
        public string Analytics { get; set; }
        [Display(Name = "Disqus Name")]
        public string Disqus { get; set; }
    }
}