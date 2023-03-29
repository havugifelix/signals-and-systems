img_2 = imread('img2.jpg');
img_2 = rgb2gray(img_2); % if img2 is color image, convert to grayscale
% imshow(img_2);
% disp(size(img_2));
figure, imshow(img_2), title('Original image');

fft_img = fft2(img_2);
shifted_img = fftshift(fft_img);

ifft_img_mag = 10*log10(abs(ifft2(abs(fft_img))));
ifft_img_mag = uint8(255*mat2gray(ifft_img_mag));


ifft_img_phase = (abs(ifft2(exp(1i*angle(fft_img)))));
ifft_img_phase =  uint8(255*mat2gray(ifft_img_phase));

ifft_img = (abs(ifft2(fft_img)));
ifft_img = uint8(ifft_img);

titles = {'Original image',"Inverse with phase and amp", 'Shifted FFT', 'Magnitude reconstructed image', 'Phase reconstructed image'};
imgs = {img_2,ifft_img 10*log10(abs(shifted_img)), ifft_img_mag, ifft_img_phase};

figure;
for i = 1:numel(imgs)
    subplot(3,2,i); imshow(imgs{i}, []); title(titles{i});
end
