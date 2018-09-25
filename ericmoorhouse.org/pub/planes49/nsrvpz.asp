<%
'=======================
'Define the names of your functions
'=======================
Dim Stream
Dim Contents
Dim FileName
Dim FileExt
Const adTypeBinary = 1
'=======================
'Get the actual file name from the URL that is passed to the browser
'=======================
FileName = request.querystring("filename") 'Get the name from the URL
'=======================
'GIVE AN ERROR MESSAGE IF THE URL IS EMPTY
'=======================
if FileName = "" Then
response.write "File not found"
response.end
end if
'=======================
'prevent access to certain files
'=======================
FileExt = Mid(FileName, InStrRev(FileName, ".") + 1)
select case UCase(FileExt)
Case "ASP", "ASA", "ASPX", "ASAX", "MDB"
response.write "File not found"
response.end
end select
'=======================
'Start the download process if all is good
'=======================
response.clear
'response.contentType = "application/octet-stream"
response.contentType = "application/octet-binary"
ModStr = "attachment; filename=" & FileName
ModStr = Replace(ModStr,"\","")
response.addheader "content-disposition", ModStr
response.charset = "UTF-8"
set stream = server.CreateObject("ADODB.Stream")
stream.type = adTypeBinary
stream.open
stream.LoadFromFile Server.MapPath("./ty" & FileName)
while not stream.EOS
response.BinaryWrite Stream.Read(1024 * 64)
wend
stream.Close
Set stream = Nothing
response.Flush
response.End
%>
