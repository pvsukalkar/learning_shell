#!/bin/sh
echo -e "Enter 1--> weight conversions\n2--> length conversion"
read choice
conversion(){
read parameter
conversion_factor=$1
converted_parameter=`echo | awk '{ print "'"$parameter"'"*"'"$conversion_factor"'"}'`
echo "$parameter $2 --> $converted_parameter $3"
}
case $choice in 
1) echo -e "1--> kg to pound\n2--> pound to kg\n3--> pound to ounce\n4--> ounce to pound" 
   read option 
   case $option in 
	1) echo "Enter weight in kgs:"
	   conversion 2.20462 kgs pounds ;;
	2) echo "Enter weight in pounds: "
	   conversion 0.453592 pounds kgs ;;
	3) echo "enter weight in pounds: "
	   conversion 16 pounds ounces ;;
	4) echo "enter weight in ounces: "
	   conversion 0.0625 ounces pounds ;;
        *) echo "enter proper choice and try again !!" ;;
   esac
;;
2) echo -e "1--> feet to inch\n2--> inch to meter\n3--> feet to meter" 
   read option 
   case $option in 
   	1) echo "Enter length in feet"
	   conversion 12 feet inches ;;
   	2) echo "Enter length in inches" 
	   conversion 0.0254 inches meters ;;
	3) echo "Enter length in feet "
	   conversion 0.3048 feet meters ;;
	*) echo "Enter proper option and try again!" ;;
   esac
;;
*) echo "you entered wrong choice, try again!!" ;;
esac
