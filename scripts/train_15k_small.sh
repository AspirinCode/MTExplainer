#! /bin/bash

dataset=../data/data/USPTO_15k/data/
save_model=../trained_model/USPTO_15k/
data_dir=${dataset}
save_model=/home/dpk25/rds/hpc-work/MolecularTransformer2_models/checkpoints/USPTO_15k/small/

python ../train.py -data ${data_dir}  \
	-save_model ${save_model}model \
	-seed 42 -gpu_ranks 0 -save_checkpoint_steps 4000 -keep_checkpoint -1 \
	-train_steps 200000 -param_init 0 -param_init_glorot -max_generator_batches 32 \
	-batch_size 1024 -batch_type tokens -normalization tokens -max_grad_norm 0 \
	-accum_count 4 -optim adam -adam_beta1 0.9 -adam_beta2 0.998 -decay_method noam \
	-warmup_steps 8000 -learning_rate 2 -label_smoothing 0.0 -report_every 1000 \
	-layers 4 -rnn_size 128 -word_vec_size 128 -encoder_type transformer \
	-decoder_type transformer -dropout 0.1 -position_encoding -share_embeddings \
	-global_attention general -global_attention_function softmax \
	-self_attn_type scaled-dot -heads 8 -transformer_ff 1024 \
#	-train_from ${save_model}model_step_100000.pt \