# Pachyderm -> ClearML
Pachyderm logging to ClearML. ClearML is a great visualization and reporting framework for machine learning models, but one of the difficulties is keeping up with changing datasets. By using Pachyderm as our execution platform, we can version our executions, code, data, and models while still tracking everything in ClearML. 

<p align="center">
  <img width="700" src="images/diagram.jpg">
</p>

This is a simple integration example where we use ClearML for monitoring our jobs and experiments, while using Pachyderm to manage our data and automatically run pipelines when our code or data changes.

## TLDR; How it works

1. [Spin up Pachyderm](https://hub.pachyderm.com/landing?redirect=%2F) (Using Pachyderm Hub) and connect to it.
2. [Spin up ClearML](https://app.community.clear.ml) (Using ClearML Hosted Community Edition)
3. [Create a ClearML config](https://allegro.ai/clearml/docs/docs/deploying_clearml/clearml_config_for_clearml_server.html#configuring-clearml-for-your-clearml-server). Copy the config to this directory as `clearml.conf` (this will be copied to a Pachyderm data repository so that it is not stored in the Docker image itself, but this should be changed in the future).
4. Run the `make all`

## MNIST example

- Creates a project in ClearML with the name of the Pachyderm pipeline. 
- Trains an MNIST classifier in a Pachyderm Job
- Logs training info from training to ClearML for monitoring and comparison.
- If the Data or Pachyderm Pipeline changes, it kicks off a new training process.


## Not Supported

- Multi-GPU - ClearML has some really cool features here, but right now Pachyderm is executing the job in a single Pod. 

## To Fix
- Move config is hardcoded