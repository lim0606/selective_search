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

p = 2; 5; 8; 11; 16; 21; 26; 31; 36; 41; 46;
first_el = ps(p);
last_el = min(ps(p)+n-1, num_images);
fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
op_selective_search_ilsvrc15_train(first_el, last_el);

p = 1; 4; 7; 10; 15; 20; 25; 30; 35; 40; 45;
first_el = ps(p);
last_el = min(ps(p)+n-1, num_images);
fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
op_selective_search_ilsvrc15_train(first_el, last_el);

p = 3; 6; 9; 14; 19; 24; 29; 34; 39; 44;
first_el = ps(p);
last_el = min(ps(p)+n-1, num_images);
fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
op_selective_search_ilsvrc15_train(first_el, last_el);

p = 13; 18; 23; 28; 33; 38; 43;
first_el = ps(p);
last_el = min(ps(p)+n-1, num_images);
fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
op_selective_search_ilsvrc15_train(first_el, last_el);

p = 12; 17; 22; 27; 32; 37; 42;
first_el = ps(p);
last_el = min(ps(p)+n-1, num_images);
fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
op_selective_search_ilsvrc15_train(first_el, last_el);

%n = 1000; 
%ps = 310001:n:320000;
%
%p = 2; 4; 6; 8; 10;
%first_el = ps(p);
%last_el = min(ps(p)+n-1, 320000);
%fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
%op_selective_search_ilsvrc15_train(first_el, last_el);
%
%p = 1; 3; 5; 7; 9; 
%first_el = ps(p);
%last_el = min(ps(p)+n-1, 320000);
%fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
%op_selective_search_ilsvrc15_train(first_el, last_el);
%
