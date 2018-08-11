using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessObject
{
    public class Answers:BaseClass
    {
        public int Id{get;set;}
        public string Ans { get; set; }
        public int QuestionId { get; set; }
        
        public int Votes { get; set; }
        
        public Question Question { get; set; }



    }
}
