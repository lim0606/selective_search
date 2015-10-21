%load ilsvrc_2015_train.mat
%load ilsvrc_2015_msc_train.mat

root_folder = '../ilsvrc_2015';
if ~exist(root_folder, 'dir')
  mkdir(root_folder); 
end

root_folder = [root_folder, '/train']; 
if ~exist(root_folder, 'dir')
  mkdir(root_folder);
end


idx = 1;
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
    xmin = boxes{idx}(i,1); 
    ymin = boxes{idx}(i,2); 
    xmax = boxes{idx}(i,3); 
    ymax = boxes{idx}(i,4);  
    fprintf(fileID, '%d %d %d %d\n', xmin, ymin, xmax, ymax); 
    end
    fclose(fileID); 
    if mod(idx, 10000) == 0 || idx == size(images,1)
        t = toc; 
        fprintf('%d / %d (elapsed time is %.4f seconds per 10000 images)\n', idx, size(images,1), t); 
        tic; 
    end  
end
