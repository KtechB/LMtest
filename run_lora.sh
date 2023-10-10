MODEL=mistralai/Mistral-7B-Instruct-v0.1

CUDA_VISIBLE_DEVICES=0 python src/train_bash.py \
    --stage sft \
    --model_name_or_path $MODEL \
    --do_train \
    --dataset "60k_sectionized1000" \
    --template llama2_plain \
    --finetuning_type lora \
    --lora_target q_proj,v_proj \
    --output_dir output_mistral \
    --overwrite_cache \
    --per_device_train_batch_size 4 \
    --gradient_accumulation_steps 4 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --save_steps 500 \
    --learning_rate 5e-5 \
    --num_train_epochs 1.0 \
    --plot_loss \
    --fp16
#     --dataset "60k_sectionized1000" \