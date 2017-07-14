# initial-evaluation
This folder contains all resources of a conducted initial performance evaluation comparing TraDE-based cross-partner data data flow with the classical exchange of data through messages within service choreographies.

Therefore, the evaluation is grouped into two overall scenarios: **baseline** and **TraDE**. For both scenarios a choreography model with three interacting participants exchanging four data values was specified, transformed and refined into a set of three executable BPEL process models implementing the overall choreography.
While for the baseline scenarios the resulting process models implement the exchange of data by specifying corresponding message exchange logic, the process models for the TraDE scenarios are enriched with TraDE annotations enabling the exchange of data across the processes through the TraDE middleware transparently in the background.

In order to also identify the impact of the size of the data being exchanged across the processes, we further split each of the scenario groups into three subscenarios for the following data sizes per data value: 1KB, 128KB and 256KB. For each of the resulting six scenarios, ten experiment rounds are conducted. The overall goal of the evaluation is to identify the performance variation when introducing our TraDE middleware as data hub in service choreographies.

In the following the content of each subfolder is shortly described.

## /evaluationResources
This folder contains all resources related to the setup and execution of the evaluation, i.e., files for data values with the above mentioned sizes used to instantiate the choreography, the above introduced process models for all scenarios and the underlying [JMeter](http://jmeter.apache.org/) test plans used to setup the evaluation environment and conduct the actual evaluation workload.

## /evaluationResults
This folder contains the aggregated result data of all six scenarios as well as an overall summary of the evaluation results and two diagrams comparing the average response time for different load bursts and data sizes.

## /rawResultData
This folder contains the raw result data for all six scenarios as produced by the JMeter test plans.