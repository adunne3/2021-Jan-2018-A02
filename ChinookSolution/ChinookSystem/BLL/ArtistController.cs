using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
#region Additional Namespaces
using ChinookSystem.DAL;
using ChinookSystem.Entities; //For sql and are internal
using ChinookSystem.ViewModels;//For data classes to transfer data from BLL to webapp
using System.ComponentModel; //For ODS wizard
#endregion
namespace ChinookSystem.BLL
{
    [DataObject]
    public class ArtistController
    {
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<SelectionList> Artists_DDLList()
        {
            using(var context = new ChinookSystemContext())
            {
                IEnumerable<SelectionList> results = from x in context.Artists
                                                     select new SelectionList
                                                     {
                                                         ValueField = x.ArtistId,
                                                         DisplayField = x.Name
                                                     };
                return results.ToList();
            }
        }
    }
}
