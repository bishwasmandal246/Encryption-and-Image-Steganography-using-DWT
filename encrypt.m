function final_data = encrypt(input_data,reps,user_key)
%NICHOLAS LAU
%000377939
%LAST EDITED: AUG. 20, 2016
%FULL PROGRAM "INSPIRED" BY THE AES CRYPTOGRAPHY METHOD. NOT AN EXACT
%RECREATION
%USING THE FOLLOWING FORMAT (WIKIPEDIA):

% KeyExpansions—round keys are derived from the cipher key using Rijndael's key schedule.
% InitialRound
% AddRoundKey—each byte of the state is combined with a block of the round key using bitwise xor.
% --Rounds--
% SubBytes (NOT IMPLEMENTED)—a non-linear substitution step where each byte is replaced with another according to a lookup table.
% ShiftRows—a transposition step where the last three rows of the state are shifted cyclically a certain number of steps.
% MixColumns—a mixing operation which operates on the columns of the state, combining the four bytes in each column.
% AddRoundKey
% --------
% Final Round (no MixColumns)
% SubBytes (NOT IMPLEMENTED)
% ShiftRows
% AddRoundKey.

% SOURCE: https://en.wikipedia.org/wiki/Advanced_Encryption_Standard
input_data = int64(input_data);
if(length(user_key) < 4)
    fprintf('The length of the user key is insufficient. Minimum = 4 char. Current = %s',user_key);
    return
end
if (isempty(input_data))
    fprintf('No data inputted');
    return
end
if (reps < 1)
    fprintf('The number of repetitions is insufficient. Minimum >= 1 reps. Current = %d',reps);
    return
end

crypt_key = gen_key(user_key);
final_data = convert_sq(input_data);
final_data = add_key_to_data(final_data,crypt_key);

for (ii = 1:reps)
    final_data = shift_row(final_data);
    final_data = mix_col(final_data,crypt_key);
    final_data = add_key_to_data(final_data,crypt_key);
end

final_data = shift_row(final_data);
final_data = add_key_to_data(final_data,crypt_key);

end