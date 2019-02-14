# Pythono3 code to rename multiple  
# files in a directory or folder 
  
# importing os module 
import os 
  
# Function to rename multiple files 
def main(): 
    i = 1
      
    for filename in os.listdir("/home/iplab/Desktop/HMM_Implementation_Input_Increase_2_writehtk/HMM_Implementation/MFCC_Input/"): 
        dst, dst1 =filename.split('.')
        print(dst)
        src ='/home/iplab/Desktop/HMM_Implementation_Input_Increase_2_writehtk/HMM_Implementation/MFCC_Input/'+ filename 
        dst ='/home/iplab/Desktop/HMM_Implementation_Input_Increase_2_writehtk/HMM_Implementation/MFCC_Input/'+ dst
          
        # rename() function will 
        # rename all the files 
        os.rename(src, dst) 
        i += 1
  
# Driver Code 
if __name__ == '__main__': 
      
    # Calling main() function 
    main() 
