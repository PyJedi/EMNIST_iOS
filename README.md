# EMNIST_iOS
EMNIST quantization Demo for iOS

To compile the coreML models for swift playgrounds:

```
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer

xcrun coremlcompiler compile MyModel.mlmodel MyModel.mlmodelc
```



## Results for Model-1

The inference time (per sample) is the average of 10 runs

|                             | Swift Playground Inference Time (In Seconds) |  Xcode Inference Time (iphone 11 pro max) ((In Seconds)) | Xcode Inference Time (iphone 8) ((In Seconds)) | Model Size | RAM Usage |
| ------------------- | -------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------ | ------------- | ------------- |                 
| FP8                     | 0.00052147555591849                          |    0.000456584999887531                                          |           0.000495690699608531                         |              99KB| 22.8MB |
| FP16                   | 0.000618779110178972                         |          0.00053541444584779                                      |                     0.000554279400239466              |193B |        23.1MB      |
| FP32                  | 0.000698392555932514                         |                   0.000635254333448959                             |                        0.000688138001714833           |384KB|         23.2MB    |



