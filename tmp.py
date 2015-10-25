import os
import numpy as np

def read_selective_search_txt(index):
    filename = os.path.join(foldername, index + '.txt')
    with open(filename, 'rb') as f:
        boxes_str = f.read().split('\n')[:-1]
    #boxes = [np.array(box_str.split(), dtype=np.uint16) for box_str in boxes_str]
    boxes = [np.array(box_str.split(), dtype=np.float).astype(np.uint16) for box_str in boxes_str]
    boxes = np.array(boxes)
    #print index
    return boxes


index = 'ILSVRC2013_train/n03838899/n03838899_17202'
