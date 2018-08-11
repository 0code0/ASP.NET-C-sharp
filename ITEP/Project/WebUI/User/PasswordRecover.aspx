<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PasswordRecover.aspx.cs" Inherits="User_PasswordRecover" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="PasswordRecoveryStyle">
    
    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" 
        onsendingmail="PasswordRecovery1_SendingMail" BackColor="#FFFFCC" 
        BorderColor="#FFFFCC" BorderPadding="3" BorderStyle="Dotted">
        <MailDefinition From="NoReply@NoReply.com" Priority="High" Subject="Password">
        </MailDefinition>
    </asp:PasswordRecovery>

    </div>

</asp:Content>

