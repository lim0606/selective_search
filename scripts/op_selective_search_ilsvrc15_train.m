function op_selective_search_ilsvrc15_train(first_el, last_el)

%% init selective search library 
init;

%% init for 
ROOT_ILSVRC15 = '/media/data1/image/ilsvrc15/ILSVRC2015/';
split = 'train'; % 'val'; 'test';
fast_mode = true; 
max_dim = 4000; 

filelist = [ROOT_ILSVRC15, 'ImageSets/DET/', split, '.txt']; 

fileID = fopen(filelist); 
rawfile = textscan(fileID, '%s %d'); 
images = rawfile{1}; 
img_indices = rawfile{2}; 
fclose(fileID);

last_el = min(last_el, size(images,1)); 
images = images(first_el:last_el,1);
img_indices = img_indices(first_el:last_el,1); 

num_images = size(images, 1); 
boxes = cell(num_images, 1); 

gray_img_indices = zeros(num_images, 1); 
large_img_indices = zeros(num_images, 1); 

tic; 
gray_next_ind = 1; 
large_next_ind = 1; 
for i=1:num_images
  %fprintf([ROOT_ILSVRC15, 'Data/DET/', split, '/', images{i}, '.JPEG\n']); 
  img = imread([ROOT_ILSVRC15, 'Data/DET/', split, '/', images{i}, '.JPEG']); 
  
  if length(size(img)) == 2 % image is gray scale
    img = repmat(img, [1 1 3]); % convert gray to rgb
    gray_img_indices(gray_next_ind) = i; 
    gray_next_ind = gray_next_ind + 1; 
  end
  %fprintf('height: %d, width: %d\n', size(img, 1), size(img, 2)); 

  if max(size(img)) > max_dim
    large_img_indices(large_next_ind) = i;
    large_next_ind = large_next_ind + 1;
    fprintf([ROOT_ILSVRC15, 'Data/DET/', split, '/', images{i}, '.JPEG\n']); 
  end
 
  if fast_mode
    boxes_tmp = selective_search_boxes(img, true, max_dim); % fast mode 
  else
    boxes_tmp = selective_search_boxes(img, false, max_dim); % quality mode
  end
  boxes{i} = boxes_tmp; 

  if mod(i, 100) == 0
    t = toc; 
    fprintf('%d/%d (elapsed time is %.3f seconds for 100 images)\n', i, num_images, t); 
    tic; 
  elseif i == num_images
    t = toc; 
    fprintf('%d/%d (elapsed time is %.3f seconds for %d images)\n', i, num_images, t, mod(i, 100));
  end
end

gray_img_indices = gray_img_indices(1:gray_next_ind-1);  
large_img_indices = large_img_indices(1:large_next_ind-1); 
save(['ilsvrc15_', num2str(first_el), '_', num2str(last_el), '.mat'], 'boxes', 'images'); 
save(['ilsvrc15_msc_', num2str(first_el), '_', num2str(last_el), '.mat'], 'gray_img_indices', 'img_indices', 'large_img_indices'); 

fprintf('done\n');
