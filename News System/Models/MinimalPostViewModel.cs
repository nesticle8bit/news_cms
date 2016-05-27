using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace News_System.Models
{
    public class MinimalPostViewModel
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public DateTime Time { get; set; }
        public string Category { get; set; }
        public int Id_Category { get; set; }
        public DateTime DateStart { get; set; }
        public DateTime DateEnd { get; set; }
        public string Address { get; set; }
        public int Comments { get; set; }
    }
}