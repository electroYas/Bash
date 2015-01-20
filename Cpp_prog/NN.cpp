#include <iostream>
#include <vector>
#include "utils.h"

using namespace std;

class Neuron{
public:
  
  vector<double> weight;
  double output;
  int num_inputs;
  Neuron(int t_inputs);
  
};

Neuron::Neuron(int t_inputs){
  
  num_inputs = t_inputs;
  
  for(int i=0;i<num_inputs;i++){
    weight.push_back(RandomClamped());
  }
  
}

class Layer{
public:
  
  int num_neurons;
  vector<Neuron> vect_neuron;
  Layer(int t_num_inputs,int t_num_neurons);
  
};

Layer::Layer(int t_num_inputs,int t_num_neurons){
  
  num_neurons = t_num_neurons;
  
  for(int i=0;i<num_neurons;i++){
      vect_neuron.push_back(Neuron(t_num_inputs));
  }
}

class NeuralNet{
private:
  
  int num_inputs;
  int num_neurons_per_layer;
  int num_ouputs;
  int num_layers;
  
public:
  
  vector<Layer> vec_layer;
  NeuralNet();
  void print_weights(void);
  
};

NeuralNet::NeuralNet(){
  num_inputs = 5;
  num_layers = 8;
  num_ouputs = 3;
  num_neurons_per_layer = 6;
  
  for(int i=0;i<num_layers;i++){
    if(i == 0){
      vec_layer.push_back(Layer(num_inputs,num_neurons_per_layer));
    }else{
      vec_layer.push_back(Layer(num_neurons_per_layer,num_neurons_per_layer));
    }
  }
  
  vec_layer.push_back(Layer(num_neurons_per_layer,num_ouputs));
}

void NeuralNet::print_weights(){
    for(int i=0;i<num_layers;i++){
      cout<<endl<<"============================="<<endl;
      cout<<"Layer ";
      cout<<i<<endl;
      for(int j=0;j<num_neurons_per_layer;j++){
	cout<<"---------------------"<<endl;
	cout<<"Neuron ";
	cout<<j<<endl;
	for(int k=0;k<vec_layer[i].vect_neuron[j].num_inputs;k++){
	  cout<<vec_layer[i].vect_neuron[j].weight[k]<<endl;
	}
	cout<<"---------------------"<<endl;
      }
    }
    cout<<endl<<"==============================="<<endl;
    cout<<"Output layer :Layer ";
    cout<<num_layers<<endl;
    for(int i=0;i<num_ouputs;i++){
      cout<<"---------------------"<<endl;
      cout<<"Neuron ";
      cout<<i<<endl;
      for(int j=0;j<num_neurons_per_layer;j++){
	cout<<vec_layer[num_layers].vect_neuron[i].weight[j]<<endl;
      }
      cout<<"---------------------"<<endl;
    }
    
}
int main(void){
  int num_inputs = 3;
  int num_neurons = 5;
  
  NeuralNet n1;
  n1.print_weights();
  return 0;
}
  
