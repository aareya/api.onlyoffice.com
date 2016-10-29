<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTableHeader</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell, oTableRow;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x90 table and set row #1 as the table header:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 90);
oTable.SetWidth("percent", 100);
oTableRow = oTable.GetRow(0);
oTableRow.SetTableHeader(true);
oCell = oTableRow.GetCell(0);
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("Header cell #1");
oCell = oTableRow.GetCell(1);
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("Header cell #2");
oCell = oTableRow.GetCell(2);
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("Header cell #3");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableHeader.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>