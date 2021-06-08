# Data Ingest

In this lab you will manually ingest data directly with Dynatrace Saas  or Dynatrace Managed as entry point, or with active gate as entry point and finally directly from the OneAgent without Token.                  

## Entry point = Dynatrace Saas or Managed
- Export the variables

      export MyTenant=<MyTenant>
      export MyToken=<MyToken>
      export URL_DT=https://$MyTenant/api/v2/metrics/ingest
      export Header="Content-Type: text/plain; charset=utf-8"
      export Metric="demo1.truck.fuel.total,trucknr=01,model=mac-dump 10534"

- Verify the variables 

      echo "MyTenant=https://"$MyTenant;echo "MyToken="$MyToken;echo "URL_DT="$URL_DT;echo "Header="$Header;echo "Metric="$Metric 

- Run the data ingest

      curl -H "Authorization: Api-Token "$MyToken"" -X POST -H "$Header" --data-ascii "$Metric" "$URL_DT"
      
- Result
      ![image](https://user-images.githubusercontent.com/40337213/121240421-9a0d1700-c89a-11eb-9dba-d671f3c36cbe.png)

The metric is collected in Dynatrace but is not attached to the topology model. 


## Entry point = ActiveGate 
- Export the variables

      export MyToken=<MyToken>
      export Host_AG=<Host_AG>
      export TenantId=<TenantId>  
      export URL_AG=https://$Host_AG:9999/e/$TenantId/api/v2/metrics/ingest
      export Header="Content-Type: text/plain; charset=utf-8"
      export Metric="demo2.truck.fuel.total,trucknr=02,model=mac-conrock 10435"

   For Saas **TenantId** is `1234`.live.dynatrace.com - for Managed **TenantId** is xyz.dynatrace-managed.com/e/`0123456789-abcd-987654321`

- Verify the variables 

      echo "Host_AG=https://"$Host_AG;echo "MyToken="$MyToken;echo "URL_AG="$URL_AG;echo "Header="$Header;echo "Metric="$Metric 


- Run the data ingest

      curl -H "Authorization: Api-Token "$MyToken"" -X POST -H "$Header" --data-ascii "$Metric" "$URL_AG" --insecure

- Result

It's exatly the same type of result as the previous exercice.  

## Entry point = OneAgent
- Prerequisite
  Go to `Settings > Monitoring > Monitored technologies` => In the list of supported technologies, search for the Dynatrace OneAgent StatsD, Pipe, HTTP Metric API entry.  
  The metric is automatically linked to this host 

- Export the variables

      export URL_OA=http://localhost:14499/metrics/ingest
      export Header="Content-Type: text/plain; charset=utf-8"
      export Metric="demo3.truck.fuel.total,trucknr=03,model=mac-lrvsw 10635"

- Run the data ingest

      curl -X POST  -H "$Header" --data-ascii "$Metric" "$URL_OA"

- Result

In this case the metric is attached to the HostId where the OneAgent is installed.   


# Attached the metric to an entity

In case the metric is not attached to an entity (ingested from an ActiveGate of from  Dynatrace cluster), you can :   
      - attach the metric `manually`to an know **entity**  
      - or use the **topology model** to create `automatically`the data model with new Custom_Device.  

## Attached `manually` to an entity

You can add the entity as dimension of the metric during the data ingest treatment => "dmo4.truck.fuel.total,`dt.entity.host=HOST-XXXXXXX`,trucknr=04 12034"  
We can do these exercice with an hostid an after a custom_device :  

- **hostid**
            
      export Metric="dmo4.truck.fuel.total,dt.entity.host=HOST-XXXXXXX,trucknr=04,model=mac-titan 12034"

to obtain the value of the HOST-XXXX, click on the Host on Dynatarce and find the HOST-XXXXX directly in the URL parameters:  
![image](https://user-images.githubusercontent.com/40337213/120121394-7ca5c200-c1a3-11eb-80c2-e081ae6cbde5.png)
Run the data ingest for a host : 

      curl -H "Authorization: Api-Token "$Api-Token"" -X POST -H "$Header" --data-ascii "$Metric" "$URL_DT"

- **custom_device**

   Create manually your own custom device and attach the metric to it : 

      export Metric="demo5.truck.fuel.total,dt.entity.custom_device=CUSTOM_DEVICE-XXXXXXXX,trucknr=05,model=mac-anthem 9432"
  to create a custom devive, open 3technologie" and clic on "Custom Device" + [...] + New Custom Device
![image](https://user-images.githubusercontent.com/40337213/120234328-06af6280-c258-11eb-9b8e-cb21c0e6bcea.png)

      curl -H "Authorization: Api-Token "$Api-Token"" -X POST -H "$Header" --data-ascii "$Metric" "$URL_DT"

There are many entityid you can use like that for exemple : 

- **entity list** 

      dt.entity.host 
      dt.entity.process_group_instance
      dt.entity.process_group
      dt.entity.service
      dt.entity.application
      dt.entity.custom_device
      dt.entity.custom_device_group
      dt.entity.aws_load_balancer


## Create `automatically` the topology model

To start this exercise, we will generate a data stream with a shell script :   

# Run the script to generate continue data ingest

- Export your variables

      export MyToken=<MyToken>
      export MyTenant=<MyTenant>
      export Prefix=demo6

- Run the script

      cd ~
      git clone https://github.com/JLLormeau/easy-data-ingest
      cd easy-data-ingest
      chmod +x data-ingest-easy-shipping-ltd.sh
      ./data-ingest-easy-shipping-ltd.sh &


- Result for the Truck data ingest 
![image](https://user-images.githubusercontent.com/40337213/121258136-d480af00-c8ae-11eb-9f3e-18c59b0ccfca.png)

- Result for the Container Ship ingest 
![image](https://user-images.githubusercontent.com/40337213/121258573-5d97e600-c8af-11eb-814b-49569e7d8844.png)

# Generate the toplogy model
Now we have to create the data model, we will do that with the `topology model` configuration here : 
- [topology model](/topology-model)
