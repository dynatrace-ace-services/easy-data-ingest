# Topology model

In this lab we will define 2 new entities - the metrics will be attached automatically to these entities : 
  - **Truck**     with entityid = `logistics:truck`
  - **Container** with entityid = `logistics:container`
 And we wil create a relationship between the truck metrics and the container ship metrics. 

![image](https://user-images.githubusercontent.com/40337213/120231658-1f1c7e80-c252-11eb-9599-a4f3efe1d06f.png)

## Create entity Truck
Go to `Settings > Topology model > Generic types`
We will create the entity based on `{trucknr}` dimension : `truck.`fuel.usage,`trucknr`=99,model=mac-granite 17  
The entity will be automatically discoverd every time the dataingest starts with the name `truck.`fuel.usage  

- Add Type Definition
![image](https://user-images.githubusercontent.com/40337213/121259364-4efdfe80-c8b0-11eb-9914-2caf15baea7b.png)

- Add Extraction Rule
![image](https://user-images.githubusercontent.com/40337213/121262281-26780380-c8b4-11eb-9edd-8cc01681b205.png)

- Add Source
![image](https://user-images.githubusercontent.com/40337213/120184182-faec7d80-c210-11eb-80ac-d24b1235ee35.png)

- Save Changes
![image](https://user-images.githubusercontent.com/40337213/121260853-2c6ce500-c8b2-11eb-8859-fd6b4323b5de.png)

- Result
Afer a few minutes, the **CUSTOM_DEVICE** attached to the metric appears in this view with the entity = logistics.truck
![image](https://user-images.githubusercontent.com/40337213/121261358-ee23f580-c8b2-11eb-8c82-76c71d186415.png)


## Create entity Container

- Repeat for Container metrics with this definition : 
    create entity = `logistics:container`  
    dimension for the extraction rules = `containernr`  
    source ingest for the mapping  = satrt with `container.`temperature,containernr=234321,trucknr=99 40
    
- Specify its extraction rules `containernr`,  
![image](https://user-images.githubusercontent.com/40337213/121263992-bf0f8300-c8b6-11eb-9efb-027360704b55.png)
  
- and specify extraction rules for its attribute `trucknr`.  
![image](https://user-images.githubusercontent.com/40337213/120230235-2db56680-c24f-11eb-82c5-d01fb2b1d9f1.png)


## Generic relationships 

Settings > Topology model > Generic relationships.
- In this section we are going to create the **relationships** between the truck and the carried container according to the dynatrace documentation : https://www.dynatrace.com/support/help/shortlink/custom-topology#define-entity-relationships
![image](https://user-images.githubusercontent.com/40337213/120231485-c947d680-c251-11eb-9a88-2339217ba342.png)

- Add source
![image](https://user-images.githubusercontent.com/40337213/120231371-8ede3980-c251-11eb-8a14-6f8c9943e2cf.png)

- Create relationship 
![image](https://user-images.githubusercontent.com/40337213/120231423-addccb80-c251-11eb-907f-bb02b2c445fe.png)


## Management Zone

 - For `Container 111111`

       type("logistics:container"),entityName.equals("111111")
       
  ![image](https://user-images.githubusercontent.com/40337213/120365801-2eadcd00-c30f-11eb-91e6-0f6cdc6bdeb1.png)

 - For `Container 234321`

       type("logistics:container"),entityName.equals("234321")

  ![image](https://user-images.githubusercontent.com/40337213/120365965-5b61e480-c30f-11eb-8dcd-26e18d1ebcb7.png)


## Tags
You can also create an auto tag : 

 - For `Container 111111`

       type("logistics:container"),entityName.equals("111111")
  ![image](https://user-images.githubusercontent.com/40337213/120369070-1770de80-c313-11eb-9690-e4d1e9d5c06e.png)


## Go further with the API

 - API **GET entityTypes** for `logistics:truck` 
  
       https://<MyTenant>/api/v2/entityTypes/logistics:truck?Api-Token=<MyToken>
    
    ![image](https://user-images.githubusercontent.com/40337213/120362467-661a7a80-c30b-11eb-9586-e17d8c07304d.png)
   
 - API **GET entities** for `logistics:container`
 
       https://<MyTenant>/api/v2/entities?pageSize=12000&entitySelector=type(logistics:container)&Api-Token=<MyToken>

     ![image](https://user-images.githubusercontent.com/40337213/120364835-fd80cd00-c30d-11eb-8774-90d23add416b.png)

Do the same for entityId= `logistics:container`

