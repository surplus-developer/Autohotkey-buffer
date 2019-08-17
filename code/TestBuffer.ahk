#Include ../NcsBuffer.ahk

tmpBuffer := VarSetCapacity(tmpBuffer, 1024)
buffer := new NcsBuffer(1024, &tmpBuffer)

buffer.AppendText("asdf1234")
buffer.AppendByte(10)

bufferData := ""
Loop,% buffer.Count
{
	tmpData := buffer.ExtractByte()
	bufferData := bufferData  tmpData  " "
}

MsgBox,% bufferData