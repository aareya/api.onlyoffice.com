<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetCommentsReport</span>
</h1>

<h4 class="header-gray" id="GetCommentsReport">GetCommentsReport()</h4>

<p class="dscr">Get a report about all the comments added to the document.</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd><em>object</em></dd>
</dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.OpenFile("DocumentWithComments.docx");
var oDocument = Api.GetDocument();
GlobalVariable["CommentsReport"] = oDocument.GetCommentsReport();
builder.CloseFile();

builder.CreateFile("docx");
var oCommentsReport = GlobalVariable["CommentsReport"];
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Comments report");
var nRows = 1;
for (var sUserName in oCommentsReport)
{
    nRows += oCommentsReport[sUserName].length;
}
var nCols = 6;
var oTable = Api.CreateTable(nCols, nRows);
oDocument.Push(oTable);
function privateFillCell(nCurRow, nCurCol, sText)
{
    var oRow         = oTable.GetRow(nCurRow);
    var oCell        = oRow.GetCell(nCurCol);
    var oCellContent = oCell.GetContent();
    var oRun         = oCellContent.GetElement(0).AddText(sText);
    return {Cell : oCell, Run : oRun};
}
privateFillCell(0, 0, "Name");
privateFillCell(0, 1, "Date");
privateFillCell(0, 2, "");
privateFillCell(0, 3, "Solved");
privateFillCell(0, 4, "Text");
privateFillCell(0, 5, "Quote text");
var nCurRow = 1;
for (var sUserName in oCommentsReport)
{
    var arrUserComments = oCommentsReport[sUserName];
    var arrCells = [];
    for (var nIndex = 0, nCount = arrUserComments.length; nIndex < nCount; ++nIndex, ++nCurRow)
    {
        var oCommentInfo = oCommentsReport[sUserName][nIndex];
        arrCells.push(privateFillCell(nCurRow, 0, "").Cell);
        privateFillCell(nCurRow, 1, (new Date(oCommentInfo["Date"])).toString());
        privateFillCell(nCurRow, 2, oCommentInfo["IsAnswer"] === true ? "answer" : "comment");
        if (oCommentInfo["IsAnswer"] !== true)
        {
            if (oCommentInfo["IsSolved"] === true)
                privateFillCell(nCurRow, 3, "yes").Run.SetColor(0, 255, 0);
            else
                privateFillCell(nCurRow, 3, "no").Run.SetColor(255, 0, 0);
        }
        privateFillCell(nCurRow, 4, oCommentInfo["CommentMessage"] ? oCommentInfo["CommentMessage"] : "");
        privateFillCell(nCurRow, 5, oCommentInfo["QuoteText"] ? oCommentInfo["QuoteText"] : "");
    }
    var oMergedCell = oTable.MergeCells(arrCells);
    if (oMergedCell)
    {
        var oCellContent = oMergedCell.GetContent();
        oCellContent.GetElement(0).AddText(sUserName);
    }
    else if (arrCells.length > 0)
    {
        var oCellContent = arrCells[0].GetContent();
        oCellContent.GetElement(0).AddText(sUserName);
    }
}
oTable.SetStyle(oDocument.GetStyle("Bordered"));
builder.SaveFile("docx", "GetCommentsReport.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5235514&doc=ZXZKMm5OMjI2djdnZDdDeGFGakRGcnhVVW0rdzdxNE12TXpFSFIvbVN1ND0_IjUyMzU1MTQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>