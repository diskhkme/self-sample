#!/bin/bash
export BASE_PATH=$(pwd)
export PYTHONPATH=$BASE_PATH
python -u $BASE_PATH/main.py \
--lr 0.005 --name test-density \
--iterations 10004 \
--export-interval 1000 \
--pc data/00000008_high_100000.xyz \
--init-var 0.15 \
--D1 4000 --D2 4000 \
--save-path demo-results/00000008_high_100000_noise \
--sampling-mode noise \
--noise_ratio 0.5 \
--noise_level 0.01 \
--batch-size 2 \
--k 40 \
--p1 0.85 --p2 0.2 \
--force-normal-estimation --mse

python -u $BASE_PATH/inference.py \
--lr 0.001 --name 00000008_high_100000_noise_result \
--iterations 25 \
--export-interval 100 \
--pc data/00000008_high_100000.xyz \
--init-var 0.15 \
--D1 4000 --D2 4000 \
--save-path demo-results/00000008_high_100000_noise \
--generator demo-results/00000008_high_100000_noise/generators/model5000.pt \
--sampling-mode noise \
--noise_ratio 0.5 \
--noise_level 0.01 \
--p1 0.8 --p2 0.2 \
--batch-size 2 \
--k 40 \
--force-normal-estimation