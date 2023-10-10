
MODEL=meta-llama/Llama-2-70b-chat-hf
deepspeed --num_gpus 2 --master_port=9901 src/train_bash.py \
    --stage sft \
    --model_name_or_path $MODEL \
    --do_train \
    --dataset "60k_sectionized1000" \
    --template llama2_plain \
    --finetuning_type lora \
    --lora_target q_proj,v_proj \
    --output_dir output_mistral \
    --overwrite_cache \
    --per_device_train_batch_size 1 \
    --gradient_accumulation_steps 16 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --save_steps 20 \
    --learning_rate 5e-5 \
    --num_train_epochs 1.0 \
    --plot_loss \
    --fp16 \
    --quantization_bit 4
#     --dataset "60k_sectionized1000" \