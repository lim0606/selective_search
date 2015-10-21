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

p = 4; 10; 16; 22; 28; 34; 40; 46;
first_el = ps(p);
last_el = min(ps(p)+n-1, num_images);
fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
op_selective_search_ilsvrc15_train(first_el, last_el);

p = 3; 9; 15; 21; 27; 33; 39; 45;
first_el = ps(p);
last_el = min(ps(p)+n-1, num_images);
fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
op_selective_search_ilsvrc15_train(first_el, last_el);

p = 2; 8; 14; 20; 26; 32; 38; 44;
first_el = ps(p);
last_el = min(ps(p)+n-1, num_images);
fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
op_selective_search_ilsvrc15_train(first_el, last_el);

p = 1; 7; 13; 19; 25; 31; 37; 43;
first_el = ps(p);
last_el = min(ps(p)+n-1, num_images);
fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
op_selective_search_ilsvrc15_train(first_el, last_el);

%p = 6; 12; 18; 24; 30; 36; 42;
%first_el = ps(p);
%last_el = min(ps(p)+n-1, num_images);
%fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
%op_selective_search_ilsvrc15_train(first_el, last_el);
%
%p = 5; 11; 17; 23; 29; 35; 41;
%first_el = ps(p);
%last_el = min(ps(p)+n-1, num_images);
%fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
%op_selective_search_ilsvrc15_train(first_el, last_el);

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
