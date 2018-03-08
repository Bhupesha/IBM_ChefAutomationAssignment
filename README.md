# apache

Automate the installation and configuration using Chef for package httpd.
few test cases has been  validated  using Kitchen commands.

Chef Development Kit Version: 2.3.4
chef-client version: 13.4.19
berks version: 6.3.1
kitchen version: 1.17.0
inspec version: 1.36.1

# Install docker on Ubuntu
apt-get install docker.io
systemctl start docker
systemctl enable docker

# Install ruby gem 
apt-get install gem

# Install kitchen-docker
chef gem install kitchen-docker


finally what decision I have made to speed up feedback cycle  even more.

Before demonstrate all these things I would like  to tell you the background  .

There are number of tools available  in the market to do  infrastructure automation like Chef, puppet, Ansible.
chef provides a grate flexibality and various command line tools  in order to write better Scipts & testing these scripts.

we all are writing recipes, how do we make sure that my recipes works in another system? what about the production?will they work in production?
when we develop our automation, we need to start thinking about verifying it. 
Because it is all too common story of automation failing  when it  reaches to production beacuse it was never validated against anything other than "my machine"

we need to consider two things how often we need to test the cookbook, how often we are changing the cookbook.
what would happen if the rate of Cookbook changes exceeds the time interval it takes to verifying the Cookbook.

Before uploading our cookbook to chef server we have to ensure that our cookbooks tested thoroughly before applying it on production.
In order to verify our  cookbook  we have standard steps right.

- create a virtual machine or set up the Instance that resembles our production.
- Installing the Chef tools
- copy the cookbooks to this new instance.
- Run/apply the cookbooks to the instance
- verify the Assumptions 
- Destroy the virtual Machine.

when you consider the first step either we have go with hypervisor virtualization or containerization technology to spin up the new instance.
It was my decision to go with containerization technology  for  spining up the containers. 

 - Virtualization
Before virtualization so every application we needed to deploy we needed to buy and build a dedicated  server for it.
if we have 10 application mysql, IIS, tomcat, Apache  we needed 10 servers, so 10 purchase orders, 10 operating system licence, 10 rack positions, 10 sets of reduntant power and cooling.
10 sets of probably reduntant networking and storage infrastrucure too. network cables, switches
each applications required a tons of infrastructure. Just need to spin up a new application will take from weeks to months.

Even after this costly set up my application requires  less resource  4 GB of RAM and 5% of CPU.
so server utilization is just 10% out of 100% so we are wasting so much resource.

- After hyperviser virtualization 
install this hypervisor on top of the  host operating system, before we spin up a machine we need to configure precisely how much of RAM, diskspace and cpu is needed.
finally we moved from 1:1   to a model of multiple application running per single physical server. so we are utilizing the reasources to a maximum extent.
needless to say this was a revolution and a much better model.

But again this model is also far from the perfect.
- each VM runs on it's own operating system (guest operating system) inside a hardware simulated environment provided by a programme called hypervisor running on the physical machine.
- let's say you running 10 vms  you must need indivisual OS licence for each vms
- more operating system doesn't add business value.
- Let's we are running 10 VMS, each OS consumes 2 GB of disckspace,5 GB of RAM, 10% of cpu. So totaly we need 100 GB of disckspace,50 GB of RAM, 50 % of Cpu 
 without ruuning single application even each os consumes lot of reasource.
- each operating system Instance is a grass waste of resource.

Virtualization is widely used, it's the  go-to technology of cloud infrastucture. So with virtualization you can scale up or scale down Disck space, RAM and CPU
Basically we are running VM for our local development. 

Dockers:
Docker is an engine which manages the container. docker is an containerization plattform  for developpers, sysadmins, to build, Ship, running distrubuted applications. 
weather it is on laptop or datacenter or cloud or any virtual machines.
Docker containers are the light weight solutions to virtual machines and uses the host operating os.
The best part is that , you don't have to pre-allocate any RAM to the docker container.
It will take it as and when required.
so with the docker container I don't have to worry about wastage of reasources.
since docker containers are light weight in nature  you can spin up these containers within mili seconds.
Docker helps you to speed up testing against multiple operating environments.

creating and destroying virtual machines is time-consuming and resource-intensive.
Adding more test suites made our integration tests take even longer
if you want run multile test suites against multiple operating system  takes much time when we go with hyperviser virtualization.



https://learn.chef.io/modules/unit-test-with-chefspec/linux/create-a-multiplatform-cookbook/
https://learn.chef.io/modules/unit-test-with-chefspec/windows/create-a-web-content-cookbook#/

