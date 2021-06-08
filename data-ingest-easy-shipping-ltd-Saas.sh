
#/bin/ksh

Prefix=""
URL_DT=https://$MyTenant/api/v2/metrics/ingest
Header="Content-Type: text/plain; charset=utf-8"

while true
 do

        date
        value=$(( ( RANDOM % 10 )  + 1 ))
        curl -H "Authorization: Api-Token "$MyToken"" -X POST  -H "$Header" --data-ascii "$Prefix""truck.fuel.total,trucknr=99,model=mac-granite $((100*$value))" "$URL_DT"
        curl -H "Authorization: Api-Token "$MyToken"" -X POST  -H "$Header" --data-ascii "$Prefix""truck.fuel.usage,trucknr=99,model=mac-granite $((2*$value))" "$URL_DT"
        curl -H "Authorization: Api-Token "$MyToken"" -X POST  -H "$Header" --data-ascii "$Prefix""truck.operation.hours,trucknr=99,model=mac-granite $((100*$value))" "$URL_DT"
        curl -H "Authorization: Api-Token "$MyToken"" -X POST  -H "$Header" --data-ascii "$Prefix""truck.fuel.total,trucknr=12,model=mac-anthem $((4*$value))" "$URL_DT"
        curl -H "Authorization: Api-Token "$MyToken"" -X POST  -H "$Header" --data-ascii "$Prefix""truck.fuel.usage,trucknr=12,model=mac-anthem $((8*$value))" "$URL_DT"
        curl -H "Authorization: Api-Token "$MyToken"" -X POST  -H "$Header" --data-ascii "$Prefix""truck.operation.hours,trucknr=12,model=mac-anthem $((5*$value))" "$URL_DT"
        curl -H "Authorization: Api-Token "$MyToken"" -X POST  -H "$Header" --data-ascii "$Prefix""container.temperature,containernr=234321,trucknr=99 $((4*$value))" "$URL_DT"
        curl -H "Authorization: Api-Token "$MyToken"" -X POST  -H "$Header" --data-ascii "$Prefix""container.temperature.dev,containernr=234321,trucknr=99 $((0,1*$value))" "$URL_DT"
        curl -H "Authorization: Api-Token "$MyToken"" -X POST  -H "$Header" --data-ascii "$Prefix""container.temperature,containernr=111111,trucknr=12 $((4*$value))" "$URL_DT"
        curl -H "Authorization: Api-Token "$MyToken"" -X POST  -H "$Header" --data-ascii "$Prefix""container.temperature.dev,containernr=111111,trucknr=12 $((1,5*$value))" "$URL_DT"

        sleep 60
  done
