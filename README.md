# Selective Search for ILSVRC15 Detection

* This repository includes some scripts to use the selective search algorithm (copied from https://github.com/rbgirshick/rcnn/tree/master/selective_search) and the resulting boxes from the algorithm

## Notes: 

* `msc/` folder include logs files

* `scripts/` folder include matlab script files to use selective search (esp. for a single PC/Workstation setting)

* Because of memory issue, following images are resized. 
  * `ILSVRC2015/Data/DET/train/ILSVRC2013_train/n02870880/n02870880_4325.JPEG`: 4041 x 2848 -> 4000 x 2819 
  * `ILSVRC2015/Data/DET/train/ILSVRC2013_train/n03095699/n03095699_3846.JPEG`: 2848 x 4288 -> 2657 x 4000
  * `ILSVRC2015/Data/DET/train/ILSVRC2013_train/n03447447/n03447447_3895.JPEG`: 4682 x 3555 -> 3500 x 2658
  * `ILSVRC2015/Data/DET/train/ILSVRC2013_train/n03961711/n03961711_14188.JPEG`: 5935 x 4080 -> 4000 x 2750
  * `ILSVRC2015/Data/DET/train/ILSVRC2013_train/n03961711/n03961711_15908.JPEG`: 4419 x 4786 -> 4000 x 3693
