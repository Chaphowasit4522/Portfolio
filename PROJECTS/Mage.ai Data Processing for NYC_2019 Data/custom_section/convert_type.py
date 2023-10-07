import pandas as pd
import datetime
@custom
def transform_custom(data, data_2, *args, **kwargs):
    data['last_review'] = pd.to_datetime(data['last_review'], unit='ns')
    return data