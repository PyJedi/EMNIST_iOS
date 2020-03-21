import coremltools
import coremltools.proto.FeatureTypes_pb2 as ft 

spec = coremltools.utils.load_spec("emnist_model1_FP32.mlmodel")

input = spec.description.input[0]
input.type.imageType.colorSpace = ft.ImageFeatureType.GRAYSCALE
input.type.imageType.height = 28
input.type.imageType.width = 28

coremltools.utils.save_spec(spec, "emnist_model1_FP32_2.mlmodel")
