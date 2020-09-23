
# CF-BAGGING CFG SYS 1

# The number of MPI processes
# Note that 1 process is reserved for Swift/T
# For example, if PROCS=4 that gives you 3 workers,
# i.e., 3 concurrent Keras runs.
export PROCS=${PROCS:-6}

# MPI processes per node.  This should not exceed PROCS.
# Cori has 32 cores per node, 128GB per node
export PPN=${PPN:-6}

#export QUEUE=${QUEUE:-batch}

# Cori: (cf. sched-cori)
# export QUEUE=${QUEUE:-debug}
# Cori queues: debug, regular
# export QUEUE=regular
# export QUEUE=debug
# CANDLE on Cori:
# export PROJECT=m2924

# Theta: (cf. sched-theta)
# export QUEUE=${QUEUE:-debug-cache-quad}
# export QUEUE=${QUEUE:-debug-flat-quad}
# export PROJECT=${PROJECT:-ecp-testbed-01}
# export PROJECT=Candle_ECP
# export PROJECT=CSC249ADOA01

# Summit:
#export QUEUE=${QUEUE:-batch}
export PROJECT=MED106

export WALLTIME=${WALLTIME:-1:00}

# export MAIL_ENABLED=1
# export MAIL_ADDRESS=wozniak@mcs.anl.gov

# Benchmark run timeout: benchmark run will timeouT
# after the specified number of seconds. -1 is no timeout.
BENCHMARK_TIMEOUT=${BENCHMARK_TIMEOUT:-3600}

# Pilot 3 Challenge Problem
# Specify number of data partitions and number of bootstrapps
# Make sure you requested NPROCS = 
export N_BOOTSTRAP=5

# Uncomment below to use custom python script to run
# Use file name without .py (e.g, my_script.py)
# BENCHMARK_DIR=/path/to/
# MODEL_PYTHON_SCRIPT=my_script
