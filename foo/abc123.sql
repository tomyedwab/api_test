// Title: Test with UDF
// Description: A test of version 0.6 with the new UDF export.

// ==== BigQuery ====

SELECT * FROM [i_dont_care] GROUP BY something LIMIT 123

// ==== JavaScript UDF ====

// Example user-defined function, documentation: https://goo.gl/6KR8O0
// Sample SQL: SELECT outputA, outputB FROM (passthrough(SELECT "abc" AS inputA, "def" AS inputB))

/*
function passthroughExample(row, emit) {
  emit({outputA: row.inputA, outputB: row.inputB});
}

bigquery.defineFunction(
  'passthrough',                           // Name of the function exported to SQL
  ['inputA', 'inputB'],                    // Names of input columns
  [{'name': 'outputA', 'type': 'string'},  // Output schema
   {'name': 'outputB', 'type': 'string'}],
  passthroughExample                       // Reference to JavaScript UDF
);
*/