<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetStyleColBandSize</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oTablePr;
oDocument.RemoveAllElements();
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTable = Api.CreateTable(4, 2);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oTablePr = oTableStyle.GetTablePr();
oTable.SetTableLook(true, true, true, true, true, true);
oTablePr.SetStyleColBandSize(2);
oTableStyle.GetConditionalTableStyle("bandedColumn").GetTextPr().SetBold(true);
oTable.GetRow(0).GetCell(0).GetContent().GetElement(0).AddText("Bold");
oTable.GetRow(0).GetCell(1).GetContent().GetElement(0).AddText("Bold");
oTable.GetRow(0).GetCell(2).GetContent().GetElement(0).AddText("Normal");
oTable.GetRow(0).GetCell(3).GetContent().GetElement(0).AddText("Normal");
oTable.GetRow(1).GetCell(0).GetContent().GetElement(0).AddText("Bold");
oTable.GetRow(1).GetCell(1).GetContent().GetElement(0).AddText("Bold");
oTable.GetRow(1).GetCell(2).GetContent().GetElement(0).AddText("Normal");
oTable.GetRow(1).GetCell(3).GetContent().GetElement(0).AddText("Normal");
oDocument.Push(oTable);
builder.SaveFile("docx", "SetStyleColBandSize.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>