%load ilsvrc_2015_train.mat
%load ilsvrc_2015_msc_train.mat
function [] = convert_mat_to_txt(boxes, images)

root_folder = '../ilsvrc_2015';
if ~exist(root_folder, 'dir')
  mkdir(root_folder); 
end

root_folder = [root_folder, '/train']; 
if ~exist(root_folder, 'dir')
  mkdir(root_folder);
end

tic; 
for idx=1:size(images,1)
    filename = images{idx};
    [foldername, remain] = strtok(filename,'/'); 
    if ~exist([root_folder, '/', foldername], 'dir') 
        mkdir([root_folder, '/', foldername]);
    end
    if ~isempty(strfind(remain, '/'))
        subfoldername = strtok(remain,'/');
        if ~exist([root_folder, '/', foldername, '/', subfoldername],'dir');
            mkdir([root_folder, '/', foldername, '/', subfoldername]);
        end
    end 
    filename = [root_folder, '/', filename, '.txt'];     
    fileID = fopen(filename, 'w');
    for i=1:size(boxes{idx},1)
    ymin = boxes{idx}(i,1); 
    xmin = boxes{idx}(i,2); 
    ymax = boxes{idx}(i,3); 
    xmax = boxes{idx}(i,4); 
    
    width = ymax - ymin;
    height = xmax - xmin;  
    assert(width > 0, ['width: ', num2str(width), ', ymax: ', num2str(ymax), ', ymin: ', num2str(ymin)]); 
    assert(height > 0, ['height: ', num2str(height), ', xmax: ', num2str(xmax), ', xmin: ', num2str(xmin)]); 
    fprintf(fileID, '%d %d %d %d\n', floor(ymin), floor(xmin), floor(ymax), floor(xmax)); 
    end
    fclose(fileID);

    if mod(idx, 1000) == 0 || idx == size(images,1)
        t = toc;
        fprintf('%d / %d (elapsed time is %.4f seconds per %d images)\n', idx, size(images,1), t, mod(idx-1, 1000)+1);
        tic;
    end
 
end

%t = toc; 
%fprintf('Elapsed time is %.4f seconds for %d images\n', t, size(images,1)); 

end
