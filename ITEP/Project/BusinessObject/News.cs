using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessObject
{
    public class News: BaseClass
    {
        public int Id { get; set; }
        public int CategoryId { get; set; }
        public int UploadTypeId { get; set; }
        public string TextArea { get; set; }
        public string ImagePath { get; set; }
        public string HeadLines { get; set; }

        public NewsCategory NewsCategory { get; set; }

        public UploadsType UploadsType { get; set; }
    }
}
