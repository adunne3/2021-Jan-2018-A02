﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
#region Additional Namespaces
using ChinookSystem.BLL;
using ChinookSystem.ViewModels;
#endregion
namespace WebApp.SamplePages
{
    public partial class SearchByDDL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                //this is first time 
                LoadArtistList();

            }
        }
        #region Error Handling ODS
        protected void SelectCheckForException(object sender, ObjectDataSourceStatusEventArgs e)
        {
            MessageUserControl.HandleDataBoundException(e);
        }
        #endregion
        protected void LoadArtistList()
        {
            ArtistController sysmgr = new ArtistController();
            List<SelectionList> info = sysmgr.Artists_DDLList();
            //assume data collection needs to be sorted
            info.Sort((x,y) =>x.DisplayField.CompareTo(y.DisplayField));

            //setup ddl
            ArtistList.DataSource = info;
            //ArtistList.DataTextField = "DisplayField";
            ArtistList.DataTextField = nameof(SelectionList.DisplayField);
            ArtistList.DataValueField = nameof(SelectionList.ValueField);
            ArtistList.DataBind();

            //prompt line
            ArtistList.Items.Insert(0, new ListItem("Select an item", "0"));
        }

        protected void SearchAlbums_Click(object sender, EventArgs e)
        {
            if(ArtistList.SelectedIndex == 0)
            {
                //index 0 is physically pointing to prompt line
                // "Select an artist for the search";
                //Using MessageUserControl for your own message

                //first version
                MessageUserControl.ShowInfo("Search Concern", "Select an artist");

                //second version

                ArtistAlbumList.DataSource = null;
                ArtistAlbumList.DataBind();
            }
            else
            {
                //user friendly error handling
                //normally when you leave web page to class library you want to have error handling
                //use MessageUserControl to handle errors which has try/catch EMBEDDED in its logic
                MessageUserControl.TryRun(() => 
                {
                    //standard lookup and assignment
                    AlbumController sysmgr = new AlbumController();
                    List<ChinookSystem.ViewModels.ArtistAlbums> info = sysmgr.Albums_GetAlbumsForArtist(int.Parse(ArtistList.SelectedValue));
                    ArtistAlbumList.DataSource = info;
                    ArtistAlbumList.DataBind();
                },"Success Message title", "Your success message here");

               
            }
        }
    }
}