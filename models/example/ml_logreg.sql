{{
    config(
        materialized='model',
        ml_config={
            'model_type': 'logistic_reg',
            'early_stop': true,
            'ls_init_learn_rate': 2
        }
    )
}}

SELECT * FROM {{ ref('data_train') }}