This README provides instructions for reproducing the results of our assignment.

Setup:

Python Environment: Create a Python virtual environment using Python 3.8 to ensure compatibility with all dependencies.
Install Requirements: Once the environment is set up, install the necessary packages by running:

pip install -r requirements.txt

Data Generation:
Generate Data: Run the data generation scripts located in the data_generation folder.
Organize Data: After generating the data, place the output files in the directory containing train.py.

Model Training:
Prepare Data: Each generated data file is named to indicate whether it is for scratchpad, baseline, or retuning.
Adjust Hyperparameters: Adjust hyperparameters based on your compute resources. In our setup, we reduced:
Training examples from 500,000 to 200,000.
Number of epochs from 5 to 2.
Batch size and gradient accumulation steps as required.
Run Training: Start training using the following command:

python3 -u train.py model=llama7b datasets=[recursive_dp_resampled_test.json] exp_name=my_recursive_dp_7b gradient_accumulation_steps=64 batch_size=64 eval_batch_size=4 n_eval_examples=16

Replace model and datasets values as needed.

Slurm Integration:
If using the Hopper cluster, the repository includes SLURM files to facilitate training on this system.

Model Requirements:
A total of 18 models will be trained on the datasets. The resulting LoRA weights will be stored in the cache folder.

Evaluation:
For evaluation, run the appropriate Jupyter notebooks in the evaluation folder. Each notebook is named according to the corresponding task. Update the lora directory path with your specific LoRA weight paths.
