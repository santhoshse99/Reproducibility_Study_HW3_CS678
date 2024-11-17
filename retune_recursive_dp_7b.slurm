#!/bin/bash


#SBATCH --job-name=retune_recursive_dp_7b



#SBATCH --partition=gpuq



#SBATCH --qos=gpu







#SBATCH --nodes=1 



#SBATCH --ntasks-per-node=10



#SBATCH --gres=gpu:A100.80gb:1



#SBATCH --mem=80GB  



#SBATCH --export=NONE 



#SBATCH --time=0-23:00:00 







#SBATCH --output=retune_recursive_dp_7b.%j.out



#SBATCH --error=retune_recursive_dp_7b.%j.err







# To see ID and state of GPUs assigned



nvidia-smi 







## Activate the python virtual environment



source  ../retuning_env/bin/activate







## Execute your script



python3 -u train.py model=llama7b datasets=[recursive_dp_resampled_test.json] exp_name=my_reursive_dp_7b gradient_accumulation_steps=64 batch_size=64 eval_batch_size=4 n_eval_examples=16


