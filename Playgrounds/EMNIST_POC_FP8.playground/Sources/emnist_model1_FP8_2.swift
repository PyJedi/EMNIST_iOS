//
// emnist_model1_FP8_2.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
class emnist_model1_FP8_2Input : MLFeatureProvider {

    /// input1 as grayscale (kCVPixelFormatType_OneComponent8) image buffer, 28 pixels wide by 28 pixels high
    public var input1: CVPixelBuffer

    public var featureNames: Set<String> {
        get {
            return ["input1"]
        }
    }
    
    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "input1") {
            return MLFeatureValue(pixelBuffer: input1)
        }
        return nil
    }
    
    public init(input1: CVPixelBuffer) {
        self.input1 = input1
    }
}

/// Model Prediction Output Type
@available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
class emnist_model1_FP8_2Output : MLFeatureProvider {

    /// Source provided by CoreML

    private let provider : MLFeatureProvider


    /// output1 as 47 element vector of doubles
    public lazy var output1: MLMultiArray = {
        [unowned self] in return self.provider.featureValue(for: "output1")!.multiArrayValue
    }()!

    public var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    public func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }

    public init(output1: MLMultiArray) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["output1" : MLFeatureValue(multiArray: output1)])
    }

    public init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
class emnist_model1_FP8_2 {
    public var model: MLModel

/// URL of model assuming it was installed in the same bundle as this class
    public class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: emnist_model1_FP8_2.self)
        return bundle.url(forResource: "emnist_model1_FP8_2", withExtension:"mlmodelc")!
    }

    /**
        Construct a model with explicit path to mlmodelc file
        - parameters:
           - url: the file url of the model
           - throws: an NSError object that describes the problem
    */
    public init(contentsOf url: URL) throws {
        self.model = try MLModel(contentsOf: url)
    }

    /// Construct a model that automatically loads the model from the app's bundle
    public convenience init() {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }

    /**
        Construct a model with configuration
        - parameters:
           - configuration: the desired model configuration
           - throws: an NSError object that describes the problem
    */
    public convenience init(configuration: MLModelConfiguration) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct a model with explicit path to mlmodelc file and configuration
        - parameters:
           - url: the file url of the model
           - configuration: the desired model configuration
           - throws: an NSError object that describes the problem
    */
    public init(contentsOf url: URL, configuration: MLModelConfiguration) throws {
        self.model = try MLModel(contentsOf: url, configuration: configuration)
    }

    /**
        Make a prediction using the structured interface
        - parameters:
           - input: the input to the prediction as emnist_model1_FP8_2Input
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as emnist_model1_FP8_2Output
    */
    public func prediction(input: emnist_model1_FP8_2Input) throws -> emnist_model1_FP8_2Output {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface
        - parameters:
           - input: the input to the prediction as emnist_model1_FP8_2Input
           - options: prediction options 
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as emnist_model1_FP8_2Output
    */
    public func prediction(input: emnist_model1_FP8_2Input, options: MLPredictionOptions) throws -> emnist_model1_FP8_2Output {
        let outFeatures = try model.prediction(from: input, options:options)
        return emnist_model1_FP8_2Output(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface
        - parameters:
            - input1 as grayscale (kCVPixelFormatType_OneComponent8) image buffer, 28 pixels wide by 28 pixels high
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as emnist_model1_FP8_2Output
    */
    public func prediction(input1: CVPixelBuffer) throws -> emnist_model1_FP8_2Output {
        let input_ = emnist_model1_FP8_2Input(input1: input1)
        return try self.prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface
        - parameters:
           - inputs: the inputs to the prediction as [emnist_model1_FP8_2Input]
           - options: prediction options 
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as [emnist_model1_FP8_2Output]
    */
    func predictions(inputs: [emnist_model1_FP8_2Input], options: MLPredictionOptions = MLPredictionOptions()) throws -> [emnist_model1_FP8_2Output] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [emnist_model1_FP8_2Output] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  emnist_model1_FP8_2Output(features: outProvider)
            results.append(result)
        }
        return results
    }
}
