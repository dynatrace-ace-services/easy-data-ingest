# Easy Shipping LTD

Suppose we have a company, Easy Shipping LTD, that provides transport services. Easy Shipping LTD operates smart containers mounted on trucks that carry the containers from loading dock to loading dock.

## Truck telemetry data
Each truck continuously sends basic telemetry data, such as fuel consumption, operation hours, and error logs.

    truck.fuel.total,trucknr=99,model=mac-granite 10234
    truck.fuel.usage,trucknr=99,model=mac-granite 17
    truck.operation.hours,trucknr=99,model=mac-granite 23766
    truck.fuel.total,trucknr=12,model=mac-anthem 234
    truck.fuel.usage,trucknr=12,model=mac-anthem 10
    truck.operation.hours,trucknr=12,model=mac-anthem 13766

## Container telemetry data
Each smart container is able to report the truck number to which it's currently mounted and its container temperature.

    container.temperature,containernr=234321,trucknr=99 40
    container.temperature.dev,containernr=234321,trucknr=99 0
    container.temperature,containernr=111111,trucknr=12 39
    container.temperature.dev,containernr=111111,trucknr=12 2,5

# Next Step
- [Data Ingest](/data-ingest) : collect the metrics 
