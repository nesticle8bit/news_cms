using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace News_System.Models
{
    public class AdminViewModels
    {
        public IEnumerable<Post> Post { get; set; }
        public IEnumerable<Comment> Comment { get; set; }
    }
}