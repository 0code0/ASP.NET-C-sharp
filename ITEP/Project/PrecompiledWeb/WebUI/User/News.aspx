<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="News, App_Web_btwqd1v2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="templatemo_main_leftcol">
                    <div class="templatemo_leftcol_subcol">

                        <div id="templatemo_topnews">
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
                                     <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Id") %>' />
                                        <asp:Image ID="Image1" CssClass="ImageMargin" ImageUrl="~/App_Themes/User/images/TechnologyNews.png" runat="server" />
                                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                                                SelectMethod="GetAllByCategory" TypeName="BusinessLogic.NewsBL">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="HiddenField1" Name="CategoryId" 
                                                        PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                        </asp:ObjectDataSource>

                                            <asp:Repeater ID="Repeater2" runat="server" 
                                         DataSourceID="ObjectDataSource2" >

                                            <ItemTemplate>
                 
                <li><asp:HyperLink ID="HyperLink2" NavigateUrl='<%# "~/User/News.aspx?Id="+ Eval("Id") %>' runat="server"><%# Eval("HeadLines") %></asp:HyperLink></li>
                                            
                                            <div class="Space10">
                                            </div>

                                            </ItemTemplate>

                                            </asp:Repeater>
                                            
                                        </ul> 
                                 
                                    </div>  

    

                                    
                                    <div class="newslist" id="newslistId">
                                        <h4 class="Headline"><%# Eval("Name") %></h4>
                                        <br/><br/>
                                    
                       <p class="NewsParagraph">
                                                        
                                            
                                            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                                                SelectMethod="GetSingle" TypeName="BusinessLogic.NewsBL">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
                                                </SelectParameters>
                                               
                                            </asp:ObjectDataSource>
                                            
                                            <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource3" 
                                                CellPadding="4" ForeColor="#333333">
                                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                <ItemTemplate>
                                
                                            <asp:Label ID="TextArea" runat="server" Text='<%# Eval("TextArea") %>' />
                                <div id="NewsTextAreaImage">
                                
                                </div>               
                                                </ItemTemplate>

                                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />

                                            </asp:FormView>
                                        </p>  
                                        
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

