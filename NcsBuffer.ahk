class NcsBuffer
{
	
	__New(Length, pBuffer, Count = 0)
	{
		this.pBuffer := pBuffer
		this.Offset := 0
		this.Length := Length
		this.Count := Count
	}
	
	;------------------------------------ Append
	AppendByte(Data)
	{
		if(this.Length < this.Count + 1)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 255 and Data < 0)
		{
			throw Exception("ExceededValueRange : The byte value is 0 to 255")
			return
		}
		
		NumPut(Data, this.pBuffer + 0, this.Count, "Char")
		this.Count += 1
	}
	
	AppendChar(Data)
	{
		if(this.Length < this.Count + 1)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 127 and Data < 128)
		{
			throw Exception("ExceededValueRange : The byte value is -128 to 127")
			return
		}
		
		NumPut(Data, this.pBuffer + 0, this.Count, "Char")
		this.Count += 1
	}
	
	AppendUChar(Data)
	{
		if(this.Length < this.Count + 1)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 255 and Data < 0)
		{
			throw Exception("ExceededValueRange : The byte value is 0 to 255")
			return
		}
		
		NumPut(Data, this.pBuffer + 0, this.Count, "UChar")
		this.Count += 1
	}
	
	AppendShort(Data)
	{
		if(this.Length < this.Count + 2)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 32767 and Data < -32768)
		{
			throw Exception("ExceededValueRange : The short value is -32768 to 32767")
			return
		}
		
		NumPut(Data, this.pBuffer + 0, this.Count, "Short")
		this.Count += 2
	}
	
	AppendUShort(Data)
	{
		if(this.Length < this.Count + 2)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 65535 and Data < 0)
		{
			throw Exception("ExceededValueRange : The short value is 0 to 65535")
			return
		}
		
		NumPut(Data, this.pBuffer + 0, this.Count, "UShort")
		this.Count += 2
	}
	
	AppendInt(Data)
	{
		if(this.Length < this.Count + 4)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 2147483647 and Data < -2147483648)
		{
			throw Exception("ExceededValueRange : The int value is -2147483648  to -2147483647")
			return
		}
		
		NumPut(Data, this.pBuffer + 0, this.Count, "Int")
		this.Count += 4
	}
	
	AppendUInt(Data)
	{
		if(this.Length < this.Count + 4)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 4294967295 and Data < 0)
		{
			throw Exception("ExceededValueRange : The int value is 0  to 4294967295")
			return
		}
		
		NumPut(Data, this.pBuffer + 0, this.Count, "UInt")
		this.Count += 4
	}
	
	AppendText(Data)
	{
		dataLength := StrPut(Data, "UTF-16")
		
		if(this.Length < this.Count + (dataLength * 2) + 2)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
		}
		
		this.AppendUShort(dataLength)
		
		StrPut(Data, this.pBuffer + this.Count, dataLength * 2, "UTF-16")
		
		this.Count += dataLength * 2
	}
	
	;------------------------------------ SetFront
	SetFrontByte(Data, Offset)
	{
		if(this.Length < Offset + 1)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 255 and Data < 0)
		{
			throw Exception("ExceededValueRange : The byte value is 0 to 255")
			return
		}
		
		NumPut(Data, this.pBuffer + 0, Offset, "Char")
	}
	
	SetFrontChar(Data, Offset)
	{
		if(this.Length < Offset + 1)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 127 and Data < 128)
		{
			throw Exception("ExceededValueRange : The byte value is -128 to 127")
			return
		}
		
		NumPut(Data, this.pBuffer + 0, Offset, "Char")
	}
	
	SetFrontUChar(Data, Offset)
	{
		if(this.Length < Offset + 1)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 255 and Data < 0)
		{
			throw Exception("ExceededValueRange : The byte value is 0 to 255")
			return
		}
		
		NumPut(Data, this.pBuffer + 0, Offset, "UChar")
	}
	
	SetFrontShort(Data, Offset)
	{
		if(this.Length < Offset + 2)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 32767 and Data < -32768)
		{
			throw Exception("ExceededValueRange : The short value is -32768 to 32767")
			return
		}
		
		NumPut(Data, this.pBuffer + 0, Offset, "Short")
	}
	
	SetFrontUShort(Data, Offset)
	{
		if(this.Length < Offset + 2)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data > 65535 and Data < 0)
		{
			throw Exception("ExceededValueRange : The short value is 0 to 65535")
			return
		}
		
		NumPut(Data, this.pBuffer + 0, Offset, "UShort")
	}
	
	SetFrontInt(Data, Offset)
	{
		if(this.Length < Offset + 4)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data > 2147483647 and Data < -2147483648)
		{
			throw Exception("ExceededValueRange : The int value is -2147483648  to -2147483647")
			return
		}
		
		NumPut(Data, this.pBuffer + 0, Offset, "Int")
	}
	
	SetFrontUInt(Data, Offset)
	{
		if(this.Length < Offset + 4)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data > 4294967295 and Data < 0)
		{
			throw Exception("ExceededValueRange : The int value is 0  to 4294967295")
			return
		}
		
		NumPut(Data, this.pBuffer + 0, Offset, "UInt")
	}

	SetFrontText(Data, Offset)
	{
		dataLength := StrPut(Data, "UTF-16")
		
		if(this.Length < Offset + (dataLength * 2) + 2)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
		}
		
		this.AppendUShort(dataLength)
		
		StrPut(Data, this.pBuffer + Offset, dataLength * 2, "UTF-16")
		
		this.Count += dataLength * 2
	}
	
	;------------------------------------ Extract
	ExtractByte()
	{
		if(this.Length < this.Offset)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 255 and Data < 0)
		{
			throw Exception("ExceededValueRange : The byte value is 0 to 255")
			return
		}
		
		tmpData := NumGet(this.pBuffer + 0, this.Offset , "Char")
		this.Offset += 1
		return tmpData
	}
	
	ExtractChar()
	{
		if(this.Length < Offset + 1)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 127 and Data < 128)
		{
			throw Exception("ExceededValueRange : The byte value is -128 to 127")
			return
		}
		
		tmpData := NumGet(this.pBuffer + 0, this.Offset , "Char")
		this.Offset += 1
		return tmpData
	}
	
	ExtractUChar()
	{
		if(this.Length < Offset + 1)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 255 and Data < 0)
		{
			throw Exception("ExceededValueRange : The byte value is 0 to 255")
			return
		}
		
		tmpData := NumGet(this.pBuffer + 0, this.Offset , "UChar")
		this.Offset += 1
		return tmpData
	}
	
	ExtractShort()
	{
		if(this.Length < Offset + 1)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data is not integer)
		{
			throw Exception("UnacceptableValue : Use the integer value")
			return
		}
		
		if(Data > 32767 and Data < -32768)
		{
			throw Exception("ExceededValueRange : The short value is -32768 to 32767")
			return
		}
		
		tmpData := NumGet(this.pBuffer + 0, this.Offset , "Short")
		this.Offset += 2
		return tmpData
	}
	
	ExtractUShort()
	{
		if(this.Length < Offset + 1)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data > 65535 and Data < 0)
		{
			throw Exception("ExceededValueRange : The short value is 0 to 65535")
			return
		}
		
		tmpData := NumGet(this.pBuffer + 0, this.Offset , "UShort")
		this.Offset += 2
		return tmpData
	}
	
	ExtractInt()
	{
		if(this.Length < Offset + 1)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data > 2147483647 and Data < -2147483648)
		{
			throw Exception("ExceededValueRange : The int value is -2147483648  to -2147483647")
			return
		}
		
		tmpData := NumGet(this.pBuffer + 0, this.Offset , "Int")
		this.Offset += 4
		return tmpData
	}
	
	ExtractUInt()
	{
		if(this.Length < this.Offset)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		if(Data > 4294967295 and Data < 0)
		{
			throw Exception("ExceededValueRange : The int value is 0  to 4294967295")
			return
		}
		
		tmpData := NumGet(this.pBuffer + 0, this.Offset , "UInt")
		this.Offset += 4
		return tmpData
	}

	ExtractText()
	{
		length := ExtractUShort()
		
		if(this.Length < this.Offset)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
		}
		
		
		StrGet(this.pBuffer + this.Offset, length, "UTF-16")
		
		this.Offset += (length * 2)
	}
	
	;------------------------------------ GetFront
	GetFrontByte(Offset)
	{
		if(this.Length < Offset + 1)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		return NumGet(this.pBuffer + 0, Offset, "Char")
	}
	
	GetFrontChar(Offset)
	{
		if(this.Length < Offset + 1)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		return NumGet(this.pBuffer + 0, Offset, "Char")
	}
	
	GetFrontUChar(Offset)
	{
		if(this.Length < Offset + 1)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		return NumGet(this.pBuffer + 0, Offset, "UChar")
	}
	
	GetFrontShort(Offset)
	{
		if(this.Length < Offset + 2)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		return NumGet(this.pBuffer + 0, Offset, "Short")
	}
	
	GetFrontUShort(Offset)
	{
		if(this.Length < Offset + 2)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		return NumGet(this.pBuffer + 0, Offset, "UShort")
	}
	
	GetFrontInt(Offset)
	{
		if(this.Length < Offset + 4)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		return NumGet(this.pBuffer + 0, Offset, "Int")
	}
	
	GetFrontUInt(Offset)
	{
		if(this.Length < Offset + 4)
		{
			throw Exception("OutOfRange : The buffer is short. Use a larger buffer")
			return
		}
		
		return NumGet(this.pBuffer + 0, Offset, "UInt")
	}

	GetFrontText(Offset)
	{
		length := GetFrontUChar(Offset)
		
		StrGet(this.pBuffer + Offset, length, "UTF-16")
	}
}