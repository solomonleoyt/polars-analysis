# polars-analysis

the `create_tables.sql` file contains the SQL script to create a table and fill in dummy data of students upto 1 million rows

the `requirements.txt` file contains all the necessary libraries needs to be installed to work on Polars library from BigQuery data, you can install all of them using the command `pip install -r requirements.txt`

once you're done with installing all required libraries and creating data in BigQuery, you can upload the `polars-analysis.ipynb` notebook in Vertex AI and use the notebook to import, do calculations and export to BigQuery. 
