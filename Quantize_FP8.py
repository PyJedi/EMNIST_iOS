import coremltools
from coremltools.models.neural_network import quantization_utils

model = coremltools.models.MLModel('emnist_model1.mlmodel')
quantized_model = quantization_utils.quantize_weights(model, 8, "linear")
#coremltools.utils.save_spec(quantized_model, 'emnist_model1_FP8.mlmodel')
quantized_model.save('emnist_model1_FP8.mlmodel')
print('Done!')

model = coremltools.models.MLModel('emnist_model2.mlmodel')
quantized_model = quantization_utils.quantize_weights(model, 8, "linear")
#coremltools.utils.save_spec(quantized_model, 'emnist_model2_FP8.mlmodel')
quantized_model.save('emnist_model2_FP8.mlmodel')
print('Done!')

model = coremltools.models.MLModel('emnist_model3.mlmodel')
quantized_model = quantization_utils.quantize_weights(model, 8, "linear")
#coremltools.utils.save_spec(quantized_model, 'emnist_model3_FP8.mlmodel')
quantized_model.save('emnist_model3_FP8.mlmodel')
print('Done!')

model = coremltools.models.MLModel('emnist_model4.mlmodel')
quantized_model = quantization_utils.quantize_weights(model, 8, "linear")
#coremltools.utils.save_spec(quantized_model, 'emnist_model4_FP8.mlmodel')
quantized_model.save('emnist_model4_FP8.mlmodel')
print('Done!')

model = coremltools.models.MLModel('emnist_model5.mlmodel')
quantized_model = quantization_utils.quantize_weights(model, 8, "linear")
#coremltools.utils.save_spec(quantized_model, 'emnist_model5_FP8.mlmodel')
quantized_model.save('emnist_model5_FP8.mlmodel')
print('Done!')

model = coremltools.models.MLModel('emnist_model6.mlmodel')
quantized_model = quantization_utils.quantize_weights(model, 8, "linear")
#coremltools.utils.save_spec(quantized_model, 'emnist_model6_FP8.mlmodel')
quantized_model.save('emnist_model6_FP8.mlmodel')
print('Done!')

model = coremltools.models.MLModel('emnist_model7.mlmodel')
quantized_model = quantization_utils.quantize_weights(model, 8, "linear")
#coremltools.utils.save_spec(quantized_model, 'emnist_model7_FP8.mlmodel')
quantized_model.save('emnist_model7_FP8.mlmodel')
print('Done!')

model = coremltools.models.MLModel('emnist_model8.mlmodel')
quantized_model = quantization_utils.quantize_weights(model, 8, "linear")
#coremltools.utils.save_spec(quantized_model, 'emnist_model8_FP8.mlmodel')
quantized_model.save('emnist_model8_FP8.mlmodel')
print('Done!')

model = coremltools.models.MLModel('emnist_model9.mlmodel')
quantized_model = quantization_utils.quantize_weights(model, 8, "linear")
#coremltools.utils.save_spec(quantized_model, 'emnist_model9_FP8.mlmodel')
quantized_model.save('emnist_model9_FP8.mlmodel')
print('Done!')
