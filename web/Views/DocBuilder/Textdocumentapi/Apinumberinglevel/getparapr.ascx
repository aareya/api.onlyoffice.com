<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetParaPr</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oNumbering, oNumLvl, oParaPr;
oNumbering = oDocument.CreateNumbering("numbered");
oNumLvl = oNumbering.GetLevel(0);
oParaPr = oNumLvl.GetParaPr();
oParaPr.SetSpacingLine(480, "auto");
oParaPr.SetJc("both");
oParaPr.SetIndFirstLine(720);
oParagraph = oDocument.GetElement(0);
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the first element of a parent numbered list which starts with '1'");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the second element of a parent numbered list which starts with '2'");
oParagraph.SetNumbering(oNumLvl);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetParaPr.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>