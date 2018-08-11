<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="User_Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="templatemo_main_leftcol">

                    <div class="templatemo_leftcol_subcol">
                        <div class="regular_section" id="regular_section_ASK">

                            <div id="primaryContent" class="primaryContentClass">

                                
                                <!--     Ask     -->
                                <h2>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/User/UserAuthentication/AskQuestion.aspx">Click Here To <b>Post a Question</b></asp:HyperLink>
                                 </h2>

                                <div id="Ask_Container">
            <div id="Title">
                <div id="Title_Left"><h3>Recent Question</h3>
                
                </div>
               
            </div>
            
    <div class="Hide">            
        
               <ul style="list-style-type: none;" >

               
                <li>

                    <div  id="Contant" class="Contant_Style">

               <p>
                   <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                        SelectMethod="GetAllApprovedQuestion" TypeName="BusinessLogic.QuestionBL" 
                       OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
                  
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1" >
                <ItemTemplate>

                <div class="QuestionStyle">

                <spam id="View">views: <%# Eval("NoOfViews") %></spam>
                <spam id="Name"><%# Eval("UserName") %></spam>
                <spam id="Created"><%# Eval("CreatedOn") %></spam>
 
                </div>

                <p>
  
 <!-- cut-->

  <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# "~/User/AnswerById.aspx?Id="+ Eval("Id") %>' 
           
           
           runat="server"><%# Eval("Title") %></asp:HyperLink>
                          
              <div style="width:100%; height:10px;background-color:White;">
               
               </div> 
                </p>
               
                </ItemTemplate>
                
                    </asp:ListView>
                   <asp:DataPager ID="DataPager1" PagedControlID="ListView1" runat="server">

                   <Fields>
                   
                   <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" ShowLastPageButton="true" 
                   
                                        ShowNextPageButton="true"

                                        ShowPreviousPageButton="true" />
                   </Fields>
                   </asp:DataPager>
                                          
                    </div>
                    </li>
            </ul>
             </div>
    
                                
    </div>
        </div>
       
        </div>

                    </div>

                </div> <!-- end of left column -->


             

</asp:Content>

