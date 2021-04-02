/// Approach(start, end, shift);

function Approach(argument0,argument1, argument2){
/****************************************
 Increments a value by a given shift but 
 never beyond the end value
 ****************************************/
if (argument0 < argument1)
    return min(argument0 + argument2, argument1); 
else
    return max(argument0 - argument2, argument1);

}