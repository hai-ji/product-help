<div class="nested0" aria-labelledby="ariaid-title1" topicindex="1" topicid="fzc1506627602124" id="fzc1506627602124"><h1 class="title topictitle1" id="ariaid-title1">ShapeletSupervisedClassifier (ML Engine)</h1><div class="body conbody">
<p class="p">The ShapeletSupervisedClassifier function uses the model output by the function <a href="uya1550499792953.md#awl1506626097450">ShapeletSupervised (ML Engine)</a> to classify a set of time series.</p></div><div class="topic reference nested1" aria-labelledby="ariaid-title2" topicindex="2" topicid="oqj1506627681696" xml:lang="en-us" lang="en-us" id="oqj1506627681696">
<h2 class="title topictitle2" id="ariaid-title2">ShapeletSupervisedClassifier Syntax</h2><div class="body refbody"><div class="section" id="oqj1506627681696__section_N1000E_N1000C_N10001">
<h3 class="title sectiontitle">Version <span>1.9</span></h3><pre class="pre codeblock" xml:space="preserve"><code>SELECT * FROM ShapeletSupervisedClassifier (
  <span>ON { <var class="keyword varname">table</var> | <var class="keyword varname">view</var> | (<var class="keyword varname">query</var>) }</span> AS InputTable PARTITION BY <var class="keyword varname">id</var> ORDER BY <var class="keyword varname">time_instant</var> 
  <span>ON { <var class="keyword varname">table</var> | <var class="keyword varname">view</var> | (<var class="keyword varname">query</var>) }</span> AS Model DIMENSION ORDER BY shapelet_id, time_instant
  [ USING
    [ TargetColumn ('<var class="keyword varname">value_column</var>') ]
    [ TimeInterval (<var class="keyword varname">num_data_points</var>) ]
    <code class="ph codeph">[ Accumulate ({ '<var class="keyword varname">accumulate_column</var>' | <var class="keyword varname">accumulate_column_range</var> }[,...]) ]</code>
  ]
) AS <var class="keyword varname">alias</var>;</code></pre></div></div><div class="related-links"><div class="linklistheader"><p></p><b>Related Information</b></div>
<ul class="linklist linklist relinfo"><div class="linklistmember"><a href="ndv1557782188375.md">Column Specification Syntax Elements</a></div></ul></div></div><div class="topic reference nested1" aria-labelledby="ariaid-title3" topicindex="3" topicid="vqn1506627751855" xml:lang="en-us" lang="en-us" id="vqn1506627751855">
<h2 class="title topictitle2" id="ariaid-title3">ShapeletSupervisedClassifier Syntax Elements</h2><div class="body refbody"><div class="section" id="vqn1506627751855__section_N10011_N1000E_N10001"><dl class="dl parml"><dt class="dt pt dlterm">TargetColumn</dt><dd class="dd pd">[Optional] Specify the name of the InputTable column that contains the data points in the time series.</dd><dd class="dd pd ddexpand">Default: "value"</dd><dt class="dt pt dlterm">TimeInterval</dt><dd class="dd pd">[Optional] Specify the number of data points in a time series to skip between consecutive time series windows when calculating the distance of a shapelet from a time series.</dd><dd class="dd pd ddexpand">Because a shapelet is typically much smaller than a complete time series, the function calculates the distance of a shapelet from a time series by sliding the shapelet across time series windows of shapelet length, calculating the distance between the shapelet and each window, and then selecting the smallest distance.</dd><dd class="dd pd ddexpand">The <var class="keyword varname">num_data_points</var> is the number of data points to skip when sliding from one time series window to the next. The <var class="keyword varname">num_data_points</var> must be an INTEGER in the range [1, 1000000]. The value 1 gives optimal results at the cost of higher execution time.</dd><dd class="dd pd ddexpand">This syntax element must specify the same value as the ShapeletSupervised TimeInterval syntax element specified when it created the shapelets table.</dd><dd class="dd pd ddexpand">Default: 10</dd><dt class="dt pt dlterm">Accumulate</dt><dd class="dd pd">[Optional] Specify the names of the InputTable columns to copy to the output table. Columns specified by this syntax element appear after the other output table columns.</dd><dd class="dd pd ddexpand">Default: id and predicted_category</dd></dl></div></div></div></div>