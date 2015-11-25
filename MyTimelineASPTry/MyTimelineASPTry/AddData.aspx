﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddData.aspx.cs" Inherits="MyTimelineASPTry.AddData" Async="true" ViewStateMode="Enabled" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MyTimeline</title>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="MySecondTry1/css/MyTimeline.css" type="text/css" />
    <script src="MySecondTry1/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="MySecondTry1/js/jquery-ui.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />
</head>
<body>

    <asp:Label ID="labelId" runat="server" Text="Label"></asp:Label>
    <form runat="server" id="formMainForm">
        
        <div id="divAddEssentials" runat="server">

            <p>
                &nbsp;&nbsp; First name:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="firstName" runat="server"></asp:TextBox>
            </p>
            <p>
                Last name(s):&nbsp;&nbsp;
            <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
            </p>



            <div id="datesPosition">
                <p>
                    Date of birth:
                <input type="text" class="datepicker" id="dateBirth" runat="server" />
                </p>
                &nbsp;&nbsp;&nbsp;
         <p>
             Date of death
             <input type="text" class="datepicker" id="dateDeath" runat="server" />
         </p>
                &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="checkBoxContemporary" runat="server" Text="Contemporary" /><br />
                <br />
            </div>
            <asp:Label ID="labelImportance" runat="server" Text="Importance"></asp:Label>&nbsp;&nbsp;
        <input id="inputImportance" type="number" runat="server" max="100" min="0" style="width: 72px" /><br />
            <br />


            <div id="notEssential">
                <div id="gender">
                    <p>
                        *Gender:&nbsp;&nbsp;<asp:RadioButtonList ID="RadioButtonListGender" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </p>
                </div>
                <p>
                    &nbsp;*Profession :
                <asp:TextBox ID="textBoxProfession" runat="server"></asp:TextBox>
                    <p>
                        &nbsp;*Nationality :
                    <asp:TextBox ID="textBoxNationality" runat="server"></asp:TextBox>
                        <p>
                            &nbsp;*Religion :
                        <asp:TextBox ID="textBoxReligion" runat="server"></asp:TextBox>
                        </p>
            </div>


            <asp:Label ID="labelDescription" runat="server" Text="Description"></asp:Label><br />
            <asp:TextBox ID="textBoxDescription" TextMode="MultiLine" runat="server" Height="121px" Width="353px"></asp:TextBox><br />

            <asp:Label ID="labelImage" runat="server" Text="Link to image"></asp:Label><br />
            <asp:TextBox ID="textBoxImage" runat="server" Width="345px"></asp:TextBox><br />

            <asp:Label ID="labelLink" runat="server" Text="Link to aditional resources"></asp:Label><br />
            <asp:TextBox ID="textBoxLink" runat="server" Width="345px"></asp:TextBox>
            <br />
            <br />


            <asp:Button ID="buttonCancel" runat="server" Text="Cancel" OnClick="buttonCancel_Click" CssClass="essentialButtons"/>
            <asp:Button ID="buttonSubmit" runat="server" Text="Submit" OnClick="buttonSubmit_Click" Width="82px" CssClass="essentialButtons"/>


            <asp:Button ID="buttonModify" runat="server" Text="Modify" CssClass="essentialButtons" OnClick="buttonModify_Click" Width="90px"/>


            <br />



            <br />

            <script>
                $(function () {
                    $(".datepicker").datepicker({
                        changeYear: true,
                        changeMonth: true,
                        yearRange: "1:c"
                    });
                    $(".datepicker").datepicker("option", "dateFormat", "yy-mm-dd");

                });

                $(document).ready(function () {
                    if ('<%=setDate%>' == "True") {
                        $("#dateBirth").datepicker("setDate", '<%=dateBirth.Value.ToString()%>');
                        $("#dateDeath").datepicker("setDate", '<%=dateDeath.Value.ToString()%>');
                        //alert('<%=dateBirth.Value%>' + "" + '<%=dateDeath.Value%>');
                        //alert('<%=setDate%>');
                    }
                    if ('<%=showEssential%>' == "True")
                    {
                        $("#divAddEssentials").css("display", "block");
                        $("#divMainInfo").css("display", "none");
                    }
                    else {
                        $("#divAddEssentials").css("display", "none");
                        $("#divMainInfo").css("display", "block");
                    }
                });
                
                    
                
            </script>
        </div>








        <div id="divMainInfo" runat="server">
            <br />
            <asp:TextBox ID="textBoxId" runat="server" Width="128px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Search ID" OnClick="Button1_Click" />
            <br />

            <div id="divEssentialInfo" class="imageInline">
                <asp:Image ID="imageProfile" runat="server" Height="177px" Width="151px" />
            </div>
            <div class="imageInline" id="labelsInfo">
                <asp:Label ID="labelName" runat="server" Text="Name" CssClass="essentialLabels" Width="300px"></asp:Label><br />
                <asp:Label ID="labelDates" runat="server" Text="Dates" CssClass="essentialLabels" Width="300px"></asp:Label><br />
                <asp:Label ID="labelProfession" runat="server" Text="Profession" CssClass="essentialLabels" Width="300px"></asp:Label><br />
                <asp:Label ID="labelNationality" runat="server" Text="Nationality" CssClass="essentialLabels" Width="300px"></asp:Label><br />
                <asp:Label ID="labelReligion" runat="server" Text="Religion" CssClass="essentialLabels" Width="300px"></asp:Label><br />

                <asp:LinkButton ID="linkButtonEdit" runat="server" CssClass="linkLabel" OnClick="linkButtonEdit_Click"  OnClientClick="setDate()">edit</asp:LinkButton>

            </div>
            <br />

        
        <div id="ckEditor">
            <CKEditor:CKEditorControl ID="CKEditor1" BasePath="/ckeditor/" runat="server" Height="350" Width="1000"></CKEditor:CKEditorControl>
        </div>

        
            &nbsp;</p>
        <p>
            <asp:LinkButton ID="LinkButton2" runat="server">Add additional resources</asp:LinkButton>
        </p>
        <p>

        
            <asp:LinkButton ID="LinkButton1" runat="server">Add links to external resources</asp:LinkButton>
        </p>
        </div>
    </form>


</body>
</html>
