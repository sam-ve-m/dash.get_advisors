fission spec init
fission env create --spec --name dash-enum-advisor-env --image newdeploy --poolsize 0 --version 3 --imagepullsecret "nexus-v3" --spec
fission fn create --spec --name dash-enum-advisor-fn --env dash-enum-advisor-env --code fission.py --targetcpu 80 --executortype newdeploy --maxscale 3 --requestsperpod 10000 --spec
fission route create --spec --name dash-enum-advisor-rt --method GET --url /enum/advisor --function dash-enum-advisor-fn
