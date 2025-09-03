import dlt
import pandas as pd
from pathlib import Path
import os

@dlt.resource(write_disposition="replace")
def load_csv_resource(file_path: str, **kwargs):
    df = pd.read_csv(file_path, **kwargs)
    yield df

if __name__ == "__main__":
    working_directory = Path(__file__).parent
    data_directory = working_directory.parent / "data"

    os.chdir(working_directory)
    csv_path = data_directory / "NetflixOriginals.csv"

    data = load_csv_resource(csv_path, encoding = "latin1")

    pipeline = dlt.pipeline(
        pipeline_name="netflix_movies",
        destination="snowflake",
        dataset_name="staging",
    )

    load_info = pipeline.run(data, table_name="netflix_originals")

    print(load_info)