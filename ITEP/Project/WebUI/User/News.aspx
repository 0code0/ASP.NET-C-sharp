<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="templatemo_main_leftcol"></div>
                    <div class="templatemo_leftcol_subcol">

                        <div id="templatemo_topnews" style = "margin:15px -46px 0 0;">
                            <h3>News Category</h3>
                        </div> 

                          <div class="tab_section">
                            <!-- start -->
                            <div id="NewsCategory">
                                
                            <ul id="countrytabs" class="shadetabs">
                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                                        SelectMethod="GetAll" TypeName="BusinessLogic.NewsCategoryBL"></asp:ObjectDataSource>

                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1" 
                                        onitemdatabound="Repeater1_ItemDataBound" 
                                        ondatabinding="Repeater1_DataBinding" ondisposed="Repeater1_Disposed" 
                                        oninit="Repeater1_Init" onitemcommand="Repeater1_ItemCommand" 
                                        onitemcreated="Repeater1_ItemCreated" onload="Repeater1_Load" 
                                        onprerender="Repeater1_PreRender" onunload="Repeater1_Unload">

                                    <ItemTemplate>
                                    
  <li><asp:HyperLink rel='<%# Eval("Name") %>'  NavigateUrl="~/User/News.aspx" ID="PageLoad" runat="server" 
     ><%# Eval("Name") %></asp:HyperLink></li>
                                    
                                    </ItemTemplate>
                                    </asp:Repeater>
                            </ul>

                        </div>
                    
                        </div>    


                    </div> <!-- end of left column -->

                    <div class="templatemo_leftcol_subcol" >
                        <div class="NewsAllStyle" >

                        <div class="tabcontent_section" id="tabcontent_sectionId">

                            <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                                SelectMethod="GetAll" TypeName="BusinessLogic.NewsCategoryBL"></asp:ObjectDataSource>
                      
                            <asp:Repeater ID="Repeater3" DataSourceID="ObjectDataSource4" runat="server">

                            <ItemTemplate>

                             <div id="<%# Eval("Name") %>" class="tabcontent">
                                               
                              <div class="topnews" id="topnewsId">
                              <ul>
                              <h4 class="Headline"><%# Eval("Name") %></h4>
                                        <br/><br/> 
                                     <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Id") %>' />
                                        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                                                SelectMethod="GetAllByCategory" TypeName="BusinessLogic.NewsBL">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="HiddenField1" Name="CategoryId" 
                                                        PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                        </asp:ObjectDataSource>

                           <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource2" >
                            <ItemTemplate>
      <div style="margin-left:-38px;">
      <asp:Image ID="Image1" Width = "60px" Height = "60px" runat="server" ImageUrl = '<%# Eval("ImagePath") %>' />
      </div>
                   
                               <div style="font-size:large;color:Navy;margin-left:37px;margin-top:-57px; ">
                            <%# Eval("HeadLines") %>
                            </div>
                                <div style="height:5px;">
                                </div>      
                                                  
                            <div style = "font-size:small;color:Black;margin-left:36px;">
                             <%# Eval("TextArea") %>
                            </div>
                       <div style="height:5px;">
                       </div>
      
      
                            </ItemTemplate>
                            </asp:Repeater>

                            
                                </ul> 
                                
                                    </div>  

    

                                    
                                </div>
                            
                            </ItemTemplate>
                            </asp:Repeater>    
                                

                             
                            </div>
                            
                            <script type="text/javascript">

                                var countries = new ddtabcontent("countrytabs")
                                countries.setpersist(true)
                                countries.setselectedClassTarget("link") //"link" or "linkparent"
                                countries.init()

                            </script>
                            <!-- end -->
       
                            </div>
                    </div>


                                 
                            
                        
                        
                        
</asp:Content>

