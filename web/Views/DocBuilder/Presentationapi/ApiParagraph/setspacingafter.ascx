<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSpacingAfter</span>
</h1>
<p class="dscr">
        Set the spacing after the current paragraph. If the value of the <code>isAfterAuto</code> parameter is <code>true</code>, then any value of the <code>nAfter</code> is ignored. If <code>isAfterAuto</code> parameter is not specified, then it will be interpreted as <code>false</code>.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(0, 0, 255), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(61, 74, 107), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("This is an example of setting a space after a paragraph. ");
oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ");
oParagraph.AddText("This is due to the fact that the first paragraph has this offset enabled.");
oParagraph.SetSpacingAfter(1440);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.");
oDocContent.Push(oParagraph);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "SetSpacingAfter.pptx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>