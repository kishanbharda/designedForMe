function num(evt)
{
	var charCode=(evt.which)?evt.which:evt.keyCode;
	if(charCode!=46 && charCode>31 && (charCode<48 || charCode>57))
	{
		return false;
	}
	return true;
	
}

function str(evt)
{
	var charCode=(evt.which)?evt.which:evt.keyCode;
	if((charCode>64 && charCode<91) || (charCode>96 && charCode<123))
	{
		return true;
	}
	return false;
	
}

function disSpace(evt)
{
	var charCode=(evt.which)?evt.which:evt.keyCode;
	if(charCode==32)
	{
		return false;
	}	
	return true;
}

function fn(evt)
{
	var charCode=(evt.which)?evt.which:evt.keyCode;
	if((charCode>64 && charCode<91) || (charCode>96 && charCode<123) || charCode==32)
	{
		return true;
	}
	return false;
	
}
	
	
	
