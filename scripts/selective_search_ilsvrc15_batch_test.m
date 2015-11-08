init;

ROOT_ILSVRC15 = '/Users/lim-macbook/Desktop/ilsvrc15/ILSVRC2015/';
split = 'test';

filelist = [ROOT_ILSVRC15, 'ImageSets/DET/', split, '.txt'];

fileID = fopen(filelist);
rawfile = textscan(fileID, '%s %d');
images = rawfile{1};
img_indices = rawfile{2};
fclose(fileID);

num_images = size(images, 1);
n = 5000;
ps = 1:n:num_images;

p = 3; 7; 11; 
first_el = ps(p);
last_el = min(ps(p)+n-1, num_images);
fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
op_selective_search_ilsvrc15_test(first_el, last_el);

p = 2; 6; 10;
first_el = ps(p);
last_el = min(ps(p)+n-1, num_images);
fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
op_selective_search_ilsvrc15_test(first_el, last_el);

p = 1; 5; 9;
first_el = ps(p);
last_el = min(ps(p)+n-1, num_images);
fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
op_selective_search_ilsvrc15_test(first_el, last_el);

%p = 4; 8;
%first_el = ps(p);
%last_el = min(ps(p)+n-1, num_images);
%fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
%op_selective_search_ilsvrc15_test(first_el, last_el);
%

