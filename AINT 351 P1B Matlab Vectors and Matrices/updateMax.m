function outmat = updateMax(M,r)
row = selectRow(M,r);
loc = indexOfMax(row);
M(r,loc) = M(r,loc)*1.2;
outmat = M

end

