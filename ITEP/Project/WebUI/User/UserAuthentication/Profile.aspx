<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="User_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


                <div id="templatemo_main_leftcol">
                    <div class="templatemo_leftcol_subcol">
                            <div class="tab_section">
                            <!-- start -->
                            <div id="Profile">
                                <asp:Image ID="Image1" ImageUrl="~/App_Themes/User/images/Profile.jpeg" width="80px" height="100px" AlternateText="Pic Not Loaded"  runat="server" />
                                
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                    ShowMessageBox="True" ShowSummary="False" />
                                
                                <h3>Welcome:UserName </h3>
                            </div>
                            
                            <div id="NewsCategory">
                                <ul id="countrytabs" class="shadetabs">
                              
    <li><asp:HyperLink ID="HyperLink1" NavigateUrl="~/User/UserAuthentication/ManageUploads.aspx"   runat="server">All Upoads</asp:HyperLink></li>
    <li><asp:HyperLink ID="HyperLink3" NavigateUrl="#" rel="business"  runat="server">Change Password</asp:HyperLink></li>
    <li><asp:HyperLink ID="HyperLink4" NavigateUrl="#" rel="tech_science"  runat="server">Upoad File</asp:HyperLink></li>
    <li><asp:HyperLink ID="HyperLink5" NavigateUrl="~/User/UserAuthentication/AskQuestion.aspx"   runat="server">Post a Question</asp:HyperLink></li>
    
                            </ul>
                            </div>
                        </div>    
                          </div> <!-- end of left column -->

                    <div class="templatemo_leftcol_subcol" >
                        <div class="NewsStyle" >

                        <div class="tabcontent_section" id="tabcontentsectionId">

                                <div id="entertainment" class="tabcontent">
                                   
                                    <div class="newslist">
                                        
                             <div class="UploadDelete">
                  
                  
                  <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                         DataObjectTypeName="BusinessObject.Uploads" DeleteMethod="Delete" 
                         SelectMethod="GetAll" TypeName="BusinessLogic.UploadsBL" 
                             OldValuesParameterFormatString="original_{0}">
                         </asp:ObjectDataSource>
                                        
                     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" Width="100%" AutoGenerateColumns="False" 
                         DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" 
                         GridLines="None">
                         <AlternatingRowStyle BackColor="White" />
                       
                         <Columns>
                            
                             <asp:BoundField DataField="Title" HeaderText="Uploads" SortExpression="Title" />
                         <asp:CommandField ShowDeleteButton="True" />
                         </Columns>
                             <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                             <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                         <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                         <RowStyle Font-Size="Large" />
                         <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                         <SortedAscendingCellStyle BackColor="#FDF5AC" />
                         <SortedAscendingHeaderStyle BackColor="#4D0000" />
                         <SortedDescendingCellStyle BackColor="#FCF6C0" />
                         <SortedDescendingHeaderStyle BackColor="#820000" />

                     </asp:GridView>
                  
                  </div>
                

                      <a href="Profile.aspx?rel=tech_science" id="HyperLink18" rel="tech_science">Upload More</a>                 
                   
                    
                                    </div>
                                </div>

                                <div id="politics" class="tabcontent">
                                   <div class="topnews">
                                        <h4>Edit Profile</h4><br/><br/>
                                        <p> We highly recommend you create a unique password - one that you 
                                            don't use for any other websites. </p>
                                        <p>Note: You can't reuse your old password once you change it. </p>
                                        <a href="#">Learn more about choosing a smart password.</a>
                                    </div>
                                    <div class="newslist">
                                        
                                        <div id="EditProfile">
                                            
                                            
                                                <table width="100%" id="EditProfileTable">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label></td>
                                                </tr>
                                                    <tr>    
                                                <td>
                                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label></td>
                                                </tr>
                                                    <tr>
                                                <td>
                                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label></td>
                                                </tr>
                                                    <tr>
                                                <td> 
                                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label4" runat="server" Text="Mobile Number"></asp:Label></td>
                                                </tr>
                                                    <tr>
                                                <td><input type="number" placeHolder="New Mobile No"/></td>
                                            </tr>
                                                    <tr >  
                                                <td>
                                                    <asp:RadioButton ID="RadioButton1" Text = "Male" runat="server" GroupName ="Gender" checked="true"/>
                                                    <asp:RadioButton ID="RadioButton2" Text = "Female" runat="server" GroupName ="Gender"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input style="height: 30px; width: 210px;" type="submit" id="" class="SubmitEditProfile" value="Change"/></td>
                                            </tr>    
                                        </table>
                                        
                                       
                                            
                                        </div>              
                                        
                                    </div>
                                </div>

                                <div id="business" class="tabcontent">
                                    <div class="topnews">
                                        <h4>Change Your Password</h4><br/><br/>
                                        <p> We highly recommend you create a unique password - one that you 
                                            don't use for any other websites. </p>
                                        <p>Note: You can't reuse your old password once you change it. </p>
                                      
                                    </div>
                                    <div class="newslist">
                                        
                                        <div id="Password">
                                            
                                            
                                            
                                        <table id="ChangePassword">
                                            <tr>
                                            
                                            <td><asp:ChangePassword ID="ChangePassword1" runat="server">
                                            <LabelStyle Font-Bold="true" />
                                            </asp:ChangePassword> 
                                            </td>
                                            
                                            </tr>
                                        </table>
                                        
                                                    
                                      
                                            
                                            
                                        </div>  
                                        
                                            
                                    </div>
                                </div>
                                <div id="tech_science" class="tabcontent">


                                    <div class="topnews">
                                        <h4>File Upload</h4><br/><br/>
                                        <p> We highly recommend you create a unique password - one that you 
                                            don't use for any other websites. </p>
                                        <p>Note: You can't reuse your old password once you change it. </p>
                                      
                                    </div>
                                    <div class="newslist">
                                    <div id="UploadFile">

                                          <table width="100%" id="UploadFileform">
                                            
                                                <tr>
                                                    <td><label>Topic</label></td>

                                                <td>
                                                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                                                        SelectMethod="GetAll" TypeName="BusinessLogic.TopicsBL"></asp:ObjectDataSource>
                                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                                        DataSourceID="ObjectDataSource3" DataTextField="Name" DataValueField="Id" 
                                                        Height="25px" Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><label>Type</label></td>
                                                <td>
                                                   <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                                                        SelectMethod="GetAll" TypeName="BusinessLogic.UploadsTypeBL"></asp:ObjectDataSource>
                                                    <asp:DropDownList ID="DropDownList3" runat="server" 
                                                        DataSourceID="ObjectDataSource4" DataTextField="Name" DataValueField="Id" 
                                                        Height="25px" Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><label>Title</label></td>
                                                <td>
                                                    
           <asp:TextBox ID="UploadFileTitle" runat="server" Height="25px" Width="195px"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Please Enter The title of Topic" 
                    ControlToValidate="UploadFileTitle">*</asp:RequiredFieldValidator>

           
           </td>
        
                                            </tr>
                                            <tr>
                                                <td><label>File</label></td>
                                                <td>
                                                    <asp:FileUpload ID="FileUpload1" runat="server" 
                                                        ondatabinding="FileUpload1_DataBinding" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Please Select The File To Upload" ControlToValidate="FileUpload1">*</asp:RequiredFieldValidator>               
     
                                                  </td>
                                            </tr>
                                        
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <asp:Button ID="Button1" runat="server" CssClass="SubmitUploadFile" 
                                                        Text="Upload" onclick="Button1_Click" /></td>
                                            </tr>        
                                        </table>
                                        
                            
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
                    </div>
                </div> <!-- end of left column -->

                <div id="templatemo_main_rightcol">
            </div>

    
    
</asp:Content>

