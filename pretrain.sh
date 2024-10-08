#!/bin/bash

# llava 23s with qwen1.5-32b-chat
deepspeed llava/train/train_mem.py \
    --output_dir /data/agent_h/vsr2/checkpoints/facellava-23s-0.1-06012024-qwen32bchat-pretrain \
    --model_name_or_path /data/agent_h/vsr2/llms/qwen1.5-32b-chat \
    --data_path /data/agent_h/vsr2/datasets/datasets_chunyu/facellava_20240531_23_simple/label.json \
    --image_folder /data/agent_h/vsr2/datasets/datasets_chunyu/facellava_20240531_23_simple/images \
    --vision_tower /data/agent_h/vsr2/llms/clip-vit-large-patch14-336 \
    --mm_projector_type mlp2x_gelu \
    --deepspeed ./scripts/zero3.json \
    --version plain \
    --tune_mm_mlp_adapter True \
    --mm_vision_select_layer -2 \
    --mm_use_im_start_end False \
    --mm_use_im_patch_token False \
    --bf16 True \
    --num_train_epochs 3 \
    --per_device_train_batch_size 16 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 2 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 24000 \
    --save_total_limit 1 \
    --learning_rate 1e-3 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 1 \
    --tf32 True \
    --model_max_length 2048 \
    --gradient_checkpointing True \
    --dataloader_num_workers 4 \
    --lazy_preprocess True \
    --report_to tensorboard 

# # llava 23s with qwen1.5-32b fine tune
# deepspeed llava/train/train_mem.py \
#     --output_dir /data/agent_h/vsr2/checkpoints/facellava-23s-0.1-06012024-qwen32bchat \
#     --model_name_or_path /data/agent_h/vsr2/llms/qwen1.5-32b-chat \
#     --data_path /data/agent_h/vsr2/datasets/datasets_chunyu/facellava_20240531_23_simple/label.json \
#     --image_folder /data/agent_h/vsr2/datasets/datasets_chunyu/facellava_20240531_23_simple/images \
#     --pretrain_mm_mlp_adapter /data/agent_h/vsr2/checkpoints/facellava-23s-0.1-06012024-qwen32bchat-pretrain/mm_projector.bin \
#     --vision_tower /data/agent_h/vsr2/llms/clip-vit-large-patch14-336 \
#     --deepspeed ./scripts/zero3.json \
#     --version plain \
#     --mm_projector_type mlp2x_gelu \
#     --mm_vision_select_layer -2 \
#     --mm_use_im_start_end False \
#     --mm_use_im_patch_token False \
#     --image_aspect_ratio pad \
#     --group_by_modality_length True \
#     --bf16 True \
#     --num_train_epochs 10 \
#     --per_device_train_batch_size 16 \
#     --per_device_eval_batch_size 4 \
#     --gradient_accumulation_steps 1 \
#     --evaluation_strategy "no" \
#     --save_strategy "steps" \
#     --save_steps 50000 \
#     --save_total_limit 1 \
#     --learning_rate 2e-5 \
#     --weight_decay 0. \
#     --warmup_ratio 0.03 \
#     --lr_scheduler_type "cosine" \
#     --logging_steps 1 \
#     --tf32 True \
#     --model_max_length 2048 \
#     --gradient_checkpointing True \
#     --dataloader_num_workers 4 \
#     --lazy_preprocess True \
#     --report_to tensorboard

# ----- 20240602 -----

# # llava 23s with qwen1.5-7b-chat
# deepspeed llava/train/train_mem.py \
#     --output_dir /data/agent_h/vsr2/checkpoints/facellava-23s-0.1-06012024-qwen7bchat-pretrain \
#     --model_name_or_path /data/agent_h/vsr2/llms/qwen1.5/qwen1.5-7B-chat \
#     --data_path /data/agent_h/vsr2/datasets/datasets_chunyu/facellava_20240531_23_simple/label.json \
#     --image_folder /data/agent_h/vsr2/datasets/datasets_chunyu/facellava_20240531_23_simple/images \
#     --vision_tower /data/agent_h/vsr2/llms/clip-vit-large-patch14-336 \
#     --mm_projector_type mlp2x_gelu \
#     --deepspeed ./scripts/zero1.json \
#     --version plain \
#     --tune_mm_mlp_adapter True \
#     --mm_vision_select_layer -2 \
#     --mm_use_im_start_end False \
#     --mm_use_im_patch_token False \
#     --bf16 True \
#     --num_train_epochs 3 \
#     --per_device_train_batch_size 32 \
#     --per_device_eval_batch_size 4 \
#     --gradient_accumulation_steps 1 \
#     --evaluation_strategy "no" \
#     --save_strategy "steps" \
#     --save_steps 24000 \
#     --save_total_limit 1 \
#     --learning_rate 1e-3 \
#     --weight_decay 0. \
#     --warmup_ratio 0.03 \
#     --lr_scheduler_type "cosine" \
#     --logging_steps 1 \
#     --tf32 True \
#     --model_max_length 2048 \
#     --gradient_checkpointing True \
#     --dataloader_num_workers 4 \
#     --lazy_preprocess True \
#     --report_to tensorboard 

# # llava 23s with qwen1.5-7b fine tune
# deepspeed llava/train/train_mem.py \
#     --output_dir /data/agent_h/vsr2/checkpoints/facellava-23s-0.1-06012024-qwen7bchat \
#     --model_name_or_path /data/agent_h/vsr2/llms/qwen1.5/qwen1.5-7B-chat \
#     --data_path /data/agent_h/vsr2/datasets/datasets_chunyu/facellava_20240531_23_simple/label.json \
#     --image_folder /data/agent_h/vsr2/datasets/datasets_chunyu/facellava_20240531_23_simple/images \
#     --pretrain_mm_mlp_adapter /data/agent_h/vsr2/checkpoints/facellava-23s-0.1-06012024-qwen7bchat-pretrain/mm_projector.bin \
#     --vision_tower /data/agent_h/vsr2/llms/clip-vit-large-patch14-336 \
#     --deepspeed ./scripts/zero1.json \
#     --version plain \
#     --mm_projector_type mlp2x_gelu \
#     --mm_vision_select_layer -2 \
#     --mm_use_im_start_end False \
#     --mm_use_im_patch_token False \
#     --image_aspect_ratio pad \
#     --group_by_modality_length True \
#     --bf16 True \
#     --num_train_epochs 10 \
#     --per_device_train_batch_size 16 \
#     --per_device_eval_batch_size 4 \
#     --gradient_accumulation_steps 1 \
#     --evaluation_strategy "no" \
#     --save_strategy "steps" \
#     --save_steps 50000 \
#     --save_total_limit 1 \
#     --learning_rate 2e-5 \
#     --weight_decay 0. \
#     --warmup_ratio 0.03 \
#     --lr_scheduler_type "cosine" \
#     --logging_steps 1 \
#     --tf32 True \
#     --model_max_length 2048 \
#     --gradient_checkpointing True \
#     --dataloader_num_workers 4 \
#     --lazy_preprocess True \
#     --report_to tensorboard

# ----- 20240601 -----

# # llava 5s with qwen1.5-7b-chat
# deepspeed llava/train/train_mem.py \
#     --output_dir /data/agent_h/vsr2/checkpoints/facellava-5s-0.1-06012024-qwen7bchat-pretrain \
#     --model_name_or_path /data/agent_h/vsr2/llms/qwen1.5/qwen1.5-7B-chat \
#     --data_path /data/agent_h/vsr2/datasets/datasets_chunyu/facellava_20240531_5_simple/label.json \
#     --image_folder /data/agent_h/vsr2/datasets/datasets_chunyu/facellava_20240531_5_simple/images \
#     --vision_tower /data/agent_h/vsr2/llms/clip-vit-large-patch14-336 \
#     --mm_projector_type mlp2x_gelu \
#     --deepspeed ./scripts/zero1.json \
#     --version plain \
#     --tune_mm_mlp_adapter True  \ 
#     --mm_vision_select_layer -2 \
#     --mm_use_im_start_end False \
#     --mm_use_im_patch_token False \
#     --bf16 True \
#     --num_train_epochs 3 \
#     --per_device_train_batch_size 32 \
#     --per_device_eval_batch_size 4 \
#     --gradient_accumulation_steps 1 \
#     --evaluation_strategy "no" \
#     --save_strategy "steps" \
#     --save_steps 24000 \
#     --save_total_limit 1 \
#     --learning_rate 1e-3 \
#     --weight_decay 0. \
#     --warmup_ratio 0.03 \
#     --lr_scheduler_type "cosine" \
#     --logging_steps 1 \
#     --tf32 True \
#     --model_max_length 2048 \
#     --gradient_checkpointing True \
#     --dataloader_num_workers 4 \
#     --lazy_preprocess True \
#     --report_to tensorboard

# # llava original with qwen1.5-7b fine tune
# deepspeed llava/train/train_mem.py \
#     --output_dir /data/agent_h/vsr2/checkpoints/facellava-5s-0.1-06012024-qwen7bchat \
#     --model_name_or_path /data/agent_h/vsr2/llms/qwen1.5/qwen1.5-7B-chat \
#     --data_path /data/agent_h/vsr2/datasets/datasets_chunyu/facellava_20240531_5_simple/label.json \
#     --image_folder /data/agent_h/vsr2/datasets/datasets_chunyu/facellava_20240531_5_simple/images \
#     --pretrain_mm_mlp_adapter /data/agent_h/vsr2/checkpoints/facellava-5s-0.1-06012024-qwen7bchat-pretrain/mm_projector.bin \
#     --vision_tower /data/agent_h/vsr2/llms/clip-vit-large-patch14-336 \
#     --deepspeed ./scripts/zero1.json \
#     --version plain \
#     --mm_projector_type mlp2x_gelu \
#     --mm_vision_select_layer -2 \
#     --mm_use_im_start_end False \
#     --mm_use_im_patch_token False \
#     --image_aspect_ratio pad \
#     --group_by_modality_length True \
#     --bf16 True \
#     --num_train_epochs 10 \
#     --per_device_train_batch_size 16 \
#     --per_device_eval_batch_size 4 \
#     --gradient_accumulation_steps 1 \
#     --evaluation_strategy "no" \
#     --save_strategy "steps" \
#     --save_steps 50000 \
#     --save_total_limit 1 \
#     --learning_rate 2e-5 \
#     --weight_decay 0. \
#     --warmup_ratio 0.03 \
#     --lr_scheduler_type "cosine" \
#     --logging_steps 1 \
#     --tf32 True \
#     --model_max_length 2048 \
#     --gradient_checkpointing True \
#     --dataloader_num_workers 4 \
#     --lazy_preprocess True \
#     --report_to tensorboard


# ----------------- exp1 20240531 ----------------

# # llava original with qwen1.5-7b-chat
# deepspeed llava/train/train_mem.py \
#     --output_dir /data/agent_h/vsr2/checkpoints/llava-1.5-05312023-qwen7bchat-pretrain \
#     --model_name_or_path /data/agent_h/vsr2/llms/qwen1.5/qwen1.5-7B-chat \
#     --data_path /data/agent_h/vsr2/datasets/LLaVA-Pretrain/blip_laion_cc_sbu_558k.json \
#     --image_folder /data/agent_h/vsr2/datasets/LLaVA-Pretrain/images \
#     --vision_tower /data/agent_h/vsr2/llms/clip-vit-large-patch14-336 \
#     --mm_projector_type mlp2x_gelu \
#     --deepspeed ./scripts/zero1.json \
#     --version plain \
#     --tune_mm_mlp_adapter True \
#     --mm_vision_select_layer -2 \
#     --mm_use_im_start_end False \
#     --mm_use_im_patch_token False \
#     --bf16 True \
#     --num_train_epochs 1 \
#     --per_device_train_batch_size 32 \
#     --per_device_eval_batch_size 4 \
#     --gradient_accumulation_steps 1 \
#     --evaluation_strategy "no" \
#     --save_strategy "steps" \
#     --save_steps 24000 \
#     --save_total_limit 1 \
#     --learning_rate 1e-3 \
#     --weight_decay 0. \
#     --warmup_ratio 0.03 \
#     --lr_scheduler_type "cosine" \
#     --logging_steps 1 \
#     --tf32 True \
#     --model_max_length 2048 \
#     --gradient_checkpointing True \
#     --dataloader_num_workers 4 \
#     --lazy_preprocess True \
#     --report_to tensorboard

# llava original with qwen1.5-7b fine tune
# deepspeed llava/train/train_mem.py \
#     --output_dir /data/agent_h/vsr2/checkpoints/llava-1.5-05312023-qwen7bchat \
#     --model_name_or_path /data/agent_h/vsr2/llms/qwen1.5/qwen1.5-7B-chat \
#     --data_path /data/agent_h/vsr2/datasets/LLaVA-Pretrain/blip_laion_cc_sbu_558k.json \
#     --image_folder /data/agent_h/vsr2/datasets/LLaVA-Pretrain/images \
#     --vision_tower /data/agent_h/vsr2/llms/clip-vit-large-patch14-336 \
#     --pretrain_mm_mlp_adapter /data/agent_h/vsr2/checkpoints/llava-1.5-05312023-qwen7bchat-pretrain/mm_projector.bin \
#     --deepspeed ./scripts/zero1.json \
#     --version plain \
#     --mm_projector_type mlp2x_gelu \
#     --mm_vision_select_layer -2 \
#     --mm_use_im_start_end False \
#     --mm_use_im_patch_token False \
#     --image_aspect_ratio pad \
#     --group_by_modality_length True \
#     --bf16 True \
#     --num_train_epochs 1 \
#     --per_device_train_batch_size 16 \
#     --per_device_eval_batch_size 4 \
#     --gradient_accumulation_steps 1 \
#     --evaluation_strategy "no" \
#     --save_strategy "steps" \
#     --save_steps 50000 \
#     --save_total_limit 1 \
#     --learning_rate 2e-5 \
#     --weight_decay 0. \
#     --warmup_ratio 0.03 \
#     --lr_scheduler_type "cosine" \
#     --logging_steps 1 \
#     --tf32 True \
#     --model_max_length 2048 \
#     --gradient_checkpointing True \
#     --dataloader_num_workers 4 \
#     --lazy_preprocess True \
#     --report_to tensorboard






# ---------------- exp 0 20240531 ----------------
# llava original with qwen1.5-0.5b
# deepspeed llava/train/train_mem.py \
#     --data_path /data/agent_h/vsr2/datasets/LLaVA-Pretrain/blip_laion_cc_sbu_558k.json \
#     --image_folder /data/agent_h/vsr2/datasets/LLaVA-Pretrain/images \
#     --output_dir /data/agent_h/vsr2/checkpoints/llava-1.5-v0.1-0.8b-pretrain \
#     --vision_tower /data/agent_h/vsr2/llms/clip-vit-large-patch14-336 \
#     --mm_projector_type mlp2x_gelu \
#     --model_name_or_path /data/agent_h/vsr2/llms/Qwen1.5-0.5B \
#     --deepspeed ./scripts/zero1.json \
#     --version plain \
#     --tune_mm_mlp_adapter True \
#     --mm_vision_select_layer -2 \
#     --mm_use_im_start_end False \
#     --mm_use_im_patch_token False \
#     --bf16 True \
#     --num_train_epochs 1 \
#     --per_device_train_batch_size 32 \
#     --per_device_eval_batch_size 4 \
#     --gradient_accumulation_steps 1 \
#     --evaluation_strategy "no" \
#     --save_strategy "steps" \
#     --save_steps 24000 \
#     --save_total_limit 1 \
#     --learning_rate 1e-3 \
#     --weight_decay 0. \
#     --warmup_ratio 0.03 \
#     --lr_scheduler_type "cosine" \
#     --logging_steps 1 \
#     --tf32 True \
#     --model_max_length 2048 \
#     --gradient_checkpointing True \
#     --dataloader_num_workers 4 \
#     --lazy_preprocess True \
#     --report_to tensorboard

# # llava original with qwen1.5-0.5b fine tune
# deepspeed llava/train/train_mem.py \
#     --deepspeed ./scripts/zero1.json \
#     --model_name_or_path /data/agent_h/vsr2/llms/Qwen1.5-0.5B \
#     --version plain \
#     --data_path /data/agent_h/vsr2/datasets/LLaVA-Pretrain/blip_laion_cc_sbu_558k.json \
#     --image_folder /data/agent_h/vsr2/datasets/LLaVA-Pretrain/images \
#     --vision_tower /data/agent_h/vsr2/llms/clip-vit-large-patch14-336 \
#     --pretrain_mm_mlp_adapter  /data/agent_h/vsr2/checkpoints/llava-1.5-v0.1-0.8b-pretrain/mm_projector.bin \
#     --output_dir /data/agent_h/vsr2/checkpoints/llava-1.5-v0.1-0.8b \
#     --mm_projector_type mlp2x_gelu \
#     --mm_vision_select_layer -2 \
#     --mm_use_im_start_end False \
#     --mm_use_im_patch_token False \
#     --image_aspect_ratio pad \
#     --group_by_modality_length True \
#     --bf16 True \
#     --num_train_epochs 1 \
#     --per_device_train_batch_size 16 \
#     --per_device_eval_batch_size 4 \
#     --gradient_accumulation_steps 1 \
#     --evaluation_strategy "no" \
#     --save_strategy "steps" \
#     --save_steps 50000 \
#     --save_total_limit 1 \
#     --learning_rate 2e-5 \
#     --weight_decay 0. \
#     --warmup_ratio 0.03 \
#     --lr_scheduler_type "cosine" \
#     --logging_steps 1 \
#     --tf32 True \
#     --model_max_length 2048 \
#     --gradient_checkpointing True \
#     --dataloader_num_workers 4 \
#     --lazy_preprocess True \
#     --report_to tensorboard

