<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetConditionalTableStyle</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTableStyle, oTable, oCellContent;
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 100);
oDocument.Push(oTable);
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTable.SetStyle(oTableStyle);
oTable.SetTableLook(true, true, true, true, true, true);
oTableStyle.GetTablePr().SetTableBorderTop("single", 4, 0, 0, 0, 255);
oTableStyle.GetTablePr().SetTableBorderBottom("single", 4, 0, 0, 0, 255);
oTableStyle.GetTablePr().SetTableBorderLeft("single", 4, 0, 0, 0, 255);
oTableStyle.GetTablePr().SetTableBorderRight("single", 4, 0, 0, 0, 255);
oTableStyle.GetTablePr().SetTableBorderInsideV("single", 4, 0, 255, 0, 0);
oTableStyle.GetTablePr().SetTableBorderInsideH("single", 4, 0, 255, 0, 0);
oTableStyle.GetConditionalTableStyle("bandedColumn").GetTextPr().SetItalic(true);
oCellContent = oTable.GetRow(0).GetCell(0).GetContent();
oParagraph = oCellContent.GetElement(0);
oParagraph.AddText("This cell font is set to italic");
oCellContent = oTable.GetRow(1).GetCell(0).GetContent();
oParagraph = oCellContent.GetElement(0);
oParagraph.AddText("This cell font is also set to italic");
oCellContent = oTable.GetRow(0).GetCell(1).GetContent();
oParagraph = oCellContent.GetElement(0);
oParagraph.AddText("This set font remains default");
oCellContent = oTable.GetRow(1).GetCell(1).GetContent();
oParagraph = oCellContent.GetElement(0);
oParagraph.AddText("This set font also remains default");
builder.SaveFile("docx", "GetConditionalTableStyle.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>