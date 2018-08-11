<%@ Page Title=""  Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AllVideos.aspx.cs" Inherits="User_AllVideos" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

                                <div class="tab_section" >
                        <!-- start -->
                        <ul id="countrytabs" class="shadetabs">
                            <li><a href="#" rel="entertainment">Videos</a></li>
                          
                        </ul>

                        <div class="tabcontent_section" id="tabcontent_sectionAllVideos">
                            
                        
                            
                            <div id="entertainment" class="tabcontent">
                    <div class="topnews" id="topnewsScrolling" >
        
                
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetVideos" TypeName="BusinessLogic.UploadsBL"></asp:ObjectDataSource>

                                    <asp:Repeater ID="Repeater1" runat="server" 
            DataSourceID="ObjectDataSource1">
                                    <ItemTemplate>
                    
                    
                    <asp:HyperLink ID="HyperLink1" onload="HyperLink1_Load" NavigateUrl='<%# string.Format("~/User/AllVideos.aspx?Id={0}&TopicsId={1}",Eval("Id"),Eval("TopicsId")) %>' runat="server">
     <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/User/images/Video.png" />
                                </asp:HyperLink>
   

            <asp:HyperLink ID="Hyp1" NavigateUrl="#" runat="server"><span>Play:</span></asp:HyperLink>   
                                    <%# Eval("Title") %>
                                    <br /><br />

                    
                                    </ItemTemplate>
                                    </asp:Repeater>
                                
        
                
                    
                    </div>
                             <div class="newslist" >
                    
                                    
          <div id="VideoPlay">
                             <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetSingle" 
                                    TypeName="BusinessLogic.UploadsBL">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
        </SelectParameters>
                                </asp:ObjectDataSource>
                    
    <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource2">
    <ItemTemplate>
    <h4><%# Eval("Title") %></h4>
     <iframe width="420" height="345"
src='<%# Eval("Path") %>'>
</iframe>
            
    
    </ItemTemplate>
    </asp:FormView>
                                
          
          
          </div>            
                        
                      <div class="RelatedVideo">
                        <h4>Related Videos</h4>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
            SelectMethod="GetRelatedVideos" TypeName="BusinessLogic.UploadsBL" 
                            OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:QueryStringParameter Name="TopicsId" QueryStringField="TopicsId" 
                    Type="Int32" />
            </SelectParameters>
                        </asp:ObjectDataSource>

                                    <asp:Repeater ID="Repeater2" runat="server" 
            DataSourceID="ObjectDataSource3">
                                    <ItemTemplate>
 <asp:HyperLink ID="HyperLink1" onload="HyperLink1_Load" NavigateUrl='<%# "~/User/AllVideos.aspx?Id="+Eval("Id") %>' runat="server">
     <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/User/images/Video.png" />
                                </asp:HyperLink>
   

          
                                    </ItemTemplate>
                                    </asp:Repeater>
                                
                    
                                </div>
                               
                              </div>
                       
                            </div>

                            
                         
                            
                            
                            
                        </div>

                        <script type="text/javascript">

                            var countries = new ddtabcontent("countrytabs")
                            countries.setpersist(true)
                            countries.setselectedClassTarget("link") //"link" or "linkparent"
                            countries.init()

                        </script>
                        <!-- end -->
                        
                        
                    </div>
    
    
                       
                          
</asp:Content>

