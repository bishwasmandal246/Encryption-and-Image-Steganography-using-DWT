function crypt_key = gen_key(user_key)
%NICHOLAS LAU
%000377939
%LAST EDITED: AUG. 20, 2016
%GENERATES A CRYPTO KEY BASED ON A USER KEY BY ADDING THE ASCII VALUES OF
%THE USER PASSWORD TOGETHER, THEN ADDING 27 AND DIVIDING BY 3. THE VALUE IS
%ROUNDED DOWN IF IT IS A DECIMAL NUMBER
crypt_key = [];
crypt_key = int16(user_key); %CHAR -> ASCII NUMBER
for(ii=1:size(user_key))
    crypt_key = sum(user_key');
end
crypt_key = (crypt_key + 27)/3;
crypt_key = fix(crypt_key);

end