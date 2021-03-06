#! /bin/bash

datadir=/home/dpk25/MolecularTransformer2/experiments/toy_model/sear/
model_list=/home/dpk25/rds/hpc-work/toy_model/sear_models_biased/

python ../../../translate.py -model ${model_list}toy_model_step_150000.pt \
	-src ${datadir}src-benchmark.txt \
	-output ../sear_convergence/preds_bia_150k.txt \
	-batch_size 64 -replace_unk -max_length 200 -n_best 1

