using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespace
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
#endregion
namespace ChinookSystem.Entities
{
    [Table("Artists")]
    internal class Artist
    {
        //Demo for fully implemented property AS REVIEW check Name
        private string _Name; 
        [Key]
        public int ArtistId { get; set; }
        [StringLength(120, ErrorMessage = "Artist name is limited to 120 charcters")]
        public string Name 
        {
            get
            {
                return _Name;
            }
            set
            {
                _Name = string.IsNullOrEmpty(value) ? null : value;
            }
        }
        //navigational property 
        //one to many (parent to child) 
        public virtual ICollection<Album> Albums { get; set; }
    }
}
