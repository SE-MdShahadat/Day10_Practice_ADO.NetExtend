using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO.NetExtend.Models
{
    public class Student
    {
        public int ID { get; set; }
        public int RollNo{ get; set; }
        public string Name{ get; set; }
        public int Age{ get; set; }
        public string Address{ get; set; }
        public int DepartmentID { get; set; }
        public string Department { get; set; }
    }
}
