
/**
   UPF WORKFLOW.SWIFT
   Evaluate an Unrolled Parameter File (UPF)
*/

import assert;
import io;
import json;
import files;
import string;
import sys;

import candle_utils;
report_env();

string FRAMEWORK = "keras";

// Scan command line
file   bagging        = input(argv("f"));
int    benchmark_timeout = toint(argv("benchmark_timeout", "-1"));

string model_name     = getenv("MODEL_NAME");
string exp_id         = getenv("EXPID");
string turbine_output = getenv("TURBINE_OUTPUT");
int n_bootstrap       = toint( getenv( "N_BOOTSTRAP" ) );

// Report some key facts:
printf("BAGGING: %s", filename(bagging));
system1("date \"+%Y-%m-%d %H:%M\"");

// Read unrolled parameter file
string bagging_lines[] = file_lines(bagging);

// Resultant output values:
string results[];

// Evaluate each parameter set
foreach params,i in bagging_lines
{
  foreach bs in [ 0 : n_bootstrap ]
  {
    printf("params: %s", params);
    printf("bootstrap: %d", bs);
    // id = json_get(params, "id");
    // NOTE: obj() is in the obj_*.swift supplied by workflow.sh
    // id = "id_%02i"%i;
    id = "id_%02i"%i + "_" + "bs_%i"%bs;
    //obj( params, id );
    results[ i * n_bootstrap + bs ] = obj(params, id);
    // hjy - temporarily removed
    // assert(results[i] != "EXCEPTION", "exception in obj()!");
  }
}

// Join all result values into one big semicolon-delimited string
string result = join(results, ";");
// and print it
printf(result);
