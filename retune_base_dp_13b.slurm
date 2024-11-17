#!/bin/bash


#SBATCH --job-name=retune_basedp_13b_job



#SBATCH --partition=gpuq



#SBATCH --qos=gpu







#SBATCH --nodes=1 



#SBATCH --ntasks-per-node=8



#SBATCH --gres=gpu:A100.80gb:1



#SBATCH --mem=100GB  



#SBATCH --export=NONE 



#SBATCH --time=1-12:00:00 







#SBATCH --output=retune_basedp_13b.%j.out



#SBATCH --error=retune_basedp_13b.%j.err







# To see ID and state of GPUs assigned



nvidia-smi 







## Activate the python virtual environment



source  ../retuning_env/bin/activate







## Execute your script



python3 -u train.py model=llama13b datasets=[baseline_dp.json] exp_name=my_baseline_dp_13b gradient_accumulation_steps=64 batch_size=64 eval_batch_size=4 n_eval_examples=16


