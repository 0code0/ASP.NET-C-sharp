<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Download.aspx.cs" Inherits="Download" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


  <div id="templatemo_main_leftcol" class="templatemo_main_leftcolClass">
                    <div class="templatemo_leftcol_subcol">

                        <div id="templatemo_topnews">
                            <h1>Select the Branch</h1>
                            <asp:ObjectDataSource ID="ObjectDataSource4" runat="server"></asp:ObjectDataSource>                  
                            <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
                                TypeName="BusinessLogic.BranchBL"></asp:ObjectDataSource>
                            <asp:DropDownList ID="DropDownList1" Width="200px" runat="server" 
                                DataSourceID="ObjectDataSource5" DataTextField="Name" DataValueField="Id">
                            </asp:DropDownList>

                            <asp:Button runat="server" ID="btnGetSubjects" Text="Get Subjects" 
                                onclick="btnGetSubjects_Click" />

                        </div> 

                        
                        <div id="templatemo_gallery_section">
                            <asp:Literal ID="Literal1" runat="server"><h1>Select the Subject</h1></asp:Literal>
                            

                          
                              <asp:TreeView ID="TreeView1" Expanded = "True" SelectAction = "Expand" runat="server" ImageSet="XPFileExplorer" 
                                NodeIndent="15" ShowLines="True">

                                <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                            
                                <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" 
                                    HorizontalPadding="2px" NodeSpacing="0px" VerticalPadding="2px" />
                            
                                <ParentNodeStyle Font-Bold="False" />
                            
                                <SelectedNodeStyle Font-Underline="False" 
                                    HorizontalPadding="0px" VerticalPadding="0px" BackColor="#B5B5B5" />
                            
                            </asp:TreeView>
                            
                            
                        </div> 
                        
                    </div> <!-- end of left column -->

                    <div class="templatemo_leftcol_subcol" >
                      

                    <div style = "float:left">
                        <div class="tab_section" >
                        <!-- start -->
                        <ul id="countrytabs" class="shadetabs">
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                                SelectMethod="GetAll" TypeName="BusinessLogic.UploadsTypeBL"></asp:ObjectDataSource>
                         
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
                         <ItemTemplate>
 
                   
 <li><a href='Profile.aspx?UploadTypeId="<%# Eval("Id") %>"' rel="<%# Eval("Name") %>" id="" ><%# Eval("Name") %></a></li>
                                            
                         </ItemTemplate>
                         
                            </asp:Repeater>
           
           
            <li>
                
            <asp:HyperLink ID="HyperLink1"  NavigateUrl="~/User/UserAuthentication/Profile.aspx" runat="server">Upload</asp:HyperLink>
            </li> 
            
            </ul>

                        <div class="tabcontent_section" id="tabcontent_sectionDownloadId">
                            <asp:ObjectDataSource ID="ObjectDataSource2" SelectMethod="GetAll" TypeName="BusinessLogic.UploadsTypeBL" runat="server"></asp:ObjectDataSource>

                            <asp:Repeater ID="Repeater2" DataSourceID="ObjectDataSource2" runat="server">
                            <ItemTemplate>


                            <div id="<%# Eval("Name") %>" class="tabcontent">
                                
                                <div class="newslist">
                                    <h4>Files to be Downloaded</h4>
                                
                                     <ul>
                         <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Id") %>' />       
                                    <asp:ObjectDataSource ID="ObjectDataSource3" TypeName="BusinessLogic.UploadsBL" 
                                        SelectMethod="GetAllByCategoryAndTopicApproved" runat="server" 
                                        OldValuesParameterFormatString="original_{0}">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenField1" Name="UploadsTypeId" 
                                                PropertyName="Value" Type="Int32" />
                                            <asp:QueryStringParameter Name="TopicId" QueryStringField="Id" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>          
                                    <asp:Repeater ID="Repeater3" DataSourceID="ObjectDataSource3" runat="server">
                                    
                                    <ItemTemplate>
                                

     <li><asp:HyperLink ID="HyperLink2" CssClass="DownloadFont" NavigateUrl='<%# Eval("Path") %>' runat="server"><%# Eval("Title")%></asp:HyperLink></li>
                                       
     

                                    
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

                    </div>
                    
                    
                </div> <!-- end of left column -->

    </asp:Content>

