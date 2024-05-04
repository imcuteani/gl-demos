# PS script to deploy Azure storage account 
Connect-AzAccount

# Set current subscription
Set-AzContext -Subscription "Visual Studio Enterprise with MSDN"
# Create Resource Group 
$ResourceGroup = 'MyResourceGroup'
New-AzResourceGroup -Name $ResourceGroup -Location $Location

# Create Storage Account 
$StorageHT = @{
    ResourceGroupName = $ResourceGroup
    Name              = 'mystorageaccount'
    SkuName           = 'Standard_LRS'
    Location          =  $Location
  }
  $StorageAccount = New-AzStorageAccount @StorageHT
  $Context = $StorageAccount.Context
  # Create a Container
  $ContainerName = 'quickstartblobs'
New-AzStorageContainer -Name $ContainerName -Context $Context

# upload blobs to a container 
# upload a file to the default account (inferred) access tier
$Blob1HT = @{
    File             = 'D:\Images\Image001.jpg'
    Container        = $ContainerName
    Blob             = "Image001.jpg"
    Context          = $Context
    StandardBlobTier = 'Hot'
  }
  Set-AzStorageBlobContent @Blob1HT
    
   # upload another file to the Cool access tier
   $Blob2HT = @{
    File             = 'D:\Images\Image002.jpg'
    Container        = $ContainerName
    Blob             = 'Image002.png'
    Context          = $Context
    StandardBlobTier = 'Cool'
   }
   Set-AzStorageBlobContent @Blob2HT
    
  # upload a file to a folder to the Archive access tier
  $Blob3HT = @{
    File             = 'D:\Images\FolderName\Image003.jpg'
    Container        = $ContainerName
    Blob             = 'FolderName/Image003.jpg'
    Context          = $Context
    StandardBlobTier = 'Archive'
  }
  Set-AzStorageBlobContent @Blob3HT

  # list the blobs to a container 
  Get-AzStorageBlob -Container $ContainerName -Context $Context |
  Select-Object -Property Name

  # download the blobs to a container 
  # Download first blob
$DLBlob1HT = @{
    Blob        = 'Image001.jpg'
    Container   = $ContainerName
    Destination = 'D:\Images\Downloads\'
    Context     = $Context
  }
  Get-AzStorageBlobContent @DLBlob1HT
  
  # Download another blob
  $DLBlob2HT = @{
    Blob        = 'Image002.png'
    Container   = $ContainerName
    Destination = 'D:\Images\Downloads\'
    Context     = $Context  
  }
  Get-AzStorageBlobContent @DLBlob2HT