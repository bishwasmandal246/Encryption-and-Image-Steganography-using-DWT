function output_data = convert_line(input_data)
%NICHOLAS LAU
%000377939
%LAST EDITED: AUG. 20, 2016
%CONVERTS THE SQUARE MATRIX DATA INTO A 1XN LINE MATRIX. FORMATTING WILL BE LOST IN
%THE PROCESS
sz = size(input_data);

output_data = reshape(input_data,[1 sz(1)*sz(2)]);
for (ii=1:length(output_data))
    if(output_data(ii) == 124)
        output_data = output_data(1:ii-1);
        break
    end
end

end