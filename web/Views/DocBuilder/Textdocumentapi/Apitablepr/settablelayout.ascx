<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTableLayout</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oTablePr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We set the table cells to preserve their size:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTablePr = oTableStyle.GetTablePr();
oTable = Api.CreateTable(3, 3);
oTablePr.SetTableLayout("fixed");
oTable.SetTableLook(true, true, true, true, false, false);
oTable.SetStyle(oTableStyle);
var oCell = oTable.GetRow(0).GetCell(0);
oCell.GetContent().GetElement(0).AddText("Fixed layout");
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableLayout.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>