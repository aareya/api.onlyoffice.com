<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetEvenAndOddHdrFtr</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oFooter;
oParagraph = oDocument.GetElement(0);
var oSection = oDocument.CreateSection(oParagraph);
oParagraph.AddText("This is section #1 of the document. ");
oParagraph.AddText("It has a header and a footer for odd pages. ");
oParagraph.AddText("Scroll down to see the other pages.");
oHeader = oSection.GetHeader("default", true);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("This is an odd page header");
oFooter = oSection.GetFooter("default", true);
oParagraph = oFooter.GetElement(0);
oParagraph.AddText("This is an odd page footer");
oDocument.SetEvenAndOddHdrFtr(true);
oParagraph = Api.CreateParagraph();
var oSection = oDocument.CreateSection(oParagraph);
oSection.SetType("evenPage");
oParagraph.AddText("This is section #2 of the document. ");
oParagraph.AddText("It has a header and a footer for even pages. ");
oParagraph.AddText("Scroll down to see the other pages.");
oDocument.Push(oParagraph);
oHeader = oSection.GetHeader("even", true);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("This is an even page header");
oFooter = oSection.GetFooter("even", true);
oParagraph = oFooter.GetElement(0);
oParagraph.AddText("This is an even page footer");
oParagraph = Api.CreateParagraph();
var oSection = oDocument.CreateSection(oParagraph);
oSection.SetType("oddPage");
oParagraph.AddText("This is section #3 of the document. ");
oParagraph.AddText("It has a header and a footer for odd pages. ");
oParagraph.AddText("Scroll down to see the other pages.");
oDocument.Push(oParagraph);
var oSection = oDocument.GetFinalSection();
oSection.SetType("evenPage");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is section #4 of the document. ");
oParagraph.AddText("It has a header and a footer for even pages.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetEvenAndOddHdrFtr.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>