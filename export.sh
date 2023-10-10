#MODEL=mistralai/Mistral-7B-Instruct-v0.1
MODEL=meta-llama/Llama-2-70b-chat-hf

python src/export_model.py \
    --model_name_or_path $MODEL \
    --template llama2_plain \
    --finetuning_type lora \
    --checkpoint_dir sci-70b/checkpoint-75 \
    --output_dir llama70_lora_export \
    --fp16
