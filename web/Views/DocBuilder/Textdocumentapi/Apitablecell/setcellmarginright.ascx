<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetCellMarginRight</span>
</h1>

<h4 class="header-gray" id="SetCellMarginRight">SetCellMarginRight(nValue<sub>nullable</sub>)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellmarginright") %>">ApiTableCellPr.SetCellMarginRight</a>
                </li></ul></dd>
                </dl>
<p class="dscr">Specify the amount of space which will be left between the right extent of the cell contents and the border of a specific table cell within a table.</p>

            <h2>Parameters:</h2>
            <table class="table">
                    <thead>
                        <tr class="tablerow">
                            <td>Name</td>
                            <td>Type</td>
                            <td>Attributes</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr class="tablerow">
                        <td><em>nValue</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#twips">twips</a>
                        </td>
                        <td> &lt;nullable><br></td>
                        <td>The value for the amount of space to the right extent of the cell measured in twentieths of a point (1/1440 of an inch). If this value is <em>null</em>, then default table cell right margin will be used,otherwise the table cell right margin will be overridden with the specified value for the current cell.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and add a half an inch wide right margin to cell #1:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oCell = oTable.GetRow(0).GetCell(0);
oCell.SetCellMarginRight(720);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetCellMarginRight.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896354&doc=NEwrT2FQL2xCMmdUSlRlTXBWNitubzQxZ0xCbGhzMitCNWJySkRiYTA3VT0_IjQ4OTYzNTQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>