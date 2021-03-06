#!/bin/bash

cd /usr/share/edgetpu/examples/

TRAINING_DIR=/home/pi/Projects/project-birdfeeder/retrain-imprinting

python3 imprinting_learning.py \
--model_path ${TRAINING_DIR}/mobilenet_v1_1.0_224_l2norm_quant_edgetpu.tflite \
--data ${TRAINING_DIR}/open_image_v4_subset \
--output ${TRAINING_DIR}/retrained_imprinting_model.tflite

printf '\nExpecting Female House Sparrow'
python3 classify_image.py \
--model ${TRAINING_DIR}/retrained_imprinting_model.tflite \
--label ${TRAINING_DIR}/retrained_imprinting_model.txt \
--image ${TRAINING_DIR}/test_images/female-sparrow.png
