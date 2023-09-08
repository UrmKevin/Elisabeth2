<%@ Page Title="Home Page" Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head runat="server">
        <title>Elisabeth II sugupuu</title>
		<style>
			table
			{
			border-collapse: collapse;
			}
			tr
			{
			border: 1pt solid black;
			}
			td
			{
			border: 1pt solid black;
			}
		</style>
    </head>
    <body>
        <h1>Sugupuu ülesannete lahendamine</h1>
        <form id="form1" runat="server">
            <div>
                <asp:Xml runat="server"
                    DocumentSource="~/minuSugupuu.xml"
                    TransformSource="~/minuSugupuuLisa.xslt" />
            </div>
        </form>
    </body>
</html>