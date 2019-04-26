
# LANGS DUNEDIN
# Language settings for Dunedin
# Assumes WORKFLOWS_ROOT, BENCHMARK_DIR, BENCHMARKS_ROOT are set

# Python
export PYTHONPATH=${PYTHONPATH:-}${PYTHONPATH:+:}
PYTHONPATH+=$WORKFLOWS_ROOT/common/python:
PYTHONPATH+=$HOME/proj/swork/lock-mgr/lib
PATH=/usb1/wozniak/Public/sfw/anaconda3/bin:$PATH

# R
# export R_HOME=/home/wozniak/Public/sfw/R-3.4.1/lib/R
# export R_HOME=/home/wozniak/Public/sfw/R-3.4.3/lib/R
export R_HOME=/home/wozniak/Public/sfw/R-3.5.3/lib/R

# Swift/T
# export PATH=$HOME/Public/sfw/swift-t/stc/bin:$PATH
export PATH=$HOME/sfw/swift-t/stc/bin:$PATH
SWIFT_IMPL="app"

# EMEWS Queues for R
# EQR=/opt/EQ-R
EQR=$WORKFLOWS_ROOT/common/ext/EQ-R
# Resident task workers and ranks
if [ -z ${TURBINE_RESIDENT_WORK_WORKERS+x} ]
then
    # Resident task workers and ranks
    export TURBINE_RESIDENT_WORK_WORKERS=1
    export RESIDENT_WORK_RANKS=$(( PROCS - 2 ))
fi

# LD_LIBRARY_PATH
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:-}${LD_LIBRARY_PATH:+:}
LD_LIBRARY_PATH+=$R_HOME/lib

show PYTHONPATH
show LD_LIBRARY_PATH

# For test output processing:
LOCAL=1
CRAY=0

# Cf. utils.sh ...
which_check python
which_check swift-t
# Log settings to output
# show     PYTHONHOME
# log_path LD_LIBRARY_PATH
# log_path PYTHONPATH
