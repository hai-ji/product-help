<div class="nested0" aria-labelledby="ariaid-title1" topicindex="1" topicid="apc1572294093130" id="apc1572294093130"><h1 class="title topictitle1" id="ariaid-title1">DecisionForestPerSegment (ML Engine)</h1><div class="body conbody">
<p class="p">The DecisionForestPerSegment function uses a training data set to create a predictive model for each partition of a partitioned input file. You can input the model to the <a href="vzd1572292426419.md#vzd1572292426419">DecisionForestPredictPerSegment</a> function, which uses it to make predictions.</p></div><div class="topic reference nested1" aria-labelledby="ariaid-title2" topicindex="2" topicid="qzk1572294117512" xml:lang="en-us" lang="en-us" id="qzk1572294117512">
<h2 class="title topictitle2" id="ariaid-title2">DecisionForestPerSegment Syntax</h2><div class="body refbody"><div class="section" id="qzk1572294117512__section_N10025_N10022_N10001"><pre class="pre codeblock" xml:space="preserve"><code>SELECT * FROM DecisionForestPerSegment (
  <span>ON { <var class="keyword varname">table</var> | <var class="keyword varname">view</var> | (<var class="keyword varname">query</var>) }</span> AS InputTable
    PARTITION BY { <var class="keyword varname">partition_column</var> [, ...] | 1 }
  [ <span>ON { <var class="keyword varname">table</var> | <var class="keyword varname">view</var> | (<var class="keyword varname">query</var>) }</span> AS AttributeTable
    PARTITION BY { <var class="keyword varname">partition_column</var> [, ...] | 1 } ]
  [ <span>ON { <var class="keyword varname">table</var> | <var class="keyword varname">view</var> | (<var class="keyword varname">query</var>) }</span> AS ParameterTable
    PARTITION BY { <var class="keyword varname">partition_column</var> [, ...] | 1 } ]
  USING
  ResponseColumn ('<var class="keyword varname">response_column</var>')
  [ NumericInputs ({ '<var class="keyword varname">numeric_input_column</var>' | <var class="keyword varname">numeric_input_column_range</var> }[,...]) ]
  [ CategoricalInputs ({ '<var class="keyword varname">categorical_input_column</var>' | <var class="keyword varname">categorical_input_column_range</var> }[,...]) ]
  [ TreeType ( { 'regression' | 'classification' } ) ]
  [ NumTrees (<var class="keyword varname">number_of_trees</var>) ]
  [ MinNodeSize (<var class="keyword varname">min_node_size</var>) ]
  [ Variance (<var class="keyword varname">variance</var>) ]
  [ MaxDepth (<var class="keyword varname">max_depth</var>) ]
  
  [ CategoricalEncoding ({ 'Target' | 'GrayCode' | 'Hashing' }) ]
  [ MinSamplesForEncoding (<var class="keyword varname">k</var>) ]
  [ Smoothing (<var class="keyword varname">f</var>) ]
  [ ErrorHandler <span><b>{'true'|'t'|'yes'|'y'|'1'|'false'|'f'|'no'|'n'|'0'}</b></span> ]
  [ Mtry (<var class="keyword varname">mtry</var>) ]
  [ MtrySeed (<var class="keyword varname">mtryseed</var>) ]
  [ DisplayNumProcessedRows <span><b>{'true'|'t'|'yes'|'y'|'1'|'false'|'f'|'no'|'n'|'0'}</b></span> ]
  [ Seed (<var class="keyword varname">seed</var>) ]
) AS alias;</code></pre></div></div><div class="related-links"><div class="linklistheader"><p></p><b>Related Information</b></div>
<ul class="linklist linklist"><div class="linklistmember"><a href="eta1543514041091.md">Comments in Queries</a></div><div class="linklistmember"><a href="ndv1557782188375.md">Column Specification Syntax Elements</a></div></ul></div></div><div class="topic reference nested1" aria-labelledby="ariaid-title3" topicindex="3" topicid="oog1572294158968" xml:lang="en-us" lang="en-us" id="oog1572294158968">
<h2 class="title topictitle2" id="ariaid-title3">DecisionForestPerSegment Syntax Elements</h2><div class="body refbody"><div class="section" id="oog1572294158968__section_N10011_N1000E_N10001"><dl class="dl parml"><dt class="dt pt dlterm">ResponseColumn</dt><dd class="dd pd">Specify the name of the InputTable column that contains the response variable (that is, the quantity you want to predict).</dd><dt class="dt pt dlterm">NumericInputs</dt><dd class="dd pd">[Optional] Specify the names of the InputTable columns that have the numeric predictor variables (which must be numeric values).</dd><dd class="dd pd ddexpand">If you specify NumericInputs, its values are the default values for every model.</dd><dd class="dd pd ddexpand">If you specify values for a partition using AttributeTable, the values in AttributeTable override those specified in NumericInputs for the model the function builds for that partition.</dd><dd class="dd pd ddexpand">Teradata recommends specifying NumericInputs with values as a superset of all values supplied through AttributeTable for collaborative optimizations.</dd><dt class="dt pt dlterm">CategoricalInputs</dt><dd class="dd pd">[Optional] Specify the names of the InputTable columns that have the categorical predictor variables (which can be either numeric or VARCHAR values).</dd><dd class="dd pd ddexpand">If you specify CategoricalInputs, its values are the default values for every model.</dd><dd class="dd pd ddexpand">If you specify values for a partition using AttributeTable, the values in AttributeTable override those specified in CategoricalInputs for the model the function builds for that partition.</dd><dd class="dd pd ddexpand">Teradata recommends specifying CategoricalInputs with values as a superset of all values supplied through AttributeTable for collaborative optimizations.</dd><dt class="dt pt dlterm">TreeType</dt><dd class="dd pd">[Optional] Specify whether the analysis is a regression (continuous response variable) or a multiple-class classification (predicting result from the number of classes).</dd><dd class="dd pd ddexpand">Default: 'regression' if the response variable is numeric, 'classification' otherwise</dd><dt class="dt pt dlterm">NumTrees</dt><dd class="dd pd">[Optional] Specify the number of trees to grow in the forest model. When not specified, the function builds the minimum number of trees that provides the input data set with full coverage.</dd><dt class="dt pt dlterm">MinNodeSize</dt><dd class="dd pd">[Optional] Specify a decision tree stopping criterion; the minimum size of any node within each decision tree.</dd><dd class="dd pd ddexpand">Default: 1</dd><dt class="dt pt dlterm">Variance</dt><dd class="dd pd">[Optional] Specify a decision tree stopping criterion. If the variance within any node dips below this value, the algorithm stops looking for splits in the branch.</dd><dd class="dd pd ddexpand">Default: 0</dd><dt class="dt pt dlterm">MaxDepth</dt><dd class="dd pd">[Optional] Specify a decision tree stopping criterion. If the tree reaches a depth past this value, the algorithm stops looking for splits. Decision trees can grow to (2<span><sup>(<var class="keyword varname">max_depth</var>+1)</sup></span> - 1) nodes. This stopping criteria has the greatest effect on the performance of the function.</dd><dd class="dd pd ddexpand">Default: 12</dd><dt class="dt pt dlterm">CategoricalEncoding</dt><dd class="dd pd">[Optional with CategoricalColumns, disallowed otherwise.] Specify the encoding scheme to use for categorical variables.
<div class="tablenoborder"><table cellpadding="4" cellspacing="0" summary="" id="oog1572294158968__table_N1016D_N10169_N10162_N10018_N10014_N10010_N10001" class="table" frame="border" border="1" rules="all"><div class="caption"></div><colgroup span="1"><col style="width:50%" span="1"></col><col style="width:50%" span="1"></col></colgroup><thead class="thead" style="text-align:left;"><tr class="row"><th class="entry cellrowborder" style="vertical-align:top;" id="d23255e282" rowspan="1" colspan="1">Option</th><th class="entry cellrowborder" style="vertical-align:top;" id="d23255e284" rowspan="1" colspan="1">Description</th></tr></thead><tbody class="tbody"><tr class="row"><td class="entry cellrowborder" style="vertical-align:top;" headers="d23255e282" rowspan="1" colspan="1">Target</td><td class="entry cellrowborder" style="vertical-align:top;" headers="d23255e284" rowspan="1" colspan="1">Uses target encoding described in <a class="xref" href="https://contrib.scikit-learn.org/categorical-encoding/targetencoder.html" target="_blank" title="" shape="rect">https://contrib.scikit-learn.org/categorical-encoding/targetencoder.html</a>.
<p class="p">Supports regression and binary classification.</p></td></tr><tr class="row"><td class="entry cellrowborder" style="vertical-align:top;" headers="d23255e282" rowspan="1" colspan="1">GrayCode</td><td class="entry cellrowborder" style="vertical-align:top;" headers="d23255e284" rowspan="1" colspan="1">Recommended when accuracy is critical. Depending on available memory, out-of-memory errors can occur if a categorical column has more than about 20 unique levels, even with a small data set.</td></tr><tr class="row"><td class="entry cellrowborder" style="vertical-align:top;" headers="d23255e282" rowspan="1" colspan="1">Hashing</td><td class="entry cellrowborder" style="vertical-align:top;" headers="d23255e284" rowspan="1" colspan="1">Optimizes calculation speed and minimizes memory use, possibly decreasing accuracy.</td></tr></tbody></table></div></dd><dd class="dd pd ddexpand">Default: GrayCode</dd><dt class="dt pt dlterm">MinSamplesForEncoding</dt><dd class="dd pd">[Optional with CategoricalEncoding ('Target'), disallowed otherwise.] Specify minimum number of samples for target encoding, which is <var class="keyword varname">k</var> in the following formula:</dd><dd class="dd pd ddexpand">Ɣ (<var class="keyword varname">n</var>) = 1 / (1 + <var class="keyword varname">e</var><span><sup>-( (<var class="keyword varname">n</var> - <var class="keyword varname">k</var>)/<var class="keyword varname">f</var>)</sup></span>)</dd><dd class="dd pd ddexpand">The Target encoding algorithm uses the hyperparameter Ɣ.</dd><dd class="dd pd ddexpand">MinSamplesForEncoding is the same as the min_samples_leaf parameter in <a class="xref" href="https://contrib.scikit-learn.org/categorical-encoding/targetencoder.html" target="_blank" title="" shape="rect">https://contrib.scikit-learn.org/categorical-encoding/targetencoder.html</a>.</dd><dd class="dd pd ddexpand">Default: 1.0</dd><dt class="dt pt dlterm">Smoothing</dt><dd class="dd pd">[Optional with CategoricalEncoding ('Target'), disallowed otherwise.] Specify smoothing parameter for target encoding, which is <var class="keyword varname">f</var> in the following formula:</dd><dd class="dd pd ddexpand">Ɣ (<var class="keyword varname">n</var>) = 1 / (1 + <var class="keyword varname">e</var><span><sup>-( (<var class="keyword varname">n</var> - <var class="keyword varname">k</var>)/<var class="keyword varname">f</var>)</sup></span>)</dd><dd class="dd pd ddexpand">The Target encoding algorithm uses the hyperparameter Ɣ.</dd><dd class="dd pd ddexpand">Smoothing is the same as the smoothing parameter in <a class="xref" href="https://contrib.scikit-learn.org/categorical-encoding/targetencoder.html" target="_blank" title="" shape="rect">https://contrib.scikit-learn.org/categorical-encoding/targetencoder.html</a>.</dd><dd class="dd pd ddexpand">Default: 1.0</dd><dt class="dt pt dlterm">ErrorHandler</dt><dd class="dd pd">[Optional] Specify whether the function stops on error or continues with the next model:
<div class="tablenoborder"><table cellpadding="4" cellspacing="0" summary="" id="oog1572294158968__table_N1016B_N10168_N10163_N10018_N10014_N10010_N10001" class="table" frame="border" border="1" rules="all"><div class="caption"></div><colgroup span="1"><col style="width:50%" span="1"></col><col style="width:50%" span="1"></col></colgroup><thead class="thead" style="text-align:left;"><tr class="row"><th class="entry cellrowborder" style="vertical-align:top;" id="d23255e396" rowspan="1" colspan="1">Value</th><th class="entry cellrowborder" style="vertical-align:top;" id="d23255e398" rowspan="1" colspan="1">Function Behavior</th></tr></thead><tbody class="tbody"><tr class="row"><td class="entry cellrowborder" style="vertical-align:top;" headers="d23255e396" rowspan="1" colspan="1">'true'</td><td class="entry cellrowborder" style="vertical-align:top;" headers="d23255e398" rowspan="1" colspan="1">Function stops and reports error.</td></tr><tr class="row"><td class="entry cellrowborder" style="vertical-align:top;" headers="d23255e396" rowspan="1" colspan="1">'false'</td><td class="entry cellrowborder" style="vertical-align:top;" headers="d23255e398" rowspan="1" colspan="1">Function skips partition where error occurs and continues with next partition. Output table displays error message.</td></tr></tbody></table></div></dd><dd class="dd pd ddexpand">Default: 'false'</dd><dt class="dt pt dlterm">Mtry</dt><dd class="dd pd">[Optional] Specify the number of variables to randomly sample from each input value. For example, if <var class="keyword varname">mtry</var> is 3, then the function randomly samples 3 variables from each input at each split. The <var class="keyword varname">mtry</var> must be an INTEGER.</dd><dd class="dd pd ddexpand">Default behavior: The function randomly samples all predictors.<div class="note tip" id="oog1572294158968__note_N1012B_N10118_N10111_N10018_N10014_N10010_N10001"><span><b>Tip</b></span><div class="notebody"><div class="p">Calculate the initial value for <var class="keyword varname">mtry</var>, where <var class="keyword varname">p</var> is number of variables used for prediction, as follows:
<div class="tablenoborder"><table cellpadding="4" cellspacing="0" summary="" id="oog1572294158968__table_km2_2pz_fdb" class="table" frame="border" border="1" rules="all"><div class="caption"></div><colgroup span="1"><col style="width:25%" span="1"></col><col style="width:75%" span="1"></col></colgroup><thead class="thead" style="text-align:left;"><tr class="row"><th class="entry cellrowborder" style="vertical-align:top;" id="d23255e441" rowspan="1" colspan="1">Tree Type</th><th class="entry cellrowborder" style="vertical-align:top;" id="d23255e443" rowspan="1" colspan="1"><var class="keyword varname">mtry</var> Initial Value</th></tr></thead><tbody class="tbody"><tr class="row"><td class="entry cellrowborder" style="vertical-align:top;" headers="d23255e441" rowspan="1" colspan="1">Classification</td><td class="entry cellrowborder" style="vertical-align:top;" headers="d23255e443" rowspan="1" colspan="1"><code class="ph codeph">round(sqrt(<var class="keyword varname">p</var>))</code></td></tr><tr class="row"><td class="entry cellrowborder" style="vertical-align:top;" headers="d23255e441" rowspan="1" colspan="1">Regression</td><td class="entry cellrowborder" style="vertical-align:top;" headers="d23255e443" rowspan="1" colspan="1"><code class="ph codeph">round(<var class="keyword varname">p</var>/3)</code></td></tr></tbody></table></div></div></div></div></dd><dt class="dt pt dlterm">MtrySeed</dt><dd class="dd pd">[Optional] Specify a LONG value to use in determining the random seed for <var class="keyword varname">mtry</var>.</dd><dt class="dt pt dlterm">DisplayNumProcessedRows</dt><dd class="dd pd">[Optional] Specify whether to output the number of input rows allocated to each worker and the number of input rows processed by each worker (excluding rows skipped because they contained NULL values).</dd><dd class="dd pd ddexpand">Default: 'false'</dd><dt class="dt pt dlterm">Seed</dt><dd class="dd pd">[Optional] Specify the random seed the algorithm uses for repeatable results. The <var class="keyword varname">seed</var> must be a LONG value.<div class="note note" id="oog1572294158968__note_N1020F_N10206_N101FF_N10018_N10014_N10010_N10001"><span><b>Note</b></span><div class="notebody"> For repeatable results, use both the Seed and UniqueID syntax elements. For more information, see <a href="qym1549987102806.md">Nondeterministic Results and UniqueID Syntax Element</a>.</div></div></dd></dl></div></div></div></div>