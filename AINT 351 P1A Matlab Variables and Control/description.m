function [outval] = description(inval)
outval = ("You are ");
switch inval
    case 0
        outval = strcat(outval,"by a babbling brook");
        disp(outval)
    case 1
        outval = strcat(outval,"high in some misty mountains");
        disp(outval)
    case 2
        outval = strcat(outval,"in a sunny field");
        disp(outval)
    case 3
       outval = strcat(outval,"under a great oak");
       disp(outval)
    otherwise
        outval = strcat(outval,"lost");
        disp(outval)
end
end