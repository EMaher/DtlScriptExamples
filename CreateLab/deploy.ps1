##Login-AzureRmAccount
$labName = 'MyLab2'
$groupName = "$($labName)RG"
New-AzureRmResourceGroup -Name $groupName -Location "centralus"
New-AzureRmResourceGroupDeployment `
    -ResourceGroupName $groupName `
    -TemplateFile '.\azuredeploy.json' `
    -newLabName $labName -Force

Set-AzureRmDtlVMsPerUserPolicy -LabName $labName -ResourceGroupName $groupName -MaxVMs 3 -Enable:$true
