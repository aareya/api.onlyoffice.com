<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTableCellMarginTop</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We set the top margin for the cells in the table to be half an inch:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oTable.SetTableCellMarginTop(720);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableCellMarginTop.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>