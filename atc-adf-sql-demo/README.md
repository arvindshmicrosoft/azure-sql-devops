# Your A-team: Azure Data Factory, Azure SQL, Azure DevOps
These are the code artifacts used in the demo for the "Your A-team: Azure Data Factory, Azure SQL, Azure DevOps" session at the [Around the Clock - Azure SQL and Azure Data Factory](https://github.com/microsoft/aroundtheclock) virtual event. The slide deck is [here](https://github.com/microsoft/aroundtheclock/blob/main/PDFs/1400%20Your%20A-team%20-%20Azure%20Data%20Factory%2C%20Azure%20SQL%2C%20Azure%20DevOps_Arvind.pdf)

The sub-folders are:
* sql: contains a modified [WideWorldImportersDW](https://github.com/microsoft/sql-server-samples/tree/master/samples/databases/wide-world-importers/wwi-dw-ssdt) SQL Database ("SSDT") project compatible with Visual Studio SQL Projects and Azure Data Studio (with the SQL projects extension).
* adf: sub-folders containing the datasets, linked service definitions, pipeline and ADF definition.
* devops: Azure DevOps YAML pipeline which orchestrates the 0-touch deployment of a logical SQL server, elastic pool, database, DACPAC based schema deployment, ADF deployment using the community-supported [Deploy Azure Data Factory by SQLPlayer](https://marketplace.visualstudio.com/items?itemName=SQLPlayer.DataFactoryTools) task.

If you want to try this out yourself, you will need:
* An Azure subscription
    * A storage account within the subscription, with a container and one file uploaded to that container. This file should be named `wwidw-customer.txt` and contain a few lines corresponding to the CSV schema at the bottom of this page.
    * An Azure Key Vault created in the subscription with the following secrets populated:
        * `sql-password` - the password used for 2 SQL authentication users defined within the SQL ("SSDT") project
        * `wwi-blob-sas` - Azure SAS to the container, with List and Read permissions only.
        * `wwi-sql-db` - ADO.NET connection string to Azure SQL.
* Azure DevOps (ADO) account, organization and project
    * The code from this folder pushed to a repo within that ADO project
    * An ADO Service Connection to the Azure subscription mentioned previously
    * The SPN used for the above Service Connection should additionally be granted access to the AzureKey Vault to obtain the secrets used within the ADO pipeline
    * Create a ADO pipeline from the deploy-all.yml file under the devops sub-folder
    * Create the following variables for that pipeline:
        * `akv-name`
        * `data-factory-name`
        * `elastic-pool-name`
        * `logical-sql-server-name`
        * `resource-group-name`
        * `sql-admin-login`
        * `sql-database-name`
        * `subscription-name`
    * The above variables should be populated with suitable values corresponding to your Azure subscription
    * Install the the community-supported [Deploy Azure Data Factory by SQLPlayer](https://marketplace.visualstudio.com/items?itemName=SQLPlayer.DataFactoryTools) task into your ADO project.

### Sample data for the wwidw-customer.txt file:
``` csv
"Customer Key","WWI Customer ID","Customer","Bill To Customer","Category","Buying Group","Primary Contact","Postal Code","Valid From","Valid To","Lineage Key"
"0","0","Unknown","N/A","N/A","N/A","N/A","N/A","2013-01-01 00:00:00.0000000","9999-12-31 23:59:59.9999999","0"
"1","1","Tailspin Toys (Head Office)","Tailspin Toys (Head Office)","Novelty Shop","Tailspin Toys","Waldemar Fisar","90410","2013-01-01 00:00:00.0000000","9999-12-31 23:59:59.9999999","2"
"2","2","Tailspin Toys (Sylvanite, MT)","Tailspin Toys (Head Office)","Novelty Shop","Tailspin Toys","Lorena Cindric","90216","2013-01-01 00:00:00.0000000","9999-12-31 23:59:59.9999999","2"
"3","3","Tailspin Toys (Peeples Valley, AZ)","Tailspin Toys (Head Office)","Novelty Shop","Tailspin Toys","Bhaargav Rambhatla","90205","2013-01-01 00:00:00.0000000","9999-12-31 23:59:59.9999999","2"
"4","4","Tailspin Toys (Medicine Lodge, KS)","Tailspin Toys (Head Office)","Novelty Shop","Tailspin Toys","Daniel Roman","90152","2013-01-01 00:00:00.0000000","9999-12-31 23:59:59.9999999","2"
"5","5","Tailspin Toys (Gasport, NY)","Tailspin Toys (Head Office)","Novelty Shop","Tailspin Toys","Johanna Huiting","90261","2013-01-01 00:00:00.0000000","9999-12-31 23:59:59.9999999","2"
"6","6","Tailspin Toys (Jessie, ND)","Tailspin Toys (Head Office)","Novelty Shop","Tailspin Toys","Biswajeet Thakur","90298","2013-01-01 00:00:00.0000000","9999-12-31 23:59:59.9999999","2"
"7","7","Tailspin Toys (Frankewing, TN)","Tailspin Toys (Head Office)","Novelty Shop","Tailspin Toys","Kalidas Nadar","90761","2013-01-01 00:00:00.0000000","9999-12-31 23:59:59.9999999","2"
"8","8","Tailspin Toys (Bow Mar, CO)","Tailspin Toys (Head Office)","Novelty Shop","Tailspin Toys","Kanti Kotadia","90484","2013-01-01 00:00:00.0000000","9999-12-31 23:59:59.9999999","2"
"9","9","Tailspin Toys (Netcong, NJ)","Tailspin Toys (Head Office)","Novelty Shop","Tailspin Toys","Sointu Aalto","90129","2013-01-01 00:00:00.0000000","9999-12-31 23:59:59.9999999","2"
"10","10","Tailspin Toys (Wimbledon, ND)","Tailspin Toys (Head Office)","Novelty Shop","Tailspin Toys","Siddhartha Parkar","90061","2013-01-01 00:00:00.0000000","9999-12-31 23:59:59.9999999","2"
```

# Disclaimers
##### THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

##### By running the scripts against your Microsoft Azure subscription, you assume full responsibility for any charges incurred.

##### This sample code is not supported under any Microsoft standard support program or service. The entire risk arising out of the use or performance of the sample scripts and documentation remains with you. In no event shall Microsoft, its authors, or anyone else involved in the creation, production, or delivery of the scripts be liable for any damages whatsoever (including, without limitation, damages for loss of business profits, business interruption, loss of business information, or other pecuniary loss) arising out of the use of or inability to use the sample scripts or documentation, even if Microsoft has been advised of the possibility of such damages.
