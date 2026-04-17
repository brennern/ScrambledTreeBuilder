# Core Data Objects and Their Relationships

This document provides an overview of the key data objects used in the project, their relationships, and how they interact with various functions.

## YAML Inputs

The data model begins with YAML inputs that define the structure of the data. These inputs are essential for configuring different aspects of the application. Each YAML file should include the following:

- **InputType**: Type of the input data (e.g., configuration, experimental data).
- **Metadata**: Information about the datasets (e.g., date of collection, source).
- **Parameters**: Specific parameters needed for data processing.

## Core Data Objects

1. **Distance Matrix**:
   - Represents the pairwise distances between data points calculated from the input data.
   - Structure:
     - **Rows**: Identifiers for each data point.
     - **Columns**: Distance metrics between points.

2. **Tree Objects**:
   - Used to represent hierarchical relationships between data points after clustering.
   - Key properties include:
     - **Nodes**: Represent data points or clusters.
     - **Edges**: Represent the connections between nodes.

## Functions

### `formatStats`

The `formatStats` function provides a standardized output format for statistical summaries. The flow of this function can be summarized as follows:

1. **Input**: Takes in raw statistics data.
2. **Processing**: Performs calculations to format the data into a human-readable form.
3. **Output**: Returns formatted statistics.

## Relationship Between Objects

- The Distance Matrix is used to create Tree Objects through various clustering algorithms. 
- The output of `formatStats` can be derived from the properties of both Distance Matrices and Tree Objects, allowing for comprehensive insights into the models being constructed.