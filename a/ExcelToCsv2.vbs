if WScript.Arguments.Count < 2 Then
    WScript.Echo "Please specify the source and the destination files. Usage: ExcelToCsv <xls/xlsx source file> <csv destination file>"
    Wscript.Quit
End If
Set objFSO = CreateObject("Scripting.FileSystemObject")
src_file = objFSO.GetAbsolutePathName(Wscript.Arguments.Item(0))
dest_file = objFSO.GetAbsolutePathName(WScript.Arguments.Item(1))
Dim oExcel
Set oExcel = CreateObject("Excel.Application")
Dim oBook
Set oBook = oExcel.Workbooks.Open(src_file)
oBook.SaveAs dest_file, 3
oBook.Close False
oExcel.Quit
Set objFile = objFSO.OpenTextFile(dest_file, 1)
strText = objFile.ReadAll
objFile.Close
strNewText = Replace(strText, " ", "|")
Set objFile = objFSO.OpenTextFile(dest_file, 2)
objFile.WriteLine strNewText
objFile.Close