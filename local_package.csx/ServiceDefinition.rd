<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" name="AzureWebChatIO" generation="1" functional="0" release="0" Id="213e2b87-db44-4c5e-8da6-a18ff4459a2e" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureWebChatIOGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="WorkerRole1:HttpIn" protocol="tcp">
          <inToChannel>
            <lBChannelMoniker name="/AzureWebChatIO/AzureWebChatIOGroup/LB:WorkerRole1:HttpIn" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="WorkerRole1Instances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureWebChatIO/AzureWebChatIOGroup/MapWorkerRole1Instances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:WorkerRole1:HttpIn">
          <toPorts>
            <inPortMoniker name="/AzureWebChatIO/AzureWebChatIOGroup/WorkerRole1/HttpIn" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapWorkerRole1Instances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureWebChatIO/AzureWebChatIOGroup/WorkerRole1Instances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="WorkerRole1" generation="1" functional="0" release="0" software="C:\NodeJsLab\AzureWebChatIO\local_package.csx\roles\WorkerRole1" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="HttpIn" protocol="tcp" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;WorkerRole1&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;WorkerRole1&quot;&gt;&lt;e name=&quot;HttpIn&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureWebChatIO/AzureWebChatIOGroup/WorkerRole1Instances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureWebChatIO/AzureWebChatIOGroup/WorkerRole1UpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureWebChatIO/AzureWebChatIOGroup/WorkerRole1FaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="WorkerRole1UpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="WorkerRole1FaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="WorkerRole1Instances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="9d58ad57-2270-40b3-97c8-e48d12886157" ref="Microsoft.RedDog.Contract\ServiceContract\AzureWebChatIOContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="8cce4c3b-b0cc-47e0-88bd-ea06d930a8f4" ref="Microsoft.RedDog.Contract\Interface\WorkerRole1:HttpIn@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/AzureWebChatIO/AzureWebChatIOGroup/WorkerRole1:HttpIn" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>