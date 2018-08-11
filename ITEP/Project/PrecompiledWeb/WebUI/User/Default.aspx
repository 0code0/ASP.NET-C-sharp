<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="User_Default, App_Web_btwqd1v2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="templatemo_main_leftcol">
        <div class="templatemo_leftcol_subcol" id="templatemo_leftcol_subcolId">
            <div id="templatemo_topnews" class="templatemo_topnewsClass">
                <p>
                    The Education Portal Really comes into its own because of the amount of free education
                    material that actually earn you what you learn from books.
                </p>
            </div>
        </div>
        <!-- end of left column -->
        <div class="templatemo_leftcol_subcol">
            <div class="regular_section">
            </div>
            <div class="regular_section" id="regular_sectionLogin" style="margin-top:-30px"><!-- Replace-->
                <h2>
                    <asp:LoginView ID="LoginView1" runat="server">

                        <AnonymousTemplate>
                         Login to Explore more... 
                        </AnonymousTemplate>
                        
                    </asp:LoginView>
                 
                    <asp:HyperLink ID="regularsectionNews" runat="server">
                    
                      <div class="regular_section">
                <h2>Latest Update</h2>
                <div id="regularsectionNewscss">
                
                <marquee height="100%" direction="down" scrolldelay="1200" >
                

                <ul>
                <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" SelectMethod="GetLatestData"
                    TypeName="BusinessLogic.UploadsBL" ></asp:ObjectDataSource>
               <asp:Repeater DataSourceID="ObjectDataSource5" ID="Repeater5" runat="server">
               
               <ItemTemplate>
               
               <li style="font-size:10px">Latest File Upload<%# Eval("Title") %>
               <%# Eval("CreatedOn") %>
               </li>
               </ItemTemplate>
               </asp:Repeater> 
                
                
                </ul>

                </marquee>
                </div>
                
            </div>
                    
                    </asp:HyperLink>
                </h2>
                <div class="form_row">
                    <asp:Login ID="Login1" runat="server" 
                        PasswordRecoveryText="Forgot Your Password" 
                        PasswordRecoveryUrl="~/User/PasswordRecover.aspx" BackColor="#FFFBD6" 
                        BorderColor="#FFDFAD" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
                        Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" 
                        style="margin-left: 15px" TextLayout="TextOnTop">
                        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                        <LayoutTemplate>
                            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                <tr>
                                    <td>
                                        <table cellpadding="0">
                                            <tr>
                                                <td align="center" colspan="2">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                        ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                        ControlToValidate="Password" ErrorMessage="Password is required." 
                                                        ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color:Red;">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Height="30px" 
                                                        Text="Log In" ValidationGroup="Login1" Width="50px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:HyperLink ID="PasswordRecoveryLink" runat="server" 
                                                        NavigateUrl="~/User/PasswordRecover.aspx">Forgot Your Password</asp:HyperLink>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <LoginButtonStyle Width="50px" Height="30px" BackColor="White" 
                            BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" 
                            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
                        <TextBoxStyle Font-Size="0.8em" />
                        <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" 
                            ForeColor="White" />
                    </asp:Login>
                </div>
            </div>
            <div class="regular_section">
                <h2>
                    We Provide List Of Study Materials to Download</h2>
                <asp:ObjectDataSource ID="ObjectDataSource12" runat="server" SelectMethod="GetAll"
                    TypeName="BusinessLogic.UploadsTypeBL"></asp:ObjectDataSource>
                <ul style="list-style-type: none;" class="tabs">
                    <asp:Repeater ID="Repeater8" runat="server" DataSourceID="ObjectDataSource12">
                        <ItemTemplate>
                            <li>
                                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/User/Download.aspx"><%# Eval("Name") %></asp:HyperLink></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            
        </div>
        <div class="tab_section">
            <!-- start -->
            <ul id="countrytabs" class="shadetabs">
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetAll"
                    TypeName="BusinessLogic.NewsCategoryBL"></asp:ObjectDataSource>
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource2">
                    <ItemTemplate>
                        <li><a href="#" rel="<%# Eval("Name") %>" class="selected">
                            <%# Eval("Name") %></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div class="tabcontent_section">
                <asp:ObjectDataSource ID="ObjectDataSource13" runat="server"></asp:ObjectDataSource>
                <asp:Repeater ID="Repeater9" DataSourceID="ObjectDataSource2" runat="server">
                    <ItemTemplate>
                        <div id="<%# Eval("Name") %>" class="tabcontent">
                            <div class="newslist">
                                <h4>
                                    <%# Eval("Name") %></h4>
                                <p>
                                <ul>
                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("Id") %>' />
                                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="GetAllByCategory"
                                        TypeName="BusinessLogic.NewsBL">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenField1" Name="CategoryId" 
                                                PropertyName="Value" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="ObjectDataSource4">
                                        <ItemTemplate>
                                            <li>
                                                <asp:HyperLink ID="hyp4" NavigateUrl='<%#"~/User/News.aspx?Id="+Eval("Id") %>' runat="server"><%# Eval("HeadLines") %></asp:HyperLink></li>
                                                <spam ><%# Eval("CreatedOn") %></spam>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                                    
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
    <!-- end of left column -->
    <div id="templatemo_main_rightcol">
        <div class="templatemo_rcol_sectionwithborder">
            <div id="templatemo_video_section">
                <h2>
                    Latest Education Videos
                </h2>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="GetTopSixVideos"
                    TypeName="BusinessLogic.UploadsBL"></asp:ObjectDataSource>
                <asp:Repeater ID="Repeater3" DataSourceID="ObjectDataSource3" runat="server">
                    <ItemTemplate>
                        <div class="video_box">
    
                            <asp:HyperLink ID="HyperLink1" on NavigateUrl='<%# string.Format("~/User/AllVideos.aspx?Id={0}&TopicsId={1}",Eval("Id"),Eval("TopicsId")) %>' runat="server">
        <asp:Image ID="Image2" runat="server" AlternateText="ThumbNail" CssClass="VideoSize" ImageUrl="~/App_Themes/User/images/Video.png" />
                            </asp:HyperLink>         
<asp:HyperLink ID="Hyp1" NavigateUrl="#" runat="server"><span>Play:</span><%# Eval("Title") %></asp:HyperLink>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="view_all">
                    <asp:HyperLink ID="HyperLink33" NavigateUrl="~/User/AllVideos.aspx" runat="server">View All</asp:HyperLink>
                </div>
            </div>
        </div>
        <!------
        
        <div class="templatemo_rcol_sectionwithborder">
        <div id="templatemo_newsletter_section">
        
          </div>
        </div>
        
        
        -->
        <div class="Space10">
        
        </div>
        <div class="templatemo_rcol_sectionwithborder">
            <div id="templatemo_blog_section">
                <h2>
                    Answer The Question (Help Other)</h2>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetTopThreeQuestion"
                    TypeName="BusinessLogic.QuestionBL" 
                    OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
                
                
                
                <asp:Repeater ID="Repeater1"  DataSourceID="ObjectDataSource1"  runat="server">
                    
                    <ItemTemplate  >
                    
                        <div class="blog_box">
                            <h3>
                                <asp:HyperLink ID="HyperLink35"  NavigateUrl='<%# "~/User/AnswerById.aspx?Id="+ Eval("Id") %>' runat="server">
                                
                                <%# Eval("Title") %>
                                
                                </asp:HyperLink>
                            </h3>
                            Posted by  <asp:HyperLink ID="HyperLink36" NavigateUrl="#" runat="server"><span><%# Eval("UserName") %></span></asp:HyperLink>in
                            <asp:HyperLink ID="HyperLink37" NavigateUrl="#" runat="server"><span><%# Eval("CreatedOn") %></span></asp:HyperLink>
                            
                            <div class="datetime">
                             </div>
                        </div>
                    </ItemTemplate>
                <SeparatorTemplate>
                
                
                </SeparatorTemplate>
                </asp:Repeater>    
                
                   
                <div class="more_button">
                    <asp:HyperLink ID="HyperLink41" NavigateUrl="~/User/Question.aspx" runat="server">View All</asp:HyperLink>
               
                </div>
                
            </div>
        </div>
    </div>

      
</asp:Content>
