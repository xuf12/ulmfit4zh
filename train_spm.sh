# Partially taken from here
#https://github.com/n-waves/poleval2018/blob/master/task3/prepare-data3-most_low30k.sh
vocabs=( 4000 8000 16000 20000 25000 32000 40000 50000 100000 )
DATA_DIR="./data"
OUTPUT_DIR="./sp_models"
SENTENCEPIECE_MODEL_NAME="${OUTPUT_DIR}/sp" 


for vocab in "${vocabs[@]}"
do
    # train sentencepiece model
    if [ ! -f "${SENTENCEPIECE_MODEL_NAME}_${vocab}.model" ]; then
    echo "Creating ${SENTENCEPIECE_MODEL_NAME}_wikizh_${vocab}.model"
    spm_train --input="${DATA_DIR}/wikizh_text_clean.txt" --model_prefix="${SENTENCEPIECE_MODEL_NAME}_wikizh_${vocab}"\
              --vocab_size=${vocab} --unk_id=0 --pad_id=1 --bos_id=2 --eos_id=3 --normalization_rule_name=nmt_nfkc_cf\
              --character_coverage=0.9995
    else
    echo "Setencepiece model '${SENTENCEPIECE_MODEL_NAME}.model' already exists."
    fi
done
