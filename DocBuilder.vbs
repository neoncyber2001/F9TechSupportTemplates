'dim openFileDialog
'set openFileDialog = CreateObject("MSComDlg.CommonDialog")
dim arg
set arg = wscript.Arguments

Const ForReading = 1, ForWriting = 2, ForAppending = 8
'With openDialog
'    .DialogTitle = "Open my files..."
'    .InitDir = "C:\WINDOWS\"
'    .Filter = "All files (*.*)|*.*|"
'    .Flags = 2621952
'    .MaxFileSize =32000
'    .ShowOpen
'    Filename = .Filename
'End With

Filename = arg(0)
  
dim fContents
  
Dim fs, f
Set fs = CreateObject("Scripting.FileSystemObject")
Set f = fs.OpenTextFile(Filename, ForReading)
fContents = f.ReadAll
f.Close

wscript.echo fContents & vbcrlf

dim extractor
set extractor = new RegExp
extractor.Pattern = "<([\w\d]*)>(.*)<\/\1>|^([\S]*):{2}|^(\.[\S]*)"
with extractor    
	.IgnoreCase = True
    .Global     = True
end With

extractor.test(fContents)

dim result
set result = extractor.Execute(fContents)
for Each match in result
	wscript.echo match.value & vbcrlf
	for each omatch in match.submatches
		wscript.echo omatch.length
		wscript.echo omatch.value
	next
next
