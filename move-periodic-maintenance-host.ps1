# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

Param(
    #Instance name and zone to move 
    $InstanceName = "client-service-japan",
    $Zone = "asia-northeast1-b"

)  

#$config = gcloud compute instances export $InstanceName --zone=$Zone
$config = gcloud alpha compute instances export $InstanceName --zone=$Zone

$config.Replace("preemptible: false","preemptible: false`r`n  maintenanceInterval: PERIODIC") `
    | gcloud compute instances update-from-file $InstanceName --zone=$Zone --most-disruptive-allowed-action=RESTART
#$config.Replace("automaticRestart: true","automaticRestart: false") `
#    | gcloud compute instances update-from-file $InstanceName --zone=$Zone --most-disruptive-allowed-action=RESTART




