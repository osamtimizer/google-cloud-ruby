# Copyright 2016 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


require "delegate"

module Google
  module Cloud
    module Bigquery
      class Project
        ##
        # Project::List is a special case Array with additional values.
        class List < DelegateClass(::Array)
          ##
          # If not empty, indicates that there are more records that match
          # the request and this value should be passed to continue.
          attr_accessor :token

          # A hash of this page of results.
          attr_accessor :etag

          ##
          # @private Create a new Project::List with an array of
          # Project instances.
          def initialize arr = []
            super arr
          end

          ##
          # Whether there is a next page of projects.
          #
          # @return [Boolean]
          #
          # @example
          #   require "google/cloud/bigquery"
          #
          #   bigquery = Google::Cloud::Bigquery.new
          #
          #   projects = bigquery.projects
          #   if projects.next?
          #     next_projects = projects.next
          #   end
          def next?
            !token.nil?
          end

          ##
          # Retrieve the next page of projects.
          #
          # @return [Project::List]
          #
          # @example
          #   require "google/cloud/bigquery"
          #
          #   bigquery = Google::Cloud::Bigquery.new
          #
          #   projects = bigquery.projects
          #   if projects.next?
          #     next_projects = projects.next
          #   end
          def next
            return nil unless next?
            ensure_service!
            options = { all: @hidden, token: token, max: @max }
            gapi = @service.list_projects options
            self.class.from_gapi gapi, @service, @max
          end

          ##
          # Retrieves all projects by repeatedly loading {#next} until {#next?}
          # returns `false`. Calls the given block once for each project, which
          # is passed as the parameter.
          #
          # An Enumerator is returned if no block is given.
          #
          # This method may make several API calls until all projects are
          # retrieved. Be sure to use as narrow a search criteria as possible.
          # Please use with caution.
          #
          # @param [Integer] request_limit The upper limit of API requests to
          #   make to load all projects. Default is no limit.
          # @yield [project] The block for accessing each project.
          # @yieldparam [Project] project The project object.
          #
          # @return [Enumerator]
          #
          # @example Iterating each result by passing a block:
          #   require "google/cloud/bigquery"
          #
          #   bigquery = Google::Cloud::Bigquery.new
          #
          #   bigquery.projects.all do |project|
          #     puts project.name
          #   end
          #
          # @example Using the enumerator by not passing a block:
          #   require "google/cloud/bigquery"
          #
          #   bigquery = Google::Cloud::Bigquery.new
          #
          #   all_project_ids = bigquery.projects.all.map do |project|
          #     project.name
          #   end
          #
          # @example Limit the number of API calls made:
          #   require "google/cloud/bigquery"
          #
          #   bigquery = Google::Cloud::Bigquery.new
          #
          #   bigquery.projects.all(request_limit: 10) do |project|
          #     puts project.name
          #   end
          #
          def all request_limit: nil
            request_limit = request_limit.to_i if request_limit
            unless block_given?
              return enum_for(:all, request_limit: request_limit)
            end
            results = self
            loop do
              results.each { |r| yield r }
              if request_limit
                request_limit -= 1
                break if request_limit < 0
              end
              break unless results.next?
              results = results.next
            end
          end

          ##
          # @private New Project::List from a response object.
          def self.from_gapi gapi_list, service, max = nil
            projects = List.new(Array(gapi_list.projects).map do |gapi_object|
              Project.from_gapi gapi_object, service
            end)
            projects.instance_variable_set :@token,   gapi_list.next_page_token
            projects.instance_variable_set :@etag,    gapi_list.etag
            projects.instance_variable_set :@service, service
            projects.instance_variable_set :@max,     max
            projects
          end

          protected

          ##
          # Raise an error unless an active service is available.
          def ensure_service!
            fail "Must have active connection" unless @service
          end
        end
      end
    end
  end
end
