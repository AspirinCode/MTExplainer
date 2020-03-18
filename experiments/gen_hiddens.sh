#! /bin/bash

dataset=MIT_mixed_augm
model_dir=../trained_model/
out_dir=/rds-d2/user/wjm41/hpc-work/hidden_states/

src_txt=/rds-d2/user/wjm41/hpc-work/datasets/MIT_mixed/tmp.txt
#src_txt=/rds-d2/user/wjm41/hpc-work/datasets/MIT_mixed/src-train.txt
tgt1_txt=/rds-d2/user/wjm41/hpc-work/datasets/MIT_mixed/tgt-train.txt

python ../translate.py -model ${model_dir}${dataset}_last20_average.pt \
	-src ${src_txt} -tgt ${tgt1_txt} -shard_size 0\
	-output ${out_dir} -g_h_s True\
	-batch_size 1 -replace_unk -max_length 200 -n_best 1