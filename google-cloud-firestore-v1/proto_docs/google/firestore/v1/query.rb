# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Google
  module Cloud
    module Firestore
      module V1
        # A Firestore query.
        # @!attribute [rw] select
        #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::Projection]
        #     The projection to return.
        # @!attribute [rw] from
        #   @return [::Array<::Google::Cloud::Firestore::V1::StructuredQuery::CollectionSelector>]
        #     The collections to query.
        # @!attribute [rw] where
        #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::Filter]
        #     The filter to apply.
        # @!attribute [rw] order_by
        #   @return [::Array<::Google::Cloud::Firestore::V1::StructuredQuery::Order>]
        #     The order to apply to the query results.
        #
        #     Firestore guarantees a stable ordering through the following rules:
        #
        #      * Any field required to appear in `order_by`, that is not already
        #        specified in `order_by`, is appended to the order in field name order
        #        by default.
        #      * If an order on `__name__` is not specified, it is appended by default.
        #
        #     Fields are appended with the same sort direction as the last order
        #     specified, or 'ASCENDING' if no order was specified. For example:
        #
        #      * `SELECT * FROM Foo ORDER BY A` becomes
        #        `SELECT * FROM Foo ORDER BY A, __name__`
        #      * `SELECT * FROM Foo ORDER BY A DESC` becomes
        #        `SELECT * FROM Foo ORDER BY A DESC, __name__ DESC`
        #      * `SELECT * FROM Foo WHERE A > 1` becomes
        #        `SELECT * FROM Foo WHERE A > 1 ORDER BY A, __name__`
        # @!attribute [rw] start_at
        #   @return [::Google::Cloud::Firestore::V1::Cursor]
        #     A starting point for the query results.
        # @!attribute [rw] end_at
        #   @return [::Google::Cloud::Firestore::V1::Cursor]
        #     A end point for the query results.
        # @!attribute [rw] offset
        #   @return [::Integer]
        #     The number of results to skip.
        #
        #     Applies before limit, but after all other constraints. Must be >= 0 if
        #     specified.
        # @!attribute [rw] limit
        #   @return [::Google::Protobuf::Int32Value]
        #     The maximum number of results to return.
        #
        #     Applies after all other constraints.
        #     Must be >= 0 if specified.
        class StructuredQuery
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # A selection of a collection, such as `messages as m1`.
          # @!attribute [rw] collection_id
          #   @return [::String]
          #     The collection ID.
          #     When set, selects only collections with this ID.
          # @!attribute [rw] all_descendants
          #   @return [::Boolean]
          #     When false, selects only collections that are immediate children of
          #     the `parent` specified in the containing `RunQueryRequest`.
          #     When true, selects all descendant collections.
          class CollectionSelector
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # A filter.
          # @!attribute [rw] composite_filter
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::CompositeFilter]
          #     A composite filter.
          # @!attribute [rw] field_filter
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::FieldFilter]
          #     A filter on a document field.
          # @!attribute [rw] unary_filter
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::UnaryFilter]
          #     A filter that takes exactly one argument.
          class Filter
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # A filter that merges multiple other filters using the given operator.
          # @!attribute [rw] op
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::CompositeFilter::Operator]
          #     The operator for combining multiple filters.
          # @!attribute [rw] filters
          #   @return [::Array<::Google::Cloud::Firestore::V1::StructuredQuery::Filter>]
          #     The list of filters to combine.
          #     Must contain at least one filter.
          class CompositeFilter
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # A composite filter operator.
            module Operator
              # Unspecified. This value must not be used.
              OPERATOR_UNSPECIFIED = 0

              # The results are required to satisfy each of the combined filters.
              AND = 1
            end
          end

          # A filter on a specific field.
          # @!attribute [rw] field
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::FieldReference]
          #     The field to filter by.
          # @!attribute [rw] op
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::FieldFilter::Operator]
          #     The operator to filter by.
          # @!attribute [rw] value
          #   @return [::Google::Cloud::Firestore::V1::Value]
          #     The value to compare to.
          class FieldFilter
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # A field filter operator.
            module Operator
              # Unspecified. This value must not be used.
              OPERATOR_UNSPECIFIED = 0

              # The given `field` is less than the given `value`.
              #
              # Requires:
              #
              # * That `field` come first in `order_by`.
              LESS_THAN = 1

              # The given `field` is less than or equal to the given `value`.
              #
              # Requires:
              #
              # * That `field` come first in `order_by`.
              LESS_THAN_OR_EQUAL = 2

              # The given `field` is greater than the given `value`.
              #
              # Requires:
              #
              # * That `field` come first in `order_by`.
              GREATER_THAN = 3

              # The given `field` is greater than or equal to the given `value`.
              #
              # Requires:
              #
              # * That `field` come first in `order_by`.
              GREATER_THAN_OR_EQUAL = 4

              # The given `field` is equal to the given `value`.
              EQUAL = 5

              # The given `field` is an array that contains the given `value`.
              ARRAY_CONTAINS = 7

              # The given `field` is equal to at least one value in the given array.
              #
              # Requires:
              #
              # * That `value` is a non-empty `ArrayValue` with at most 10 values.
              # * No other `IN`, `ARRAY_CONTAINS_ANY`, or `NOT_IN`.
              IN = 8

              # The given `field` is an array that contains any of the values in the
              # given array.
              #
              # Requires:
              #
              # * That `value` is a non-empty `ArrayValue` with at most 10 values.
              # * No other `IN`, `ARRAY_CONTAINS_ANY`, or `NOT_IN`.
              ARRAY_CONTAINS_ANY = 9
            end
          end

          # A filter with a single operand.
          # @!attribute [rw] op
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::UnaryFilter::Operator]
          #     The unary operator to apply.
          # @!attribute [rw] field
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::FieldReference]
          #     The field to which to apply the operator.
          class UnaryFilter
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # A unary operator.
            module Operator
              # Unspecified. This value must not be used.
              OPERATOR_UNSPECIFIED = 0

              # The given `field` is equal to `NaN`.
              IS_NAN = 2

              # The given `field` is equal to `NULL`.
              IS_NULL = 3
            end
          end

          # A reference to a field, such as `max(messages.time) as max_time`.
          # @!attribute [rw] field_path
          #   @return [::String]
          class FieldReference
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # The projection of document's fields to return.
          # @!attribute [rw] fields
          #   @return [::Array<::Google::Cloud::Firestore::V1::StructuredQuery::FieldReference>]
          #     The fields to return.
          #
          #     If empty, all fields are returned. To only return the name
          #     of the document, use `['__name__']`.
          class Projection
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # An order on a field.
          # @!attribute [rw] field
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::FieldReference]
          #     The field to order by.
          # @!attribute [rw] direction
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::Direction]
          #     The direction to order by. Defaults to `ASCENDING`.
          class Order
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # A sort direction.
          module Direction
            # Unspecified.
            DIRECTION_UNSPECIFIED = 0

            # Ascending.
            ASCENDING = 1

            # Descending.
            DESCENDING = 2
          end
        end

        # A position in a query result set.
        # @!attribute [rw] values
        #   @return [::Array<::Google::Cloud::Firestore::V1::Value>]
        #     The values that represent a position, in the order they appear in
        #     the order by clause of a query.
        #
        #     Can contain fewer values than specified in the order by clause.
        # @!attribute [rw] before
        #   @return [::Boolean]
        #     If the position is just before or just after the given values, relative
        #     to the sort order defined by the query.
        class Cursor
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end
