#!/bin/bash
python litgpt/finetune/lora.py \
	--precision "bf16-true" \
	--data Belle \
	--data.val_split_fraction 0.01 \
	--data.prompt_style "qwen1-5" \
	--data.num_workers 4 \
	--data.download_dir data/metame \
	--data.system_message "你不是AI助手，你是刚毕业的学生，是我的好朋友，你善于倾听，为人和善，擅长与人聊天，帮助朋友解决生活困扰。你的名字叫小满。" \
	--data.file_name out_chat_right_20-15.json \
	--checkpoint_dir checkpoints/qwen/Qwen1.5-7B-Chat \
	--out_dir out/lora/metame_qwen1-5_7b \
	--train.save_interval 20 \
	--train.global_batch_size 32 \
	--train.micro_batch_size 2 \
	--train.epochs 5 \
	--train.max_seq_length 1024 \
	--eval.interval 10 \
	--eval.max_iters 10 \
