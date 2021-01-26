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
    public class AlbumController
    {
        #region Queries
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ArtistAlbums> Albums_GetArtistAlbums()
        {
            using(var context = new ChinookSystemContext())
            {
                IEnumerable<ArtistAlbums> results = from x in context.Albums
                                                    select new ArtistAlbums
                                                    {
                                                        Title = x.Title,
                                                        ReleaseYear = x.ReleaseYear,
                                                        ArtistName = x.Artist.Name
                                                    };
                return results.ToList();
               
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ArtistAlbums> Albums_GetAlbumsForArtist(int artistId)
        {
            using (var context = new ChinookSystemContext())
            {
                IEnumerable<ArtistAlbums> results = from x in context.Albums
                                                    where x.ArtistId == artistId
                                                    select new ArtistAlbums
                                                    {
                                                        Title = x.Title,
                                                        ReleaseYear = x.ReleaseYear,
                                                        ArtistName = x.Artist.Name,
                                                        ArtistId = x.ArtistId
                                                    };
                return results.ToList();

            }
        }
        #endregion
        //Query to return all data of album table
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<AlbumItem> Albums_List()
        {
            using (var context = new ChinookSystemContext())
            {
                IEnumerable<AlbumItem> results = from x in context.Albums
                                                    select new AlbumItem
                                                    {
                                                        AlbumId = x.AlbumId,
                                                        Title = x.Title,
                                                        ReleaseYear = x.ReleaseYear,
                                                        ArtistId = x.ArtistId,
                                                        ReleaseLabel = x.ReleaseLabel
                                                    };
                return results.ToList();

            }
        }
        //Query to look up an album record by primary key
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public AlbumItem Albums_FindById(int albumId)
        {
            using (var context = new ChinookSystemContext())
            {
                //(...).FirstOrDefault will return either
                //      a) the first record matching the where condition
                //      b) a null value
                var results = (from x in context.Albums
                              where x.AlbumId == albumId
                              select new AlbumItem
                              {
                                  AlbumId = x.AlbumId,
                                  Title = x.Title,
                                  ReleaseYear = x.ReleaseYear,
                                  ArtistId = x.ArtistId,
                                  ReleaseLabel = x.ReleaseLabel
                              }).FirstOrDefault();
                return results;
            }
        }
        #region Add, Update, Delete CRUD
        //Add (Can return nothing or primary key value)
        [DataObjectMethod(DataObjectMethodType.Insert,false)]
        public int Album_Add(AlbumItem item)
        {
            using (var context = new ChinookSystemContext())
            {
                //due to the fact we have seperaated handling of our entities
                //from the data traansfer beteen webapp and class library
                //using viewmodel classes, we must create an instaance of the entity
                //and move the data from the viewmodel class to the entity instance

                Album addItem = new Album
                {
                    //no pkey is set because it is an identity pkey so no value is needed
                    Title = item.Title,
                    ArtistId = item.ArtistId,
                    ReleaseLabel = item.ReleaseLabel,
                    ReleaseYear = item.ReleaseYear
                };
                //Staging
                //Setup in local memory
                //At this point you will not have sent anything to the database
                //therefore you will NOT have your new pkey as yet

                context.Albums.Add(addItem);
                //commit to database
                //on this command you
                //  a)executee entity validtion annotation
                //  b)send local memory staging to the database for execution
                //after successful execution your entity instance will have the new pkey(identity) value
                context.SaveChanges();

                //at this point entity instance is has the neww primay key value
                return addItem.AlbumId;
            }
        }
        //Update
        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void Album_Update(AlbumItem item)
        {
            using (var context = new ChinookSystemContext())
            {
                //due to the fact we have seperaated handling of our entities
                //from the data traansfer beteen webapp and class library
                //using viewmodel classes, we must create an instaance of the entity
                //and move the data from the viewmodel class to the entity instance

                Album updateItem = new Album
                {
                    //Update needs a pkey value 
                    AlbumId = item.AlbumId,
                    Title = item.Title,
                    ArtistId = item.ArtistId,
                    ReleaseLabel = item.ReleaseLabel,
                    ReleaseYear = item.ReleaseYear
                };
                //Staging
                //Setup in local memory

                context.Entry(updateItem).State = System.Data.Entity.EntityState.Modified;
                //commit to database
                //on this command you
                //  a)executee entity validtion annotation
                //  b)send local memory staging to the database for execution
                //after successful execution your entity instance will have the new pkey(identity) value
                context.SaveChanges();

            }
        }
        //Delete
        //When we do an ODS CRUD Delete, the ODS sends the entire instance record, 
        //  not just the pkey value
        //overload the Album_Delete method so it recieves a whole instnce
        //then call actual delete method passing just the pkey value to the actual delete method
        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public void Album_Delete(AlbumItem item)
        {
            Album_Delete(item.AlbumId);
        }

        //Actual delete method
        public void Album_Delete(int albumId)
        {
            using (var context = new ChinookSystemContext())
            {
                //example of physical delete
                //retrieve the current entity instasnce based on incoming param
                var exists = context.Albums.Find(albumId);
                //staged the remove
                context.Albums.Remove(exists);
                //commit the remove
                context.SaveChanges();
            }
        }
        #endregion
    }
}
