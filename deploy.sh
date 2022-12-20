#!/usr/bin/bash
fission spec init
fission env create --spec --name env-get-advisor --image nexus.sigame.com.br/fission-cx-env-3.8:0.0.3 --builder nexus.sigame.com.br/fission-cx-builder-3.8:0.0.3
fission fn create --spec --name fn-get-advisor --env env-get-advisor --src "./func/*" --entrypoint main.get_enums --executortype newdeploy
fission route create --spec --name rt-get-advisor --method GET --url /enum/advisor --function fn-get-advisor
