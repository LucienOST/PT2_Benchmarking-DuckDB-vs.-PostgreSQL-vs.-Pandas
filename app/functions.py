import psutil
import numpy as np
import pandas as pd

def monitor_usage():
    """Measures the CPU and RAM usage"""
    cpu_percent = psutil.cpu_percent(interval=1)
    mem_info = psutil.virtual_memory()

    print(f"CPU Usage: {cpu_percent}%")
    print(f"Memory Usage: {mem_info.percent}%")

def udf_disc_price(extended, discount):
	return np.multiply(extended, np.subtract(1, discount))

def udf_charge(extended, discount, tax):
	return np.multiply(extended, np.multiply(np.subtract(1, discount), np.add(1, tax)))

def query1(lineitem):
	df = lineitem[["l_shipdate", "l_returnflag", "l_linestatus", "l_quantity", "l_extendedprice", "l_discount", "l_tax"]][(lineitem['l_shipdate'] <= '1998-09-01')]
	df['disc_price'] = udf_disc_price(df['l_extendedprice'], df['l_discount'])
	df['charge']     = udf_charge(df['l_extendedprice'], df['l_discount'], df['l_tax'])
	return df.groupby(['l_returnflag', 'l_linestatus'])\
	  		 .agg({'l_quantity': 'sum', 'l_extendedprice': 'sum', 'disc_price': 'sum', 'charge': 'sum',
					 'l_quantity': 'mean', 'l_extendedprice': 'mean', 'l_discount': 'mean', 'l_shipdate': 'count'})