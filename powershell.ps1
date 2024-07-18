# Variables
$resourceGroupName = "example-resources"
$location = "East US"
$storageAccountName = "examplestorageacct$(Get-Random)"
$storageSkuName = "Standard_LRS" # Locally-redundant storage
$storageKind = "StorageV2" # General-purpose v2 storage account

# Create a new resource group if it doesn't exist
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if (-not $resourceGroup) {
    $resourceGroup = New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Create the storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                                       -Name $storageAccountName `
                                       -Location $location `
                                       -SkuName $storageSkuName `
                                       -Kind $storageKind `
                                       -EnableHttpsTrafficOnly $true

# Output the storage account name
Write-Host "Storage account '$($storageAccount.StorageAccountName)' created in resource group '$resourceGroupName'."