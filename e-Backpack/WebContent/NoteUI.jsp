<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<style>
 
.bordered {
    border: 1px solid;
}
 
.number {
    width: 64px;
}
</style>
<body> 
<div>
    <div id="divNotebookFile" class="bordered">
        <div>
            <label>NoteBook:</label>
            <input id="inputNootbookName" ></input>
        </div>
     
    </div>
 
    <div id="divNoteList" class="bordered">
        <label>Notes:</label>
        <div>
            <button >New</button>     
            <button >Remove Selected</button>
        </div>
        <select id="selectDocumentsInProject" style="width:100%" size="10" onchange=""></select>
    </div>
 
    <div id="divDocumentSelected" class="bordered">
        <div><label>Document Selected:</label></div>
        <div>
            <label>Name:</label>
            <input id="inputDocumentSelectedName" onchange="inputDocumentSelectedName_Changed(this);"></input>
            <button onclick="buttonDocumentSelectedSave_Clicked();">Save</button>
           
        </div>
        <div></div>
        <div><textarea id="textareaDocumentSelectedContents" style="width:100%" rows="20" onchange="textareaDocumentSelectedContents_Changed(this);" onkeyup="textareaDocumentSelectedContents_CursorMoved(this);" onmouseup="textareaDocumentSelectedContents_CursorMoved(this);"></textarea></div>
    </div>
 
       
        
          
 
    </div>
 

</body>
</html>