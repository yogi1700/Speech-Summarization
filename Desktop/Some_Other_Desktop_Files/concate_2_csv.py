

import pandas as pd
a = pd.read_csv("file.csv");
a = pd.read_csv("b.csv"); 
c = pd.concat([a, b], join='outer')
c.to_csv("c.csv", index=False)

