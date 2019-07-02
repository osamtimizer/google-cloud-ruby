# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/videointelligence/v1p1beta1/video_intelligence.proto


require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/duration_pb'
require 'google/protobuf/timestamp_pb'
require 'google/rpc/status_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.cloud.videointelligence.v1p1beta1.AnnotateVideoRequest" do
    optional :input_uri, :string, 1
    optional :input_content, :bytes, 6
    repeated :features, :enum, 2, "google.cloud.videointelligence.v1p1beta1.Feature"
    optional :video_context, :message, 3, "google.cloud.videointelligence.v1p1beta1.VideoContext"
    optional :output_uri, :string, 4
    optional :location_id, :string, 5
  end
  add_message "google.cloud.videointelligence.v1p1beta1.VideoContext" do
    repeated :segments, :message, 1, "google.cloud.videointelligence.v1p1beta1.VideoSegment"
    optional :label_detection_config, :message, 2, "google.cloud.videointelligence.v1p1beta1.LabelDetectionConfig"
    optional :shot_change_detection_config, :message, 3, "google.cloud.videointelligence.v1p1beta1.ShotChangeDetectionConfig"
    optional :explicit_content_detection_config, :message, 4, "google.cloud.videointelligence.v1p1beta1.ExplicitContentDetectionConfig"
    optional :speech_transcription_config, :message, 6, "google.cloud.videointelligence.v1p1beta1.SpeechTranscriptionConfig"
  end
  add_message "google.cloud.videointelligence.v1p1beta1.LabelDetectionConfig" do
    optional :label_detection_mode, :enum, 1, "google.cloud.videointelligence.v1p1beta1.LabelDetectionMode"
    optional :stationary_camera, :bool, 2
    optional :model, :string, 3
  end
  add_message "google.cloud.videointelligence.v1p1beta1.ShotChangeDetectionConfig" do
    optional :model, :string, 1
  end
  add_message "google.cloud.videointelligence.v1p1beta1.ExplicitContentDetectionConfig" do
    optional :model, :string, 1
  end
  add_message "google.cloud.videointelligence.v1p1beta1.VideoSegment" do
    optional :start_time_offset, :message, 1, "google.protobuf.Duration"
    optional :end_time_offset, :message, 2, "google.protobuf.Duration"
  end
  add_message "google.cloud.videointelligence.v1p1beta1.LabelSegment" do
    optional :segment, :message, 1, "google.cloud.videointelligence.v1p1beta1.VideoSegment"
    optional :confidence, :float, 2
  end
  add_message "google.cloud.videointelligence.v1p1beta1.LabelFrame" do
    optional :time_offset, :message, 1, "google.protobuf.Duration"
    optional :confidence, :float, 2
  end
  add_message "google.cloud.videointelligence.v1p1beta1.Entity" do
    optional :entity_id, :string, 1
    optional :description, :string, 2
    optional :language_code, :string, 3
  end
  add_message "google.cloud.videointelligence.v1p1beta1.LabelAnnotation" do
    optional :entity, :message, 1, "google.cloud.videointelligence.v1p1beta1.Entity"
    repeated :category_entities, :message, 2, "google.cloud.videointelligence.v1p1beta1.Entity"
    repeated :segments, :message, 3, "google.cloud.videointelligence.v1p1beta1.LabelSegment"
    repeated :frames, :message, 4, "google.cloud.videointelligence.v1p1beta1.LabelFrame"
  end
  add_message "google.cloud.videointelligence.v1p1beta1.ExplicitContentFrame" do
    optional :time_offset, :message, 1, "google.protobuf.Duration"
    optional :pornography_likelihood, :enum, 2, "google.cloud.videointelligence.v1p1beta1.Likelihood"
  end
  add_message "google.cloud.videointelligence.v1p1beta1.ExplicitContentAnnotation" do
    repeated :frames, :message, 1, "google.cloud.videointelligence.v1p1beta1.ExplicitContentFrame"
  end
  add_message "google.cloud.videointelligence.v1p1beta1.VideoAnnotationResults" do
    optional :input_uri, :string, 1
    repeated :segment_label_annotations, :message, 2, "google.cloud.videointelligence.v1p1beta1.LabelAnnotation"
    repeated :shot_label_annotations, :message, 3, "google.cloud.videointelligence.v1p1beta1.LabelAnnotation"
    repeated :frame_label_annotations, :message, 4, "google.cloud.videointelligence.v1p1beta1.LabelAnnotation"
    repeated :shot_annotations, :message, 6, "google.cloud.videointelligence.v1p1beta1.VideoSegment"
    optional :explicit_annotation, :message, 7, "google.cloud.videointelligence.v1p1beta1.ExplicitContentAnnotation"
    repeated :speech_transcriptions, :message, 11, "google.cloud.videointelligence.v1p1beta1.SpeechTranscription"
    optional :error, :message, 9, "google.rpc.Status"
  end
  add_message "google.cloud.videointelligence.v1p1beta1.AnnotateVideoResponse" do
    repeated :annotation_results, :message, 1, "google.cloud.videointelligence.v1p1beta1.VideoAnnotationResults"
  end
  add_message "google.cloud.videointelligence.v1p1beta1.VideoAnnotationProgress" do
    optional :input_uri, :string, 1
    optional :progress_percent, :int32, 2
    optional :start_time, :message, 3, "google.protobuf.Timestamp"
    optional :update_time, :message, 4, "google.protobuf.Timestamp"
  end
  add_message "google.cloud.videointelligence.v1p1beta1.AnnotateVideoProgress" do
    repeated :annotation_progress, :message, 1, "google.cloud.videointelligence.v1p1beta1.VideoAnnotationProgress"
  end
  add_message "google.cloud.videointelligence.v1p1beta1.SpeechTranscriptionConfig" do
    optional :language_code, :string, 1
    optional :max_alternatives, :int32, 2
    optional :filter_profanity, :bool, 3
    repeated :speech_contexts, :message, 4, "google.cloud.videointelligence.v1p1beta1.SpeechContext"
    optional :enable_automatic_punctuation, :bool, 5
    repeated :audio_tracks, :int32, 6
  end
  add_message "google.cloud.videointelligence.v1p1beta1.SpeechContext" do
    repeated :phrases, :string, 1
  end
  add_message "google.cloud.videointelligence.v1p1beta1.SpeechTranscription" do
    repeated :alternatives, :message, 1, "google.cloud.videointelligence.v1p1beta1.SpeechRecognitionAlternative"
  end
  add_message "google.cloud.videointelligence.v1p1beta1.SpeechRecognitionAlternative" do
    optional :transcript, :string, 1
    optional :confidence, :float, 2
    repeated :words, :message, 3, "google.cloud.videointelligence.v1p1beta1.WordInfo"
  end
  add_message "google.cloud.videointelligence.v1p1beta1.WordInfo" do
    optional :start_time, :message, 1, "google.protobuf.Duration"
    optional :end_time, :message, 2, "google.protobuf.Duration"
    optional :word, :string, 3
  end
  add_enum "google.cloud.videointelligence.v1p1beta1.Feature" do
    value :FEATURE_UNSPECIFIED, 0
    value :LABEL_DETECTION, 1
    value :SHOT_CHANGE_DETECTION, 2
    value :EXPLICIT_CONTENT_DETECTION, 3
    value :SPEECH_TRANSCRIPTION, 6
  end
  add_enum "google.cloud.videointelligence.v1p1beta1.LabelDetectionMode" do
    value :LABEL_DETECTION_MODE_UNSPECIFIED, 0
    value :SHOT_MODE, 1
    value :FRAME_MODE, 2
    value :SHOT_AND_FRAME_MODE, 3
  end
  add_enum "google.cloud.videointelligence.v1p1beta1.Likelihood" do
    value :LIKELIHOOD_UNSPECIFIED, 0
    value :VERY_UNLIKELY, 1
    value :UNLIKELY, 2
    value :POSSIBLE, 3
    value :LIKELY, 4
    value :VERY_LIKELY, 5
  end
end

module Google
  module Cloud
    module VideoIntelligence
    end
    Videointelligence = VideoIntelligence unless const_defined? :Videointelligence
  end
end
module Google::Cloud::VideoIntelligence::V1p1beta1
  AnnotateVideoRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.AnnotateVideoRequest").msgclass
  VideoContext = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.VideoContext").msgclass
  LabelDetectionConfig = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.LabelDetectionConfig").msgclass
  ShotChangeDetectionConfig = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.ShotChangeDetectionConfig").msgclass
  ExplicitContentDetectionConfig = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.ExplicitContentDetectionConfig").msgclass
  VideoSegment = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.VideoSegment").msgclass
  LabelSegment = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.LabelSegment").msgclass
  LabelFrame = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.LabelFrame").msgclass
  Entity = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.Entity").msgclass
  LabelAnnotation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.LabelAnnotation").msgclass
  ExplicitContentFrame = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.ExplicitContentFrame").msgclass
  ExplicitContentAnnotation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.ExplicitContentAnnotation").msgclass
  VideoAnnotationResults = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.VideoAnnotationResults").msgclass
  AnnotateVideoResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.AnnotateVideoResponse").msgclass
  VideoAnnotationProgress = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.VideoAnnotationProgress").msgclass
  AnnotateVideoProgress = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.AnnotateVideoProgress").msgclass
  SpeechTranscriptionConfig = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.SpeechTranscriptionConfig").msgclass
  SpeechContext = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.SpeechContext").msgclass
  SpeechTranscription = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.SpeechTranscription").msgclass
  SpeechRecognitionAlternative = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.SpeechRecognitionAlternative").msgclass
  WordInfo = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.WordInfo").msgclass
  Feature = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.Feature").enummodule
  LabelDetectionMode = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.LabelDetectionMode").enummodule
  Likelihood = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1p1beta1.Likelihood").enummodule
end
