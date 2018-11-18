function error = mse(img1, img2)
sqerr = (double(img1) - double(img2)).^2;
error = mean(mean(sqerr)); 
