# opal-case-study
This folder contains all resources of the Opal case study which provides an example data-aware service choreography from the eScience domain using TraDE-based cross-partner data objects, data flow and data transformations.
Information how to run the case study are provided [here](jmeter/README.md).

## Prerequisites/Requirements
* Docker and Docker Compose, details can be found [here](docker/README.md)
* Apache JMeter, details can be found [here](docker/README.md)

In the following the content of each subfolder is shortly described.

## /choreographyModel
This folder contains all resources related to the Opal data-aware choreography model.

## /docker
Resources to setup the TraDE environment using Docker Compose.

## /dt-bundles
This folder contains all resources related to the DT Bundles referenced within the Opal choreography model which provide the underlying transformation implementations to execute the modeled data transformations.

## /inputData
This folder contains required input data of the Opal simulation, i.e., a lattice (opalbcc.dat) and energy configuration data (econf.dat).

## /jmeter
This folder contains an Apache JMeter test plan that allows to prepare and run the Opal simulation in an automated manner.

## /processModels
This folder contains all resources related to the manually refined Opal participant process models generated from the initial Opal data-aware choreography model used to conduct the overall Opal simulation.