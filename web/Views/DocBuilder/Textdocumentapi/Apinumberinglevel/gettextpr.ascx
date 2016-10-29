<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetTextPr</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oNumbering, oNumLvl, oTextPr;
oNumbering = oDocument.CreateNumbering("numbered");
oNumLvl = oNumbering.GetLevel(0);
oTextPr = oNumLvl.GetTextPr();
oTextPr.SetBold(true);
oTextPr.SetFontFamily("Calibri");
oTextPr.SetFontSize(28);
oParagraph = oDocument.GetElement(0);
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the first element of a numbered list which starts with '1'");
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the second element of a numbered list which starts with '2'");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetTextPr.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>