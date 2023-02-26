///toZero(value, rate)
var iValue = argument0
var iOriginal = iValue
var iSpeed = argument1
if iValue != 0
{
    iValue -= sign(iValue) * iSpeed;
    if sign(iOriginal) != sign(iValue)
        iValue = 0;
}
return iValue
