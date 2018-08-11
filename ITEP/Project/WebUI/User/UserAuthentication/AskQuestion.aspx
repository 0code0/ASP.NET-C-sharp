<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AskQuestion.aspx.cs" Inherits="AskQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 52px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="templatemo_main_leftcol" class="templatemo_main_leftcolClass">
                    <div class="templatemo_leftcol_subcol">

                        <div id="templatemo_gallery_section">
                            <center><h1>Menu</h1></center>
                            <h2><ul class="slideicon"  id="templatemo_gallery_section_ul">

         <li><asp:HyperLink ID="HyperLink1" NavigateUrl="#" runat="server">Ask Question</asp:HyperLink></li>
         <li><asp:HyperLink ID="HyperLink2" NavigateUrl="~/User/Question.aspx" runat="server">Answer Question</asp:HyperLink></li>
        <li>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                ShowMessageBox="True" ShowSummary="False" />
        </li>
                                
                                    

                                </ul></h2>
                        </div> 
                        
                    </div> <!-- end of left column -->

                    <div class="templatemo_leftcol_subcol" >

                        <div class="tab_section" >
                        <!-- start -->
                       
                        
                            
                             <div class="tabcontent_section" id="tabcontent_sectionDownloadId">
                            
                            <div id="PostQuestionContainer">

                                <div id="QuestionTitle">
                                    <table width="100%">
                                        <tr>
                                       <td class="style1">
                                           <asp:Label ID="Label1" Font-Size="Small" Font-Bold="true"  BorderColor="Chocolate" runat="server" Text="Title">
 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter the Question Title" 
                                                    ControlToValidate="QuestionTitleV">*</asp:RequiredFieldValidator>
                                                              
                                           </asp:Label></td>
                                       
                                         <td><asp:TextBox ID="QuestionTitleV" runat="server">
                                         
                                         </asp:TextBox>
                                        </td>
                                        </tr>
                                        
                                    </table>
                                </div>
                                <div id="QuestionImage">
                        <asp:Image ID="Image1" ImageUrl="~/App_Themes/User/images/icon.png" AlternateText="Profile" runat="server" />
                               
                                </div>
                                <div id="QuestionDetail">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label2" Font-Size="Small" Font-Bold="true" BorderColor="Chocolate" runat="server" Text="Explain">
                                         
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter the Description Of Question" 
                                    ControlToValidate="DescriptionV">*</asp:RequiredFieldValidator>
                                                                                   
                                                </asp:Label></td>
                                            <td>
                                                <asp:TextBox ID="DescriptionV" runat="server" TextMode="MultiLine">
                                                 
                                                </asp:TextBox></td>
                                            
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="SubmitAns" runat="server" 
                                                    Text="Post" onclick="SubmitAns_Click" 
                                                      ondisposed="SubmitAns_Disposed" />
                                                
  
                                                                    </td>
                                            
                                            <td>
                                             
                                                
                                            </td>
                                        </tr>  
                                    </table>
                                
                                </div>
                                </div>
                                             
                                 
                                             
                            </div>
                       
                        <!-- end -->

                    </div>


                    </div>
                    
                     
                </div> <!-- end of left column -->



   
</asp:Content>

