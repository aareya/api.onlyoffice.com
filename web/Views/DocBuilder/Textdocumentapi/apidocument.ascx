<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiDocument</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr, oTextPr, oRun;
var oNoSpacingStyle = oDocument.GetStyle("No Spacing");
var oSection = oDocument.GetFinalSection();
var oHeader = oSection.GetHeader("default", true);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("This is the text in the default header");
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetFontSize(22);
oTextPr.SetLanguage("en-US");
oTextPr.SetFontFamily("Calibri");
oParaPr = oDocument.GetDefaultParaPr();
oParaPr.SetSpacingLine(276, "auto");
oParaPr.SetSpacingAfter(200);
var oNormalStyle = oDocument.GetDefaultStyle("paragraph");
oParaPr = oNormalStyle.GetParaPr();
oParaPr.SetSpacingLine(240, "auto");
oParaPr.SetJc("both");
oTextPr = oNormalStyle.GetTextPr();
oTextPr.SetColor(0x26, 0x26, 0x26, false);
var oHeading1Style = oDocument.CreateStyle("Heading 1", "paragraph");
oParaPr = oHeading1Style.GetParaPr();
oParaPr.SetKeepNext(true);
oParaPr.SetKeepLines(true);
oParaPr.SetSpacingAfter(240);
oTextPr = oHeading1Style.GetTextPr();
oTextPr.SetColor(0xff, 0x68, 0x00, false);
oTextPr.SetFontSize(40);
oTextPr.SetFontFamily("Calibri Light");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oHeading1Style);
oParagraph.AddText("This is a heading");
oParagraph = Api.CreateParagraph();
oRun = Api.CreateRun();
oRun.AddText("Number of paragraph elements at this point: ");
oRun.AddTabStop();
oRun.AddText("" + oParagraph.GetElementsCount());
oRun.AddLineBreak();
oParagraph.AddElement(oRun);
oRun.AddText("Number of paragraph elements after we added a text run: ");
oRun.AddTabStop();
oRun.AddText("" + oParagraph.GetElementsCount());
oDocument.Push(oParagraph);
var oNumbering = oDocument.CreateNumbering("bullet");
var oNumLvl;
for (var nLvl = 0; nLvl < 8; ++nLvl)
{
  oNumLvl = oNumbering.GetLevel(nLvl);
  oParagraph = Api.CreateParagraph();
  oParagraph.AddText("Default bullet lvl " + (nLvl + 1));
  oParagraph.SetNumbering(oNumLvl);
  oParagraph.SetContextualSpacing(true);
  oDocument.Push(oParagraph);
}
builder.SaveFile("docx", "ApiDocument.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>