<div class="nested0" aria-labelledby="ariaid-title1" topicindex="1" topicid="xaz1507155725845" id="xaz1507155725845"><h1 class="title topictitle1" id="ariaid-title1">GLMPredict_MLE (ML Engine)</h1><div class="body conbody">
<p class="p">The GLMPredict_MLE function uses the model output by the function <a href="eej1558472403086.md#hrv1507149150084">GLM (ML Engine)</a> to perform generalized linear model prediction on new input data.</p></div><div class="topic reference nested1" aria-labelledby="ariaid-title2" topicindex="2" topicid="cjs1507156720290" xml:lang="en-us" lang="en-us" id="cjs1507156720290">
<h2 class="title topictitle2" id="ariaid-title2">GLMPredict_MLE Syntax</h2><div class="body refbody"><div class="section" id="cjs1507156720290__section_N10087_N10022_N10001">
<h3 class="title sectiontitle">Version ?</h3><pre class="pre codeblock" xml:space="preserve"><code>SELECT * FROM GLMPredict_MLE (
  <span>ON { <var class="keyword varname">table</var> | <var class="keyword varname">view</var> | (<var class="keyword varname">query</var>) }</span> PARTITION BY ANY
  <span>ON { <var class="keyword varname">table</var> | <var class="keyword varname">view</var> | (<var class="keyword varname">query</var>) }</span> AS Model DIMENSION
  [ USING
    <code class="ph codeph">[ Accumulate ({ '<var class="keyword varname">accumulate_column</var>' | <var class="keyword varname">accumulate_column_range</var> }[,...]) ]</code>
    [ Family ('<var class="keyword varname">family</var>') ]
    [ LinkFunction ('<var class="keyword varname">link</var>') ]
    [ OutputProb (<span><b>{'true'|'t'|'yes'|'y'|'1'|'false'|'f'|'no'|'n'|'0'}</b></span>) ]
    [ Responses ('<var class="keyword varname">response</var>' [,...]) ]
  ]
) AS <var class="keyword varname">alias</var>;</code></pre></div></div><div class="related-links"><div class="linklistheader"><p></p><b>Related Information</b></div>
<ul class="linklist linklist"><div class="linklistmember"><a href="eta1543514041091.md">Comments in Queries</a></div><div class="linklistmember"><a href="ndv1557782188375.md">Column Specification Syntax Elements</a></div></ul></div></div><div class="topic reference nested1" aria-labelledby="ariaid-title3" topicindex="3" topicid="izf1507157274125" xml:lang="en-us" lang="en-us" id="izf1507157274125">
<h2 class="title topictitle2" id="ariaid-title3">GLMPredict_MLE Syntax Elements</h2><div class="body refbody"><div class="section" id="izf1507157274125__section_N10011_N1000E_N10001"><dl class="dl parml"><dt class="dt pt dlterm">Accumulate</dt><dd class="dd pd">[Optional] Specify the names of input table columns to copy to the output table.</dd><dt class="dt pt dlterm">Family</dt><dd class="dd pd">[Optional] Specify the distribution exponential family.</dd><dd class="dd pd ddexpand">If you specify this syntax element, you must give it the same value that you used for the Family syntax element of the function <a href="eej1558472403086.md#hrv1507149150084">GLM (ML Engine)</a> when you created the Model table.</dd><dd class="dd pd ddexpand">Default: Read from the Model table</dd><dt class="dt pt dlterm">LinkFunction</dt><dd class="dd pd">[Optional] Specify the link function. For the canonical link functions (default link functions) and the link functions allowed for each exponential family, see <a href="ewh1563913874279.md">Supported Family/Link Function Combinations</a>.</dd><dd class="dd pd ddexpand">If you specify this syntax element, you must give it the same value that you used for the LinkFunction syntax element of the function <a href="eej1558472403086.md#hrv1507149150084">GLM (ML Engine)</a> when you created the Model table.</dd><dd class="dd pd ddexpand">Default: 'CANONICAL'</dd><dt class="dt pt dlterm">OutputProb</dt><dd class="dd pd">[Family must be BINOMIAL or LOGISTIC. Required with Responses, optional otherwise.] Specify whether to output the probability for each <var class="keyword varname">response</var>. If you omit Responses, the function outputs the probability of the predicted response.</dd><dd class="dd pd ddexpand">Default: 'false'</dd><dt class="dt pt dlterm">Responses</dt><dd class="dd pd">[Optional] Specify the labels for which to output probabilities. A label (<var class="keyword varname">response</var>) must be 0 or 1.</dd><dd class="dd pd ddexpand">Default behavior: The function outputs only the probability of the predicted class.</dd></dl></div></div></div></div>