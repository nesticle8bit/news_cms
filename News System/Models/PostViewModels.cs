using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace News_System.Models
{
    public class PostViewModels
    {
        public Post Posts { get; set; }
        public IEnumerable<Comment> Comments { get; set; }
    }
}