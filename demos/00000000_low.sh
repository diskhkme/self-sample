#!/bin/bash
export BASE_PATH=$(pwd)
export PYTHONPATH=$BASE_PATH
python -u $BASE_PATH/main.py \
--lr 0.005 --name test-density \
--iterations 10004 \
--export-interval 1000 \
--pc data/00000000_low.xyz \
--init-var 0.15 \
--D1 400 --D2 400 \
--save-path demo-results/00000000 \
--sampling-mode curvature \
--batch-size 2 \
--k 8 \
--p1 0.85 --p2 0.2 \
--force-normal-estimation --mse

python -u $BASE_PATH/inference.py \
--lr 0.001 --name 00000000_result \
--iterations 25 \
--export-interval 100 \
--pc data/00000000_low.xyz \
--init-var 0.15 \
--D1 400 --D2 400 \
--save-path demo-results/00000000 \
--generator demo-results/00000000/generators/model5000.pt \
--sampling-mode curvature \
--p1 0.8 --p2 0.2 \
--batch-size 2 \
--k 8 \
--force-normal-estimation
