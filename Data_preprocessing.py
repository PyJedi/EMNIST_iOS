import numpy as np
import pandas as pd
import keras

train_data_path = './emnist_train.csv'
test_data_path = './emnist_test.csv'
train_data = pd.read_csv(train_data_path, header=None)
train_data_array = np.asarray(train_data)
print(train_data_array.shape)

def img_label_load(data_path, num_classes=None):
        data = pd.read_csv(data_path, header=None)
        data_rows = len(data)
        if not num_classes:
            num_classes = len(data[0].unique())
        
        # this assumes square imgs. Should be 28x28
        img_size = int(np.sqrt(len(data.iloc[0][1:])))
        
        # Images need to be transposed. This line also does the reshaping needed.
        imgs = np.transpose(data.values[:,1:].reshape(data_rows, img_size, img_size, 1), axes=[0,2,1,3]) # img_size * img_size arrays
        
        labels = keras.utils.to_categorical(data.values[:,0], num_classes) # one-hot encoding vectors
        
        return imgs/255., labels

train_images, train_labels = img_label_load(train_data_path)
test_images, test_labels = img_label_load(test_data_path)

print(train_images.shape)
print(train_labels.shape)
print(test_images.shape)
print(test_labels.shape)

np.save('x_train.npy',train_images)
np.save('x_test.npy',test_images)
np.save('y_train.npy',train_labels)
np.save('y_test.npy',test_labels)
