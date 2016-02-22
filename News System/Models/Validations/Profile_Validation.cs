using System.ComponentModel.DataAnnotations;

namespace News_System.Models
{
    [MetadataType(typeof(Profile_Validation))]
    public partial class Profile
    {
    }
    public class Profile_Validation
    {
        [Display(Name="Biography")]
        public string Bio { get; set; }
        public string Avatar { get; set; }
        public string Website { get; set; }
        public string MessengerName { get; set; }
        public string Company { get; set; }
        public string Profession { get; set; }
        [Display(Name = "Professional Interests")]
        public string ProfessionalInterests { get; set; }
        [Display(Name = "Professional Skills")]
        public string ProfessionalSkills { get; set; }
        public string Interests { get; set; }
        public string Hobbies { get; set; }
        [Display(Name = "Favorite TV Series")]
        public string FavoriteTVSerie { get; set; }
        [Display(Name = "Favorite Music")]
        public string FavoriteMusic { get; set; }
        [Display(Name = "Favorite Sports")]
        public string FavoriteSport { get; set; }
        [Display(Name = "Favorite Books")]
        public string FavoriteBooks { get; set; }
        [Display(Name = "Favorite Movies")]
        public string FavoriteMovies { get; set; }
        [Display(Name = "Favorite Food")]
        public string FavoriteFood { get; set; }
        [Display(Name = "My Heroes are")]
        public string Heroe { get; set; }
        [Display(Name = "Name")]
        public string Name { get; set; }
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
        public System.Nullable<System.DateTime> Birthday { get; set; }
    }
}