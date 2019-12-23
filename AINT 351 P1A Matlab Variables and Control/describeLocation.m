function describeLocation(value)
out = "You are ";
switch value
    case 0
        disp(out + "by a babbling brook")
    case 1
        disp(out + "high in some misty mountains")
    case 2
        disp(out + "in a sunny field")
    case 3
        disp(out + "under a great oak")
    otherwise
        disp(out + "lost")
end

