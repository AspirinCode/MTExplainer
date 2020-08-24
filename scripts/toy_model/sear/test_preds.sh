#! /bin/bash

datadir=/home/dpk25/rds/hpc-work/toy_model/data_sear/
model_list=/home/dpk25/rds/hpc-work/toy_model/sear_models/

python ../../../translate.py -model ${model_list}toy_model_step_10000.pt \
	-src ${datadir}src-test.txt \
	-output ${datadir}/preds_on_test_10k.txt \
	-batch_size 64 -replace_unk -max_length 200 -n_best 1

python ../../../score_predictions.py -targets ${datadir}tgt-test.txt \
	-predictions ${datadir}/preds_on_test_10k.txt \
	-invalid_smiles -beam_size 1 > scores_10k.txt