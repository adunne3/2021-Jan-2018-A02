﻿using System;
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
                                                        ArtisId = x.ArtistId
                                                    };
                return results.ToList();

            }
        }
    }
}
