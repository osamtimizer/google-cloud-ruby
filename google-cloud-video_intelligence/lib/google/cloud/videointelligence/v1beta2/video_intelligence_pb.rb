# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/videointelligence/v1beta2/video_intelligence.proto


require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/duration_pb'
require 'google/protobuf/timestamp_pb'
require 'google/rpc/status_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.cloud.videointelligence.v1beta2.AnnotateVideoRequest" do
    optional :input_uri, :string, 1
    optional :input_content, :bytes, 6
    repeated :features, :enum, 2, "google.cloud.videointelligence.v1beta2.Feature"
    optional :video_context, :message, 3, "google.cloud.videointelligence.v1beta2.VideoContext"
    optional :output_uri, :string, 4
    optional :location_id, :string, 5
  end
  add_message "google.cloud.videointelligence.v1beta2.VideoContext" do
    repeated :segments, :message, 1, "google.cloud.videointelligence.v1beta2.VideoSegment"
    optional :label_detection_config, :message, 2, "google.cloud.videointelligence.v1beta2.LabelDetectionConfig"
    optional :shot_change_detection_config, :message, 3, "google.cloud.videointelligence.v1beta2.ShotChangeDetectionConfig"
    optional :explicit_content_detection_config, :message, 4, "google.cloud.videointelligence.v1beta2.ExplicitContentDetectionConfig"
    optional :face_detection_config, :message, 5, "google.cloud.videointelligence.v1beta2.FaceDetectionConfig"
  end
  add_message "google.cloud.videointelligence.v1beta2.LabelDetectionConfig" do
    optional :label_detection_mode, :enum, 1, "google.cloud.videointelligence.v1beta2.LabelDetectionMode"
    optional :stationary_camera, :bool, 2
    optional :model, :string, 3
  end
  add_message "google.cloud.videointelligence.v1beta2.ShotChangeDetectionConfig" do
    optional :model, :string, 1
  end
  add_message "google.cloud.videointelligence.v1beta2.ExplicitContentDetectionConfig" do
    optional :model, :string, 1
  end
  add_message "google.cloud.videointelligence.v1beta2.FaceDetectionConfig" do
    optional :model, :string, 1
    optional :include_bounding_boxes, :bool, 2
  end
  add_message "google.cloud.videointelligence.v1beta2.VideoSegment" do
    optional :start_time_offset, :message, 1, "google.protobuf.Duration"
    optional :end_time_offset, :message, 2, "google.protobuf.Duration"
  end
  add_message "google.cloud.videointelligence.v1beta2.LabelSegment" do
    optional :segment, :message, 1, "google.cloud.videointelligence.v1beta2.VideoSegment"
    optional :confidence, :float, 2
  end
  add_message "google.cloud.videointelligence.v1beta2.LabelFrame" do
    optional :time_offset, :message, 1, "google.protobuf.Duration"
    optional :confidence, :float, 2
  end
  add_message "google.cloud.videointelligence.v1beta2.Entity" do
    optional :entity_id, :string, 1
    optional :description, :string, 2
    optional :language_code, :string, 3
  end
  add_message "google.cloud.videointelligence.v1beta2.LabelAnnotation" do
    optional :entity, :message, 1, "google.cloud.videointelligence.v1beta2.Entity"
    repeated :category_entities, :message, 2, "google.cloud.videointelligence.v1beta2.Entity"
    repeated :segments, :message, 3, "google.cloud.videointelligence.v1beta2.LabelSegment"
    repeated :frames, :message, 4, "google.cloud.videointelligence.v1beta2.LabelFrame"
  end
  add_message "google.cloud.videointelligence.v1beta2.ExplicitContentFrame" do
    optional :time_offset, :message, 1, "google.protobuf.Duration"
    optional :pornography_likelihood, :enum, 2, "google.cloud.videointelligence.v1beta2.Likelihood"
  end
  add_message "google.cloud.videointelligence.v1beta2.ExplicitContentAnnotation" do
    repeated :frames, :message, 1, "google.cloud.videointelligence.v1beta2.ExplicitContentFrame"
  end
  add_message "google.cloud.videointelligence.v1beta2.NormalizedBoundingBox" do
    optional :left, :float, 1
    optional :top, :float, 2
    optional :right, :float, 3
    optional :bottom, :float, 4
  end
  add_message "google.cloud.videointelligence.v1beta2.FaceSegment" do
    optional :segment, :message, 1, "google.cloud.videointelligence.v1beta2.VideoSegment"
  end
  add_message "google.cloud.videointelligence.v1beta2.FaceFrame" do
    repeated :normalized_bounding_boxes, :message, 1, "google.cloud.videointelligence.v1beta2.NormalizedBoundingBox"
    optional :time_offset, :message, 2, "google.protobuf.Duration"
  end
  add_message "google.cloud.videointelligence.v1beta2.FaceAnnotation" do
    optional :thumbnail, :bytes, 1
    repeated :segments, :message, 2, "google.cloud.videointelligence.v1beta2.FaceSegment"
    repeated :frames, :message, 3, "google.cloud.videointelligence.v1beta2.FaceFrame"
  end
  add_message "google.cloud.videointelligence.v1beta2.VideoAnnotationResults" do
    optional :input_uri, :string, 1
    repeated :segment_label_annotations, :message, 2, "google.cloud.videointelligence.v1beta2.LabelAnnotation"
    repeated :shot_label_annotations, :message, 3, "google.cloud.videointelligence.v1beta2.LabelAnnotation"
    repeated :frame_label_annotations, :message, 4, "google.cloud.videointelligence.v1beta2.LabelAnnotation"
    repeated :face_annotations, :message, 5, "google.cloud.videointelligence.v1beta2.FaceAnnotation"
    repeated :shot_annotations, :message, 6, "google.cloud.videointelligence.v1beta2.VideoSegment"
    optional :explicit_annotation, :message, 7, "google.cloud.videointelligence.v1beta2.ExplicitContentAnnotation"
    optional :error, :message, 9, "google.rpc.Status"
  end
  add_message "google.cloud.videointelligence.v1beta2.AnnotateVideoResponse" do
    repeated :annotation_results, :message, 1, "google.cloud.videointelligence.v1beta2.VideoAnnotationResults"
  end
  add_message "google.cloud.videointelligence.v1beta2.VideoAnnotationProgress" do
    optional :input_uri, :string, 1
    optional :progress_percent, :int32, 2
    optional :start_time, :message, 3, "google.protobuf.Timestamp"
    optional :update_time, :message, 4, "google.protobuf.Timestamp"
  end
  add_message "google.cloud.videointelligence.v1beta2.AnnotateVideoProgress" do
    repeated :annotation_progress, :message, 1, "google.cloud.videointelligence.v1beta2.VideoAnnotationProgress"
  end
  add_enum "google.cloud.videointelligence.v1beta2.Feature" do
    value :FEATURE_UNSPECIFIED, 0
    value :LABEL_DETECTION, 1
    value :SHOT_CHANGE_DETECTION, 2
    value :EXPLICIT_CONTENT_DETECTION, 3
    value :FACE_DETECTION, 4
  end
  add_enum "google.cloud.videointelligence.v1beta2.LabelDetectionMode" do
    value :LABEL_DETECTION_MODE_UNSPECIFIED, 0
    value :SHOT_MODE, 1
    value :FRAME_MODE, 2
    value :SHOT_AND_FRAME_MODE, 3
  end
  add_enum "google.cloud.videointelligence.v1beta2.Likelihood" do
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
module Google::Cloud::VideoIntelligence::V1beta2
  AnnotateVideoRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.AnnotateVideoRequest").msgclass
  VideoContext = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.VideoContext").msgclass
  LabelDetectionConfig = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.LabelDetectionConfig").msgclass
  ShotChangeDetectionConfig = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.ShotChangeDetectionConfig").msgclass
  ExplicitContentDetectionConfig = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.ExplicitContentDetectionConfig").msgclass
  FaceDetectionConfig = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.FaceDetectionConfig").msgclass
  VideoSegment = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.VideoSegment").msgclass
  LabelSegment = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.LabelSegment").msgclass
  LabelFrame = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.LabelFrame").msgclass
  Entity = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.Entity").msgclass
  LabelAnnotation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.LabelAnnotation").msgclass
  ExplicitContentFrame = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.ExplicitContentFrame").msgclass
  ExplicitContentAnnotation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.ExplicitContentAnnotation").msgclass
  NormalizedBoundingBox = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.NormalizedBoundingBox").msgclass
  FaceSegment = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.FaceSegment").msgclass
  FaceFrame = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.FaceFrame").msgclass
  FaceAnnotation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.FaceAnnotation").msgclass
  VideoAnnotationResults = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.VideoAnnotationResults").msgclass
  AnnotateVideoResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.AnnotateVideoResponse").msgclass
  VideoAnnotationProgress = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.VideoAnnotationProgress").msgclass
  AnnotateVideoProgress = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.AnnotateVideoProgress").msgclass
  Feature = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.Feature").enummodule
  LabelDetectionMode = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.LabelDetectionMode").enummodule
  Likelihood = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.videointelligence.v1beta2.Likelihood").enummodule
end
