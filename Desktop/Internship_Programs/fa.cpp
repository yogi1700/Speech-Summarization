#include<iostream>
#include <fstream>
#include<sstream>
#include <string>
#include <vector>
#include<algorithm>


using namespace std;

bool comp(vector<float> x, vector<float> y)
{
  return ((x[1] > y [1]));
}

bool comp1(vector<float> x, vector<float> y)
{
  return ((x[0] > y [0]));
}

/*
* It will iterate through all the lines in file and
* put them in given vector
*/
bool getFileContent(std::string fileName, std::vector<std::string> & vecOfStrs)
{
  
  // Open the File
  std::ifstream in(fileName.c_str());
  
  // Check if object is valid
  if(!in)
  {
    //std::cout << "Cannot open the File : "<<fileName<<std::endl;
    return false;
  }
  
  std::string str;
  // Read the next line from File untill it reaches the end.
  while (std::getline(in, str))
  {
    // Line contains string of length > 0 then save it in vector
    if(str.size() > 0)
      vecOfStrs.push_back(str);
  }
  //Close The File
  in.close();
  return true;
}


int main()
{
  std::vector<std::string> vecOfStr;
  
  // Get the contents of file in a vector
  bool result = getFileContent("/home/iplab/Desktop/Result/output.txt", vecOfStr);
  
  if(result)
  {
    // Print the vector contents
    for(std::string & line : vecOfStr)
      std::cout<<line<<std::endl;
  }
  
  
  int len = vecOfStr.size();
  vector<vector<float>> res;
  ofstream myFile;
  myFile.open("test.csv");
  for(int i = 0; i< len ; i++)
  {
    string str = vecOfStr[i];
    int found = 0;
    vector<int> index;
    while(found < str.length())
    {
      if(str[found] == ',')
        index.push_back(found);
      found++;
    }
    string str1 = str.substr(0,index[0]);
    cout << str1 ;
    string str2 = str.substr(index[index.size()]);
    cout << "  " << str2;
    cout << "\n";
    myFile << str1 << ","<<str2;
  }
}
