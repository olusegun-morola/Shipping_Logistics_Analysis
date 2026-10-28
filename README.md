![Shipping and Logistics Dashboard](Shipping%20and%20Logistics%20Dashboard.png)
# Shipping & Logistics Performance Analysis

## Project Overview

This project analyzes e-commerce shipping data to understand shipment status distribution, monthly shipment volume, shipping partner activity, and returned shipments.

Using **MySQL** for data exploration and **Power BI** for visualization, the project provides an operational overview to help management identify shipment patterns and areas that may require further investigation.

## Business Questions

The analysis focuses on four management questions:

1. What is the distribution of shipment statuses?
2. How does shipment volume change over time?
3. How does shipment status vary across shipping partners?
4. Which shipping partners have the highest proportion of returned shipments?

## Tools Used

- **MySQL:** Data exploration, validation, aggregation, and analysis.
- **Power BI:** Interactive dashboard development and data visualization.

## Dataset

The project uses two CSV files:

- `orders.csv` — 800 order records.
- `shipments.csv` — 800 shipment records.

The data was imported into MySQL and analyzed using the order and shipment identifiers to connect related records.

## Key Findings

### 1. Shipment Status Distribution

| Status | Shipments | Percentage |
|---|---:|---:|
| Pending | 329 | 41.1% |
| Shipped | 241 | 30.1% |
| Delivered | 153 | 19.1% |
| Returned | 77 | 9.6% |

Pending shipments represented the largest group, accounting for approximately 41.1% of all shipment records.

### 2. Monthly Shipment Volume

Shipment volume fluctuated between January 2021 and December 2022.

- **Highest month:** January 2022, with 46 shipments.
- **Lowest months:** July 2021 and December 2022, with 25 shipments each.

### 3. Shipment Volume by Partner

| Shipping Partner | Shipments |
|---|---:|
| FedEx | 307 |
| UPS | 213 |
| DHL | 181 |
| USPS | 99 |

FedEx handled the highest number of shipments in the dataset.

### 4. Return Proportion by Partner

| Shipping Partner | Returned | Total Shipments | Return Proportion |
|---|---:|---:|---:|
| USPS | 14 | 99 | 14.1% |
| UPS | 23 | 213 | 10.8% |
| FedEx | 31 | 307 | 10.1% |
| DHL | 9 | 181 | 5.0% |

USPS had the highest observed return proportion, while DHL had the lowest. These figures describe the observed data and do not establish the reasons for returns or prove that a particular shipping partner caused them.

## Data Quality and Limitations

Data-quality checks confirmed that the shipments table contained 800 records, shipment IDs were populated and unique, and all shipment order IDs matched an order record.

However, **401 of the 800 matched records had shipment timestamps earlier than their corresponding order timestamps**. Processing-time analysis was therefore excluded to avoid drawing conclusions from unreliable timestamp relationships.

The available data also does not establish why shipments remain pending or why returns occur.

## Recommendations

- Investigate the large pending-shipment group and clarify what the pending status represents operationally.
- Monitor monthly shipment volumes to support workload planning.
- Review return patterns by shipping partner and investigate underlying return reasons.
- Validate order and shipment timestamps before conducting processing-time analysis.

## Project Files

- `Shipping_Logistics_Analysis.docx` — Project documentation.
- `shipping_logistics_analysis.sql` — SQL queries used in the analysis.
- `orders.csv` and `shipments.csv` — Original dataset files.
- `Shipping_Logistics_Performance_Analysis.pbix` — Power BI dashboard file.
- `Shipping and Logistics Dashboard.png` — Dashboard screenshot.

## Conclusion

This project demonstrates how MySQL and Power BI can be used to explore e-commerce logistics data, answer operational business questions, and communicate findings through an interactive dashboard. It also highlights the importance of data-quality validation and interpreting operational metrics within the limitations of the available data.
