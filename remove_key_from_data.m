function output_data = remove_key_from_data(input_data,key)
%NICHOLAS LAU
%000377939
%LAST EDITED: AUG. 20, 2016
%REMOVE THE CRYPT KEY GENERATED FROM THE USER PASSWORD TO ALL VALUES
size_d = size(input_data);
size_length = size_d(1)*size_d(2);
output_data = zeros(size_d(1),size_d(2));
% input_data = int64(input_data)

for (jj=1:size_d(1))
    for(ii = 1:size_d(2))
        output_data(jj,ii) = input_data(jj,ii) - key;
    end
end

output_data;

end