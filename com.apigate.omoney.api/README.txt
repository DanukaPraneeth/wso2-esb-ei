================================================================
Patch ID     :  patch_00139
Public Jira  :  https://jira.wso2telco.com/jira/browse/DEPORGHUB-124
Description  :  New Wallet API for Bizao HUB - Orange Money

================================================================

Please perform below modifications to the current deployment to reflect the changes;

PRE-REQUISITES
--------------

System Requirements

a) Java SE Development Kit 1.8
b) wso2telcohub-3.1.0 (WSO2 ESB Server 5.0.0)
c) Below mediators
    com.wso2telco.dep.common.mediation_3.0.0_1.0.0.jar
    com.wso2telco.core.dbutils-2.4.4.jar

INSTALLATION INSTRUCTIONS
-------------------------

1) Create the tables given in the omoney.sql in the depdb of your environment
2) Add the omoneyConfig.xml file to the registry location given below.
    config/repository/wso2telco/configurations/omoneyConfig.xml
3) Deploy given carbon applications
4) Configure two schedule tasks in the ESB server for Token regeneration and Periodic transaction status request with below configurations
    - Task 1 :
        Task Name : statusCheck
        Task Group : synapse.simple.quartz
        Task Implementation : org.apache.synapse.startup.tasks.MessageInjector
        Property Name : sequenceName
        Property Type : Literal
        Property Value : com.apigate.omoney.periodicStatusRequest

        Property Name : injectTo
        Property Type : Literal
        Property Value : sequence

        Property Name : message
        Property Type : XML
        Property Value : <statusCheck/>

        Count : 1
        Interval : 1800

    - Task 2 :
        Task Name : OrangeTokenGenerator
        Task Group : synapse.simple.quartz
        Task Implementation : org.apache.synapse.startup.tasks.MessageInjector
        Property Name : sequenceName
        Property Type : Literal
        Property Value : com.apigate.omoney.tokenGenerator

        Property Name : injectTo
        Property Type : Literal
        Property Value : sequence

        Property Name : message
        Property Type : XML
        Property Value : <tokenRequest/>

        Count : 1
        Interval : 86400
