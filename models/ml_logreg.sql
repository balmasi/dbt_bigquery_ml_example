{#  Configuration Help:

materialized -> This is the custom materialization used to generate the ML model
ml_config -> This is where the configuration for your BigQuery ML model goes
post_hook -> This post-hook saves all the model metadata for each training run into an audit table defined via the variables in dbt_project.yml

#}
{{
    config(
        materialized='model', 

        ml_config={ 
            'model_type': 'logistic_reg',
            'early_stop': true,
            'ls_init_learn_rate': 2
        },
        
        post_hook="{{ dbt_ml.model_audit() }}" 
    )
}}

SELECT * FROM {{ ref('features') }}