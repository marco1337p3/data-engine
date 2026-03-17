import pandas as pd

df = pd.read_csv("beers.csv")

print("Shape:", df.shape)
print("Columns:", df.columns.tolist())
print(df.head())
print(df.describe())
print(df.isnull().sum())

strong_beers = df[df["abv"] > 0.08]
print ("Strong Beers", strong_beers.shape[0])
print(df.groupby("style")["abv"].mean().sort_values(ascending=False).head(5))
ipas = df[df["style"].str.contains("IPA")]
ipas.to_csv("ipas.csv", index=False)
print("Saved!", ipas.shape[0], "IPAs")