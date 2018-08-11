<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AnswerById.aspx.cs" Inherits="User_AnswerById" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

                <div id="templatemo_main_leftcol">

                    <div class="templatemo_leftcol_subcol">
                        <div class="regular_section" id="regular_section_ASK">

                            <div id="primaryContent" class="primaryContentClass">


                                <!--     Ask     -->

            <h2><asp:HyperLink ID="HyperLink1" NavigateUrl="~/User/UserAuthentication/AskQuestion.aspx" runat="server">Click Here To <b>Post a Question</b></asp:HyperLink></h2>
                           

                                <div id="Ask_Container">
            <div id="Title">
                <div id="Title_Left">
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                        SelectMethod="GetSingle" TypeName="BusinessLogic.QuestionBL">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>

                    <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource2">
                    <ItemTemplate>
                    
                    
                    
                    <p><%# Eval("Title") %>
                      <i><a  href="#" id="Title_Left_Click1">View  <%# Eval("NoOfViews") %></a></i><i><a  href="#" id=""></a></i></p>
                </div>

            </div>
            
    <div class="Hide">            
        
               <ul style="list-style-type: none;" >

                <li>
                    <div  id="Contant" class="Contant_Style">

               <p><%# Eval("Description") %>
                </p>
                     <samp class = "UserNameFont"><%# Eval("UserName") %></samp>  <samp class = "UserNameFont"><%# Eval("CreatedOn") %></samp>                    
                </div>
                </ItemTemplate>
                    </asp:FormView>
                    

            </li>


        </ul>
        <h2>Answers</h2>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllQuestion" 
                   TypeName="BusinessLogic.AnswerBL">
            <SelectParameters>
                <asp:QueryStringParameter Name="QuestionId" QueryStringField="Id" 
                    Type="Int32" />
            </SelectParameters>
                    </asp:ObjectDataSource>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">

        <ItemTemplate>
        
        <div id="Answer_Container">
                <div id="Answer_Left" class="Answer_Style" >
                <p><%# Eval("Ans") %>
                </p>
                    <samp class = "UserNameFont"><%# Eval("UserName") %></samp> <samp class = "UserNameFont"><%# Eval("CreatedOn") %></samp>
                     <span id="Vote" class = "UserNameFont"><a href="#">Vote: <%#Eval("Votes") %></a></span>

<div id="VoteStyle">
      <asp:ImageButton OnClick="lnkVoteUp_Click" CommandArgument='<%#Eval("Id") %>' ID="lnkVoteUp" ImageUrl="~/App_Themes/User/images/ThumbUp.png" runat="server" />
      <asp:ImageButton OnClick="lnkVoteDown_Click" CommandArgument='<%#Eval("Id") %>' ID="lnkVoteDown" ImageUrl="~/App_Themes/User/images/ThumbDown.png" runat="server" />

</div>          
            
        </div>
            </div>
            <div id="AnswerstyleId" style="height:1px; margin-bottom:2px;margin-top:20px; background-color:#fff2a6;">
            
            
            </div>
        </ItemTemplate>
        </asp:Repeater>
            

            <div id="Store" class="Contant_Style">
                <p id="Message"></p>

            </div>
                <br>
                    </br>
            <div id="Post">
             
             <script type="text/javascript">

                 function valid() {

                     var x = document.getElementById("editor1");
                     alert(x);
                 }

             </script> 

               <asp:TextBox runat="server"  ID="editor1" name="editor1" Width="350px" Height="100px" TextMode="MultiLine">

               </asp:TextBox>

             <a href="~/Login.aspx" id="answerwithoutsign" runat="server">
             
                 <div style="width: 350px;height: 100px; border: 1px #666666 double"
                        <br />
                        <div style="position:relative; margin-left:20px; margin-top:10px;">Login to Answer </div>
            </div>
             
             
              </a>

            </div>
    <asp:Button ID="Button2" class="Click" runat="server" onclick="Button2_Click" Text="Post" />
               
                                      
         </div>
    
                                
    </div>
        </div>
       
        </div>

                    </div>

                </div> <!-- end of left column -->




</asp:Content>

