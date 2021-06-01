# Topology Model

## Generic type
Settings > Topology model > Generic types.
- In this section we are going to create the 2 **Types definitons** according to the example in the dynatrace documentation : https://www.dynatrace.com/support/help/shortlink/custom-topology#define-new-entity-type
![image](https://user-images.githubusercontent.com/40337213/120231658-1f1c7e80-c252-11eb-9599-a4f3efe1d06f.png)


- Add Type Definition
![image](https://user-images.githubusercontent.com/40337213/120230806-60ac2a00-c250-11eb-83e3-4ba2d822c477.png)

- Add Extraction Rule
![image](https://user-images.githubusercontent.com/40337213/120184444-4737bd80-c211-11eb-9ae2-3f1155e6cb35.png)

- Add Source
![image](https://user-images.githubusercontent.com/40337213/120184182-faec7d80-c210-11eb-80ac-d24b1235ee35.png)

- Save Changes
![image](https://user-images.githubusercontent.com/40337213/120230877-833e4300-c250-11eb-8bc3-b8d212a2a158.png)

- Repeat for Container metrics
  Specify its extraction rules `containernr`,  
![image](https://user-images.githubusercontent.com/40337213/120230192-1aa29680-c24f-11eb-87f0-edbfa8cf1633.png)
  
  and specify extraction rules for its attributes `trucknr`.  
![image](https://user-images.githubusercontent.com/40337213/120230235-2db56680-c24f-11eb-82c5-d01fb2b1d9f1.png)


## Generic relationships 
Settings > Topology model > Generic relationships.
- In this section we are going to create the **relationships** between the truck and the carried container according to the dynatrace documentation : https://www.dynatrace.com/support/help/shortlink/custom-topology#define-entity-relationships
![image](https://user-images.githubusercontent.com/40337213/120231485-c947d680-c251-11eb-9a88-2339217ba342.png)

- Add source
![image](https://user-images.githubusercontent.com/40337213/120231371-8ede3980-c251-11eb-8a14-6f8c9943e2cf.png)

- Create relationship 
![image](https://user-images.githubusercontent.com/40337213/120231423-addccb80-c251-11eb-907f-bb02b2c445fe.png)



