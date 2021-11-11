#export HOME=${HOME_OVERRRIDE:-/home/heasoft}

. /opt/xmmsas/setsas.sh;export SAS_CCFPATH=/opt/ccf/

#rsync -v -a --delete --delete-after --force --include='*.CCF' --exclude='*/' xmm.esac.esa.int::XMM_VALID_CCF /opt/ccf/

