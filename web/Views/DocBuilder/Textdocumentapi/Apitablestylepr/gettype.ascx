<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetType</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTable, oTableStyle, oTableStylePr;
oTableStyle = oDocument.GetStyle("Bordered - Accent 5");
oTableStyle.SetName("My Custom Style");
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 100);
oTableStylePr = oTableStyle.GetConditionalTableStyle("topLeftCell");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
var oTableStylePrType = oTableStylePr.GetType();
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Style type = " + oTableStylePrType);
builder.SaveFile("docx", "GetType.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>