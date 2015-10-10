init;

ROOT_ILSVRC15 = '/media/data1/image/ilsvrc15/ILSVRC2015/';
split = 'val'; % 'test';

filelist = [ROOT_ILSVRC15, 'ImageSets/DET/', split, '.txt'];

fileID = fopen(filelist);
rawfile = textscan(fileID, '%s %d');
images = rawfile{1};
img_indices = rawfile{2};
fclose(fileID);

num_images = size(images, 1);
n = 5000;
ps = 1:n:num_images;

p = 1; 2; 3; 4; 5;
first_el = ps(p);
last_el = min(ps(p)+n-1, num_images);
fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
op_selective_search_ilsvrc15_val(first_el, last_el);

