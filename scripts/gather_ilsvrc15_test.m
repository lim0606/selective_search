close all; clear all;
init;

%%
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for p = 1:length(ps) 
  tic; 
  first_el = ps(p);
  last_el = min(ps(p)+n-1, num_images);
  fprintf('first_el: %d, last_el: %d\n', first_el, last_el);

  aa = load(['../msc/ilsvrc15_test_', num2str(first_el), '_', num2str(last_el), '.mat']);

  %for i = 1:size(aa.boxes,1)
  %  filename = aa.images{i}; 
  %  boxes = aa.boxes{i};
  %  for j = 1:size(boxes, 1)
  %    try
  %      xmin = boxes(j, 1); ymin = boxes(j, 2); xmax = boxes(j, 3); ymax = boxes(j, 4); 
  %    catch 
  %      fprintf('wft!!!; xmin: %d, ymin: %d, xmax: %d, ymax: %d; %s; line number: %d', xmin, ymin, xmax, ymax, filename, j);  
  %    end
  %    assert(xmin > 0,      ['xmin should be larger than 0; ', filename]); 
  %    assert(xmin <= 10000, ['xmin should be smaller than or equal to 10000; ', filename]); 
  %    assert(ymin > 0,      ['ymin should be larger than 0; ', filename]);
  %    assert(ymin <= 10000, ['ymin should be smaller than or equal to 10000; ', filename]);
  %    assert(xmax > 0,      ['xmax should be larger than 0; ', filename]);
  %    assert(xmax <= 10000, ['xmax should be smaller than or equal to 10000; ', filename]);
  %    assert(ymax > 0,      ['ymax should be larger than 0; ', filename]);
  %    assert(ymax <= 10000, ['ymax should be smaller than or equal to 10000; ', filename]);
  %
  %    width = xmax - xmin; 
  %    height = ymax - ymin; 
  %    assert(width > 0,  ['width should be larger than 0; xmin: ', num2str(xmin), '; xmax: ', num2str(xmax), '; ymin: ', num2str(ymin), '; ymax: ', num2str(ymax), '; ', filename, '; line number: ', num2str(j)]); 
  %    assert(height > 0, ['height should be larger than 0; xmin: ', num2str(xmin), '; xmax: ', num2str(xmax), '; ymin: ', num2str(ymin), '; ymax: ', num2str(ymax), '; ', filename, '; line number: ', num2str(j)]);
  %  end
  %end 

  convert_mat_to_txt(aa.boxes, aa.images, 'test');
  %boxes(first_el:last_el) = aa.boxes; 
  %images(first_el:last_el) = aa.images;

  t = toc; 
  fprintf('p: %d/%d (elapsed time is %.3f seconds)\n', p, length(ps), t); 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fprintf('gathering miscellaneous information-------------------------\n'); 
%p = 1;
%first_el = ps(p);
%last_el = min(ps(p)+n-1, num_images);
%fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
%
%bb = load(['../msc/ilsvrc15_msc_', num2str(first_el), '_', num2str(last_el), '.mat']);
%bb.gray_img_indices = bb.img_indices(bb.gray_img_indices);
%if isfield(bb, 'large_img_indices')
%  bb.large_img_indices = bb.img_indices(bb.large_img_indices);
%else
%  bb.large_img_indices = zeros(0, 1); 
%end
%
%img_indices = bb.img_indices;
%gray_img_indices = bb.gray_img_indices;
%large_img_indices = bb.large_img_indices;
%
%fprintf('size(gray_img_indices, 1): %d, size(large_img_indices, 1): %d\n', size(gray_img_indices, 1), size(large_img_indices, 1)); 
%
%for p = 1:length(ps) 
%  tic; 
%  first_el = ps(p);
%  last_el = min(ps(p)+n-1, num_images);
%  fprintf('first_el: %d, last_el: %d\n', first_el, last_el);
%
%  bb = load(['../msc/ilsvrc15_msc_', num2str(first_el), '_', num2str(last_el), '.mat']);
%  bb.gray_img_indices = bb.img_indices(bb.gray_img_indices);
%  if isfield(bb, 'large_img_indices')
%    bb.large_img_indices = bb.img_indices(bb.large_img_indices);
%  else
%    bb.large_img_indices = zeros(0, 1);
%  end
%
%  img_indices = cat(1, img_indices, bb.img_indices); 
%  gray_img_indices = cat(1, gray_img_indices, bb.gray_img_indices);
%  large_img_indices = cat(1, large_img_indices, bb.large_img_indices);
%  
%  fprintf('size(gray_img_indices, 1): %d, size(large_img_indices, 1): %d\n', size(gray_img_indices, 1), size(large_img_indices, 1));
%  t = toc; 
%  fprintf('p: %d/%d (elapsed time is %.3f seconds)\n', p, length(ps), t); 
%end
%
%%fprintf('size(boxes, 1): %d, size(images, 1): %d, size(gray_img_indices, 1): %d, size(large_img_indices, 1): %d\n', size(boxes, 1), size(images,1), size(gray_img_indices, 1), size(large_img_indices, 1)); 
%fprintf('size(gray_img_indices, 1): %d, size(large_img_indices, 1): %d\n', size(gray_img_indices, 1), size(large_img_indices, 1)); 
%
%%save(['ilsvrc_2015_test.mat'], 'boxes', 'images', '-v7.3');
%save(['ilsvrc_2015_test_msc_.mat'], 'gray_img_indices', 'img_indices', 'large_img_indices');
%
