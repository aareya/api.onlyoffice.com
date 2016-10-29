<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetVertAlign</span>
</h1>
<p class="dscr">
        Specify the alignment which will be applied to the contents of this run in relation to the defaultappearance of the run text:
        <ul>
            <li><b>"baseline"</b> - the characters in the current text run will be aligned by the default text baseline.</li>
            <li><b>"subscript"</b> - the characters in the current text run will be aligned below the default text baseline.</li>
            <li><b>"superscript"</b> - the characters in the current text run will be aligned above the default text baseline.</li>
        </ul>
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
oTextPr = oRun.GetTextPr();
oTextPr.SetFontSize(50);
oTextPr.SetVertAlign("superscript");
oParagraph.SetJc("left");
oRun.AddText("This is a text inside the shape with vertical alignment set to 'superscript'.");
oParagraph.AddElement(oRun);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "SetVertAlign.pptx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>