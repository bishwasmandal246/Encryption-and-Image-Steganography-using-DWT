function output_data = convert_sq(input_data)
%NICHOLAS LAU
%000377939
%LAST EDITED: AUG. 20, 2016
%CONVERTS THE INPUT DATA INTO A SQUARE MATRIX. FORMATTING WILL BE LOST IN
%THE PROCESS
sz = size(input_data);




if (sz(1) == sz(2))
    output_data = input_data
else
%     if (sz(2)>sz(1)
        output_data = reshape(input_data,[1 sz(1)*sz(2)])
        mm = 2;
        sz = size(output_data);
        rem = sz(2);
        while(rem/mm > mm) %DETERMINES BEST N-SIZE MATRIX
            mm = mm+1
        end
        
%         while (mod(sz(2),mm) ~= 0)
%             input_data(1:output
        for (ii=1:inf) %DETERMINES M-SIZE FROM N-SIZE
            if((mm*ii) < sz(2)) 
                ii= ii+1;
            else
                break
            end
        end
        output_data
        output_data(1,rem+1:(mm*mm)) = 124; %FILLER DATA = |
            
        output_data = reshape(output_data,[mm,mm]); %RESHAPES INTO SQ MATRIX
end
end