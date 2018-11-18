function embed(input_image_path, input_text_path, output_image_path)
% Embeds the given text in the given input image using DWT.

    % read image (carrier)
    image = imread(input_image_path);

    % display input image
    %figure
    %imshow(image);
    %title('original image');

    % read text (secret to be sent)
    % each char is 8-bits long
    fid = fopen(input_text_path, 'rt');
    text = fread(fid, inf, 'uint8');
    bin_text = de2bi(text, 8);

    [char_count, ~] = size(bin_text);

    % convert to YCbCr color space
    image_ycbcr = rgb2ycbcr(image);

    % extract blue-difference chroma
    cb = image_ycbcr(:, :, 2);

    % construct Haar wavelet
    haar_wavelet = liftwave('haar', 'Int2Int');

    % apply DWT to the input image, on Cb channel
    % L/H = Low/High
    % LL = approximation coefficients
    % HL/LH/HH = detail coefficients
    [LL, HL, LH, HH] = lwt2(double(cb), haar_wavelet);

    % Hide text in HH and HL regions
    [~, HH_width] = size(HH);
    [~, HL_width] = size(HL);

    HH_flat = reshape(HH.', 1, []);
    HL_flat = reshape(HL.', 1, []);
    
    size_length = 4;
    overwhelmed = (8 * char_count + 8 * size_length) > (length(HH_flat) + length(HL_flat));
    
    
    if (overwhelmed)
        disp('Text length is too large to be embedded!');
    else
        % store the number of chars as the first `size_length` bytes
        
        HH_flat(1:size_length * 8) = de2bi(char_count, size_length * 8);

        HH_can_fit = length(HH_flat) / 8;

        HH_limit = min(char_count + size_length, HH_can_fit);

        % encode in HH (first 2 bytes = size)
        for i = size_length + 1:HH_limit
            HH_flat((i-1)*8 + 1:(i-1)*8 + 8) = bin_text(i-size_length, :);
        end

        % if HH can't contain all, also use HL
        rest = char_count + size_length - HH_can_fit;
        if (rest > 0)
            for i = 1:rest
                HL_flat((i-1)*8+1:(i-1)*8+8) = bin_text(i-size_length+HH_limit, :);
            end
        end
    end

    % restore matrix dimensions
    HH = vec2mat(HH_flat, HH_width);
    HL = vec2mat(HL_flat, HL_width);

    % output final image
    image_ycbcr(:, :, 2) = ilwt2(LL, HL, LH, HH, haar_wavelet);
    out_image = ycbcr2rgb(image_ycbcr);
    imwrite(out_image, output_image_path);

    %figure
    %imshow(out_image);
    %title('stegano image');
end