init;

ROOT_ILSVRC15 = '/media/data1/image/ilsvrc15/ILSVRC2015/';
split = 'train'; % 'val'; 'test';

filelist = [ROOT_ILSVRC15, 'ImageSets/DET/', split, '.txt'];

fileID = fopen(filelist);
rawfile = textscan(fileID, '%s %d');
images = rawfile{1};
img_indices = rawfile{2};
fclose(fileID);

num_images = size(images, 1);
n = 10000;
ps = 1:n:num_images;

num_images = size(images, 1);
boxes = cell(num_images, 1);

p = 1; 
first_el = ps(p);
last_el = min(ps(p)+n-1, num_images);
fprintf('first_el: %d, last_el: %d\n', first_el, last_el);

aa = load(['../msc/ilsvrc15_', num2str(first_el), '_', num2str(last_el), '.mat']);

boxes(first_el:last_el) = aa.boxes; 
images(first_el:last_el) = aa.images; 

bb = load(['../msc/ilsvrc15_msc_', num2str(first_el), '_', num2str(last_el), '.mat']);
bb.gray_img_indices = bb.img_indices(bb.gray_img_indices);
if isfield(bb, 'large_img_indices')
  bb.large_img_indices = bb.img_indices(bb.large_img_indices);
else
  bb.large_img_indices = zeros(0, 1); 
end

img_indices = bb.img_indices;
gray_img_indices = bb.gray_img_indices;
large_img_indices = bb.large_img_indices;

fprintf('size(gray_img_indices, 1): %d, size(large_img_indices, 1): %d\n', size(gray_img_indices, 1), size(large_img_indices, 1)); 

for p = 2:length(ps) 
  tic; 
  first_el = ps(p);
  last_el = min(ps(p)+n-1, num_images);
  fprintf('first_el: %d, last_el: %d\n', first_el, last_el);

  aa = load(['../msc/ilsvrc15_', num2str(first_el), '_', num2str(last_el), '.mat']);

  boxes(first_el:last_el) = aa.boxes; 
  images(first_el:last_el) = aa.images;

  bb = load(['../msc/ilsvrc15_msc_', num2str(first_el), '_', num2str(last_el), '.mat']);
  bb.gray_img_indices = bb.img_indices(bb.gray_img_indices);
  if isfield(bb, 'large_img_indices')
    bb.large_img_indices = bb.img_indices(bb.large_img_indices);
  else
    bb.large_img_indices = zeros(0, 1);
  end

  img_indices = cat(1, img_indices, bb.img_indices); 
  gray_img_indices = cat(1, gray_img_indices, bb.gray_img_indices);
  large_img_indices = cat(1, large_img_indices, bb.large_img_indices);
  
  fprintf('size(gray_img_indices, 1): %d, size(large_img_indices, 1): %d\n', size(gray_img_indices, 1), size(large_img_indices, 1));
  t = toc; 
  fprintf('p: %d/%d (elapsed time is %.3f seconds)\n', p, length(ps), t); 
end

fprintf('size(boxes, 1): %d, size(images, 1): %d, size(gray_img_indices, 1): %d, size(large_img_indices, 1): %d\n', size(boxes, 1), size(images,1), size(gray_img_indices, 1), size(large_img_indices, 1)); 

%save(['ilsvrc_2015_train.mat'], 'boxes', 'images', '-v7.3');
%save(['ilsvrc_2015_msc_train.mat'], 'gray_img_indices', 'img_indices', 'large_img_indices');
