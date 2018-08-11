<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Login, App_Web_ta3bonb0" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


       <div class="Loginwrapper">

  <div class="google-header-bar  centered">
  <div class="header content clearfix">
  <img alt="Google" class="logo" src="App_Themes/User/images/Logo.jpg">
  </div>
  </div>
  <div class="main content clearfix">
<div class="banner">
<h1>
 
</h1>
  <h2 class="hidden-small">
  Sign in to continue to ITEP
  </h2>
</div>

<div class="one-google">
<asp:Login ID="Login2" runat="server">
        <LayoutTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            
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
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                        ValidationGroup="Login1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>

    </asp:Login>
  <p class="create-account">
  <a id="link-signup" href="Register.aspx">
  Create an account
  </a>
  </p>
<p class="tagline">
  Login and start Ans the Question
</p>

</div>
  </div>
  <div class="google-footer-bar">
  <div class="footer content clearfix">
  <ul id="footer-list" style="list-style-type:none;">
  <li>
  Download Material
  </li>
  <li>
  <a href="#" target="_blank">
  Ppts
  </a>
  </li>
  <li>
  <a href="#" target="_blank">
  Pdf
  </a>
  </li>

  <li>
  <a href="#" target="_blank">
  Videos
  </a>
  </li>

  <li>
  <a href="#" target="_blank">
  Videos
  </a>
  </li>
  </ul>
  
  </div>
</div>
  </div>


</asp:Content>

