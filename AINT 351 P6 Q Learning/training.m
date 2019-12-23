function [table, count] = training (state, table)
        count = 0;
while state ~= 2
count = count +1; 
[table, state] = update ( state, table);
end
end