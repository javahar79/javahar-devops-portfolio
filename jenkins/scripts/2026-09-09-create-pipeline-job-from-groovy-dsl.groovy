// last_verified: 2026-09-09 · Jenkins latest
// jenkins-008: create a pipeline job from a Groovy DSL script via the Jenkins CLI
// Run: java -jar jenkins-cli.jar -s <jenkins-url> groovy = 2026-09-09-create-pipeline-job-from-groovy-dsl.groovy

import jenkins.model.Jenkins
import org.jenkinsci.plugins.workflow.job.WorkflowJob
import org.jenkinsci.plugins.workflow.cps.CpsFlowDefinition

def instance = Jenkins.getInstance()
def jobName = 'cli-created-pipeline'

// I add this guard because running the CLI script twice used to blow up with "job already exists"
if (instance.getItem(jobName)) {
    println "Job '${jobName}' already exists — skipping creation."
    return
}

// Create a new Pipeline job object
def job = instance.createProject(WorkflowJob, jobName)

// Inline the pipeline so I don't need an external SCM for this first attempt
def pipelineScript = '''
pipeline {
    agent any
    stages {
        stage('Hello') {
            steps {
                echo 'Hello from CLI-created pipeline'
            }
        }
    }
}
'''

// sandbox=true keeps the script inside Jenkins' Groovy sandbox
def definition = new CpsFlowDefinition(pipelineScript, true)
job.setDefinition(definition)
job.save()

println "Created pipeline job '${jobName}'"
