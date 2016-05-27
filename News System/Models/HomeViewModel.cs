using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace News_System.Models
{
    public class HomeViewModel
    {
        public IEnumerable<Post> Posts { get; set; }
        public IEnumerable<Category> Categories { get; set; }
    }
}