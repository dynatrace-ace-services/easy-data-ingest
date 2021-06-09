# Topology model

In this lab we will define 2 new entities - the metrics will be attached automatically to these entities : 
  - **Truck**     with entityid = `logistics:truck`
  - **Container** with entityid = `logistics:container`
 And we wil create a relationship between the truck metrics and the container ship metrics. 

![image](https://user-images.githubusercontent.com/40337213/120231658-1f1c7e80-c252-11eb-9599-a4f3efe1d06f.png)

## Create entity Truck
Go to `Settings > Topology model > Generic types`
We will create the entity based on `{trucknr}`  
  => dimension : `truck.`fuel.usage,`trucknr`=99,model=mac-granite 17  
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

- Result

![image](https://user-images.githubusercontent.com/40337213/121264245-2b8a8200-c8b7-11eb-8bee-4894b503b751.png)


## Generic relationships 

To complete the topology definition, define a relationship between the truck and the carried container. Without this relationship, the truck- and container-related measurements will be reported separately by Dynatrace with no topological relationship 

Settings > Topology model > Generic relationships.
- In this section we are going to create the **relationships** between the truck and the carried container according to the dynatrace documentation : https://www.dynatrace.com/support/help/shortlink/custom-topology#define-entity-relationships
![image](https://user-images.githubusercontent.com/40337213/120231485-c947d680-c251-11eb-9a88-2339217ba342.png)

- Add source
![image](https://user-images.githubusercontent.com/40337213/121267539-a2764980-c8bc-11eb-985b-5acac8a182b0.png)

- Create relationship 
![image](https://user-images.githubusercontent.com/40337213/121267074-e87edd80-c8bb-11eb-981e-a607cfe20fe8.png)

- Add source of the relationship 
![image](https://user-images.githubusercontent.com/40337213/121268109-92129e80-c8bd-11eb-971b-83ea982181af.png)

- Result with the API **GET entities** for `logistics:truck`
 
      https://<MyTenant>/api/v2/entities?pageSize=12000&entitySelector=type(logistics:truck)&Api-Token=<MyToken>

    ![image](https://user-images.githubusercontent.com/40337213/121268163-b40c2100-c8bd-11eb-9207-3b040947a0b2.png)

- Result and with the API **GET entityTypes** for `logistics:truck` 
  
      https://<MyTenant>/api/v2/entityTypes/logistics:truck?Api-Token=<MyToken>
    
    ![image](https://user-images.githubusercontent.com/40337213/121267864-24ff0900-c8bd-11eb-891c-44d52c062276.png) 

## Management Zone

Now we can create the Management Zone rules to filter on boh truck 12 and 99 :  

 - Create the Management Zone for the `truck:12`
With the rule to collecte the metrics type 'container.`
![image](https://user-images.githubusercontent.com/40337213/121264681-d69b3b80-c8b7-11eb-9f58-f2540257633f.png

And with the rule to collecte the metrics type 'truck.`
![image](https://user-images.githubusercontent.com/40337213/121264855-211cb800-c8b8-11eb-9695-0fca62a149e0.png)

And add the entity selector role `type(logistics:container),truck("12")`
![image](https://user-images.githubusercontent.com/40337213/121265364-fb43e300-c8b8-11eb-8835-c36f2b7326fd.png)

- Do the same for the `truck:99`
Entity selector rule : `type("logistics:container"),truck("99")`
![image](https://user-images.githubusercontent.com/40337213/121265737-8fae4580-c8b9-11eb-937a-f2b3be93625d.png)

- Result 
You can use the management zone on the metrics (`fuel.` and `container.`) to filter on the truck : 
![image](https://user-images.githubusercontent.com/40337213/121266120-43173a00-c8ba-11eb-8e23-e8df734e43df.png)

## Tags
You can also create an auto tag. More details on the entity selector [here](https://www.dynatrace.com/support/help/dynatrace-api/environment-api/entity-v2/entity-selector/). 

 - For `Container 111111`

       type("logistics:container"),entityName.equals("111111")
  ![image](https://user-images.githubusercontent.com/40337213/120369070-1770de80-c313-11eb-9690-e4d1e9d5c06e.png)

## Data Explorer
Go to the [Data Explorer](/data-explorer) to create your chart. 

# Next Step

- Create your chart 
with the [Data Explorer](/data-explorer)

- Go further with data ingest and topology model 
Integrate all type of metrics in your Dynatrace topology model. 

Telegraph: https://www.dynatrace.com/support/help/how-to-use-dynatrace/metrics/metric-ingestion/ingestion-methods/telegraf/  
StatsD: https://www.dynatrace.com/support/help/how-to-use-dynatrace/metrics/metric-ingestion/ingestion-methods/statsd/  
OpenTelemetry: https://www.dynatrace.com/support/help/how-to-use-dynatrace/metrics/metric-ingestion/ingestion-methods/opentelemetry/  
