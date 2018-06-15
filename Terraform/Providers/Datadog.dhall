{-
Relevant functions for managing Dashboards on Datadog.

Example:
```
    let Datadog = ./dhall-terraform/Terraform/Providers/Datadog.dhall 

in  let T = Datadog.Timeboard

in  let ExtraFields = {}

in  let Graphs =
          { system_load =
                λ(_ : ExtraFields)
              → T.graph.timeseries
                "System Load"
                { autoscale =
                    T.autoscale True
                , custom_unit =
                    T.none Text
                , precision =
                    T.none Text
                , yaxis =
                    T.yaxis
                    { min =
                        T.some Double 0.0
                    , max =
                        T.some Double 1.2
                    , scale =
                        T.none Text
                    }
                , markers =
                    [ T.timeseriesMarkerLine
                      { dim =
                          "y"
                      , type =
                          "error dashed"
                      , value =
                          "y = 1.0"
                      , val =
                          1.0
                      , label =
                          T.none Text
                      }
                    ]
                , include_no_metric_hosts =
                    T.none Bool
                , include_ungrouped_hosts =
                    T.none Bool
                , events =
                    T.emptyTimeseriesEvents
                , text_align =
                    T.textAlign.none
                , aggregator =
                    T.aggregator.none
                }
                T.emptyTemplateVariables
                [ { q =
                      "sum:system.load.norm.5{\$host} by {host}"
                  , alias =
                      T.none Text
                  , aggregator =
                      T.aggregator.avg
                  , style =
                      T.defaultTimeseriesStyle
                  , type =
                      T.timeseriesType.line
                  , stacked =
                      T.none Bool
                  , change_type =
                      T.none Text
                  , compare_to =
                      T.none Text
                  , extra_col =
                      T.none Text
                  , increase_good =
                      T.none Bool
                  , order_by =
                      T.none Text
                  , order_dir =
                      T.none Text
                  , metadata =
                      T.defaultMetadata
                  }
                ]
          }

in  Datadog.root
    [ Datadog.timeboard
      "my-graph-id"
      { title =
          "System Load by Host"
      , description =
          "This is a sample timeboard"
      , read_only =
          True
      , graphs =
          [ Graphs.system_load ]
      }
    ]
```
-}
    let List/concat =
          https://ipfs.io/ipfs/QmdtKd5Q7tebdo6rXfZed4kN6DXmErRQHJ4PsNCtca9GbB/Prelude/List/concat 

in  let Aggregator =
          < none :
              Optional Text
          | sum :
              Text
          | avg :
              Text
          | min :
              Text
          | max :
              Text
          | last :
              Text
          | line :
              Text
          | count :
              Text
          >

in  let MetadataElem = { alias : Text }

in  let Metadata = { mapKey : Text, mapValue : MetadataElem }

in  let TemplateVariable =
          { name : Text, prefix : Text, default : Optional Text }

in  let TextAlign =
          < none : Optional Text | center : Text | left : Text | right : Text >

in  let YAxis =
          { min :
              Optional Double
          , max :
              Optional Double
          , scale :
              Optional Text
          }

in  let aggregator =
              let f = constructors Aggregator
          
          in  { none =
                  f.none ([] : Optional Text)
              , avg =
                  f.avg "avg"
              , sum =
                  f.sum "sum"
              , min =
                  f.min "min"
              , max =
                  f.max "max"
              , last =
                  f.last "last"
              , line =
                  f.line "line"
              , count =
                  f.line "count"
              }

in  let textAlign =
              let f = constructors TextAlign
          
          in  { none =
                  f.none ([] : Optional Text)
              , center =
                  f.center "center"
              , left =
                  f.left "left"
              , right =
                  f.right "right"
              }

in  let ChangeStyleType = < none : Optional Text >

in  let ChangeStyle =
          { width :
              Optional Text
          , palette :
              Optional Text
          , type :
              ChangeStyleType
          }

in  let ChangeType = < none : Optional Text | line : Text >

in  let ChangeRequest =
          { aggregator :
              Aggregator
          , extra_col :
              Optional Text
          , type :
              ChangeType
          , change_type :
              Optional Text
          , order_dir :
              Optional Text
          , compare_to :
              Optional Text
          , q :
              Text
          , increase_good :
              Optional Bool
          , order_by :
              Optional Text
          , style :
              Optional ChangeStyle
          }

in  let changeType =
              let f = constructors ChangeType
          
          in  { none = f.none ([] : Optional Text), line = f.line "line" }

in  let changeStyleType =
              let f = constructors ChangeStyleType
          
          in  { none = f.none ([] : Optional Text) }

in  let DistributionType =
          < none : Optional Text | area : Text | bars : Text | line : Text >

in  let DistributionStyleType = < none : Optional Text | solid : Text >

in  let DistributionStyle =
          { width :
              Optional Text
          , palette :
              Optional Text
          , type :
              DistributionStyleType
          }

in  let DistributionRequest =
          { aggregator :
              Aggregator
          , extra_col :
              Optional Text
          , change_type :
              Optional Text
          , order_dir :
              Optional Text
          , compare_to :
              Optional Text
          , q :
              Text
          , increase_good :
              Optional Bool
          , order_by :
              Optional Text
          , type :
              DistributionType
          , style :
              Optional DistributionStyle
          }

in  let distributionStyleType =
              let f = constructors DistributionStyleType
          
          in  { none = f.none ([] : Optional Text), solid = f.solid "solid" }

in  let distributionType =
              let f = constructors DistributionType
          
          in  { none =
                  f.none ([] : Optional Text)
              , area =
                  f.area "area"
              , bars =
                  f.bars "bars"
              , line =
                  f.line "line"
              }

in  let HeatmapStyleType = < none : Optional Text | solid : Text >

in  let HeatmapStyle =
          { palette :
              Optional Text
          , type :
              HeatmapStyleType
          , width :
              Optional Text
          }

in  let HeatmapType =
          < none : Optional Text | area : Text | bars : Text | line : Text >

in  let HeatmapRequest =
          { q :
              Text
          , aggregator :
              Aggregator
          , type :
              HeatmapType
          , style :
              Optional HeatmapStyle
          }

in  let heatmapStyleType =
              let f = constructors HeatmapStyleType
          
          in  { none = f.none ([] : Optional Text), solid = f.solid "solid" }

in  let heatmapType =
              let f = constructors HeatmapType
          
          in  { none =
                  f.none ([] : Optional Text)
              , area =
                  f.area "area"
              , bars =
                  f.bars "bars"
              , line =
                  f.line "line"
              , lines =
                  f.line "line"
              }

in  let HostmapRequestType =
          < none : Optional Text | fill : Text | size : Text >

in  let HostmapType = < none : Optional Text | fill : Text | size : Text >

in  let HostmapRequest =
          { q : Text, aggregator : Aggregator, type : HostmapType }

in  let HostmapStyle = {}

in  let hostmapRequestType =
              let f = constructors HostmapRequestType
          
          in  { none =
                  f.none ([] : Optional Text)
              , fill =
                  f.fill "fill"
              , size =
                  f.size "size"
              }

in  let hostmapType =
              let f = constructors HostmapType
          
          in  { none =
                  f.none ([] : Optional Text)
              , fill =
                  f.fill "fill"
              , size =
                  f.size "size"
              }

in  let ProcessRequest = {}

in  let QueryValueStyleType =
          < none :
              Optional Text
          | dashed :
              Text
          | dotted :
              Text
          | solid :
              Text
          >

in  let QueryValueStyle =
          { width :
              Optional Text
          , palette :
              Optional Text
          , type :
              QueryValueStyleType
          }

in  let QueryValueType =
          < none : Optional Text | area : Text | bars : Text | line : Text >

in  let QueryValueRequest =
          { aggregator :
              Aggregator
          , change_type :
              Optional Text
          , compare_to :
              Optional Text
          , extra_col :
              Optional Text
          , increase_good :
              Optional Bool
          , order_by :
              Optional Text
          , order_dir :
              Optional Text
          , q :
              Text
          , style :
              Optional QueryValueStyle
          , type :
              QueryValueType
          , metadata :
              List Metadata
          , stacked :
              Optional Bool
          }

in  let queryValueStyleType =
              let f = constructors QueryValueStyleType
          
          in  { none =
                  f.none ([] : Optional Text)
              , dashed =
                  f.dashed "dashed"
              , dotted =
                  f.dotted "dotted"
              , solid =
                  f.solid "solid"
              }

in  let queryValueType =
              let f = constructors QueryValueType
          
          in  { none =
                  f.none ([] : Optional Text)
              , area =
                  f.area "area"
              , bars =
                  f.bars "bars"
              , line =
                  f.line "line"
              }

in  let TimeseriesEvent = { q : Text, tags_execution : Optional Text }

in  let TimeseriesEventExecution = < and : Text >

in  let TimeseriesMarkerLine =
          { dim :
              Text
          , type :
              Text
          , value :
              Text
          , label :
              Optional Text
          , val :
              Double
          }

in  let TimeseriesMarkerRange =
          { dim :
              Text
          , type :
              Text
          , value :
              Text
          , label :
              Optional Text
          , min :
              Optional Double
          , max :
              Optional Double
          }

in  let TimeseriesMarker =
          < line : TimeseriesMarkerLine | range : TimeseriesMarkerRange >

in  let TimeseriesType =
          < area : Text | bars : Text | line : Text | none : Optional Text >

in  let TimeseriesStyleType =
          < none :
              Optional Text
          | line :
              Text
          | solid :
              Text
          | dashed :
              Text
          | dotted :
              Text
          >

in  let TimeseriesStyle =
          { width :
              Optional Text
          , palette :
              Optional Text
          , type :
              TimeseriesStyleType
          }

in  let TimeseriesRequest =
          { q :
              Text
          , alias :
              Optional Text
          , aggregator :
              Aggregator
          , style :
              Optional TimeseriesStyle
          , type :
              TimeseriesType
          , stacked :
              Optional Bool
          , change_type :
              Optional Text
          , compare_to :
              Optional Text
          , extra_col :
              Optional Text
          , increase_good :
              Optional Bool
          , order_by :
              Optional Text
          , order_dir :
              Optional Text
          , metadata :
              List Metadata
          }

in  let timeseriesEventExecution =
          let f = constructors TimeseriesEventExecution in { and = f.and "and" }

in  let timeseriesStyleType =
              let f = constructors TimeseriesStyleType
          
          in  { none =
                  f.none ([] : Optional Text)
              , line =
                  f.line "line"
              , solid =
                  f.solid "solid"
              , dashed =
                  f.dashed "dashed"
              , dotted =
                  f.dotted "dotted"
              }

in  let timeseriesType =
              let f = constructors TimeseriesType
          
          in  { area =
                  f.area "area"
              , bars =
                  f.bars "bars"
              , line =
                  f.line "line"
              , none =
                  f.none ([] : Optional Text)
              }

in  let ToplistType =
          < none : Optional Text | area : Text | bars : Text | line : Text >

in  let ToplistStyleType =
          < none :
              Optional Text
          | dashed :
              Text
          | dotted :
              Text
          | solid :
              Text
          >

in  let ToplistStyle =
          { width :
              Optional Text
          , palette :
              Optional Text
          , type :
              ToplistStyleType
          }

in  let ToplistRequest =
          { aggregator :
              Aggregator
          , q :
              Text
          , style :
              Optional ToplistStyle
          , type :
              ToplistType
          }

in  let toplistStyleType =
              let f = constructors ToplistStyleType
          
          in  { none =
                  f.none ([] : Optional Text)
              , dashed =
                  f.dashed "dashed"
              , dotted =
                  f.dotted "dotted"
              , solid =
                  f.solid "solid"
              }

in  let toplistType =
              let f = constructors ToplistType
          
          in  { none =
                  f.none ([] : Optional Text)
              , area =
                  f.area "area"
              , bars =
                  f.bars "bars"
              , line =
                  f.line "line"
              }

in  let TreemapRequest = { q : Text }

in  let Graph =
          < change :
              { title :
                  Text
              , autoscale :
                  Optional Bool
              , request :
                  List ChangeRequest
              , viz :
                  Text
              }
          | distribution :
              { title :
                  Text
              , autoscale :
                  Optional Bool
              , request :
                  List DistributionRequest
              , viz :
                  Text
              }
          | heatmap :
              { title : Text, request : List HeatmapRequest, viz : Text }
          | hostmap :
              { title :
                  Text
              , request :
                  List HostmapRequest
              , viz :
                  Text
              , style :
                  Optional HostmapStyle
              , group :
                  Optional (List Text)
              , scope :
                  Optional (List Text)
              , include_no_metric_hosts :
                  Optional Bool
              , include_ungrouped_hosts :
                  Optional Bool
              , nodeType :
                  Optional Text
              }
          | process :
              { title : Text, request : List ProcessRequest, viz : Text }
          | query_value :
              { title :
                  Text
              , request :
                  List QueryValueRequest
              , aggregator :
                  Aggregator
              , viz :
                  Text
              , autoscale :
                  Optional Bool
              , custom_unit :
                  Optional Text
              , precision :
                  Optional Text
              , text_align :
                  TextAlign
              , markers :
                  List TimeseriesMarker
              , events :
                  List TimeseriesEvent
              , yaxis :
                  Optional YAxis
              , include_no_metric_hosts :
                  Optional Bool
              , include_ungrouped_hosts :
                  Optional Bool
              }
          | timeseries :
              { title :
                  Text
              , request :
                  List TimeseriesRequest
              , viz :
                  Text
              , autoscale :
                  Optional Bool
              , custom_unit :
                  Optional Text
              , precision :
                  Optional Text
              , yaxis :
                  Optional YAxis
              , markers :
                  List TimeseriesMarker
              , include_no_metric_hosts :
                  Optional Bool
              , include_ungrouped_hosts :
                  Optional Bool
              , events :
                  List TimeseriesEvent
              , text_align :
                  TextAlign
              , aggregator :
                  Aggregator
              }
          | toplist :
              { title :
                  Text
              , request :
                  List ToplistRequest
              , viz :
                  Text
              , autoscale :
                  Optional Bool
              , custom_unit :
                  Optional Text
              , precision :
                  Optional Text
              , text_align :
                  TextAlign
              , yaxis :
                  Optional YAxis
              }
          | treemap :
              { title :
                  Text
              , request :
                  List TreemapRequest
              , viz :
                  Text
              , q :
                  Text
              , size_by :
                  Text
              , color_by :
                  Text
              , group_by :
                  Text
              }
          >

in  let graph =
              let f = constructors Graph
          
          in  { change =
                    λ(title : Text)
                  → λ(opts : { autoscale : Optional Bool })
                  → λ(variables : List TemplateVariable)
                  → λ(requests : List ChangeRequest)
                  → f.change
                    { title =
                        title
                    , autoscale =
                        opts.autoscale
                    , request =
                        requests
                    , viz =
                        "change"
                    }
              , distribution =
                    λ(title : Text)
                  → λ(opts : { autoscale : Optional Bool })
                  → λ(variables : List TemplateVariable)
                  → λ(requests : List DistributionRequest)
                  → f.distribution
                    { title =
                        title
                    , autoscale =
                        opts.autoscale
                    , request =
                        requests
                    , viz =
                        "distribution"
                    }
              , heatmap =
                    λ(title : Text)
                  → λ ( opts
                      : { autoscale :
                            Optional Bool
                        , events :
                            List TimeseriesEvent
                        , markers :
                            List TimeseriesMarker
                        , yaxis :
                            Optional YAxis
                        }
                      )
                  → λ(variables : List TemplateVariable)
                  → λ(requests : List HeatmapRequest)
                  → f.heatmap
                    { title = title, request = requests, viz = "heatmap" }
              , hostmap =
                    λ(title : Text)
                  → λ ( opts
                      : { style :
                            Optional HostmapStyle
                        , group :
                            Optional (List Text)
                        , scope :
                            Optional (List Text)
                        , include_no_metric_hosts :
                            Optional Bool
                        , include_ungrouped_hosts :
                            Optional Bool
                        , nodeType :
                            Optional Text
                        }
                      )
                  → λ(variables : List TemplateVariable)
                  → λ(requests : List HostmapRequest)
                  → f.hostmap
                    { title =
                        title
                    , request =
                        requests
                    , viz =
                        "hostmap"
                    , style =
                        opts.style
                    , group =
                        opts.group
                    , scope =
                        opts.scope
                    , include_no_metric_hosts =
                        opts.include_no_metric_hosts
                    , include_ungrouped_hosts =
                        opts.include_ungrouped_hosts
                    , nodeType =
                        opts.nodeType
                    }
              , query_value =
                    λ(title : Text)
                  → λ ( opts
                      : { aggregator :
                            Aggregator
                        , autoscale :
                            Optional Bool
                        , custom_unit :
                            Optional Text
                        , precision :
                            Optional Text
                        , text_align :
                            TextAlign
                        , markers :
                            List TimeseriesMarker
                        , events :
                            List TimeseriesEvent
                        , yaxis :
                            Optional YAxis
                        , include_no_metric_hosts :
                            Optional Bool
                        , include_ungrouped_hosts :
                            Optional Bool
                        }
                      )
                  → λ(variables : List TemplateVariable)
                  → λ(requests : List QueryValueRequest)
                  → f.query_value
                    { title =
                        title
                    , request =
                        requests
                    , viz =
                        "query_value"
                    , aggregator =
                        opts.aggregator
                    , autoscale =
                        opts.autoscale
                    , custom_unit =
                        opts.custom_unit
                    , precision =
                        opts.precision
                    , text_align =
                        opts.text_align
                    , markers =
                        opts.markers
                    , events =
                        opts.events
                    , yaxis =
                        opts.yaxis
                    , include_no_metric_hosts =
                        opts.include_no_metric_hosts
                    , include_ungrouped_hosts =
                        opts.include_ungrouped_hosts
                    }
              , process =
                    λ(title : Text)
                  → λ(opts : {})
                  → λ(variables : List TemplateVariable)
                  → λ(requests : List ProcessRequest)
                  → f.process
                    { title = title, request = requests, viz = "process" }
              , timeseries =
                    λ(title : Text)
                  → λ ( opts
                      : { autoscale :
                            Optional Bool
                        , custom_unit :
                            Optional Text
                        , precision :
                            Optional Text
                        , yaxis :
                            Optional YAxis
                        , markers :
                            List TimeseriesMarker
                        , include_no_metric_hosts :
                            Optional Bool
                        , include_ungrouped_hosts :
                            Optional Bool
                        , events :
                            List TimeseriesEvent
                        , text_align :
                            TextAlign
                        , aggregator :
                            Aggregator
                        }
                      )
                  → λ(variables : List TemplateVariable)
                  → λ(requests : List TimeseriesRequest)
                  → f.timeseries
                    { title =
                        title
                    , request =
                        requests
                    , viz =
                        "timeseries"
                    , autoscale =
                        opts.autoscale
                    , custom_unit =
                        opts.custom_unit
                    , precision =
                        opts.precision
                    , yaxis =
                        opts.yaxis
                    , markers =
                        opts.markers
                    , include_no_metric_hosts =
                        opts.include_no_metric_hosts
                    , include_ungrouped_hosts =
                        opts.include_ungrouped_hosts
                    , events =
                        opts.events
                    , text_align =
                        opts.text_align
                    , aggregator =
                        opts.aggregator
                    }
              , toplist =
                    λ(title : Text)
                  → λ ( opts
                      : { autoscale :
                            Optional Bool
                        , custom_unit :
                            Optional Text
                        , precision :
                            Optional Text
                        , text_align :
                            TextAlign
                        , yaxis :
                            Optional YAxis
                        }
                      )
                  → λ(variables : List TemplateVariable)
                  → λ(requests : List ToplistRequest)
                  → f.toplist
                    { title =
                        title
                    , request =
                        requests
                    , viz =
                        "toplist"
                    , autoscale =
                        opts.autoscale
                    , custom_unit =
                        opts.custom_unit
                    , precision =
                        opts.precision
                    , text_align =
                        opts.text_align
                    , yaxis =
                        opts.yaxis
                    }
              , treemap =
                    λ(title : Text)
                  → λ ( opts
                      : { q :
                            Text
                        , size_by :
                            Text
                        , color_by :
                            Text
                        , group_by :
                            Text
                        }
                      )
                  → λ(variables : List TemplateVariable)
                  → λ(requests : List TreemapRequest)
                  → f.treemap
                    { title =
                        title
                    , request =
                        requests
                    , viz =
                        "treemap"
                    , q =
                        opts.q
                    , size_by =
                        opts.size_by
                    , color_by =
                        opts.color_by
                    , group_by =
                        opts.group_by
                    }
              }

in  let Timeboard =
          { title :
              Text
          , description :
              Text
          , read_only :
              Bool
          , graph :
              List Graph
          , template_variable :
              List TemplateVariable
          }

in  let timeboard =
          { autoscale =
              λ(value : Bool) → [ value ] : Optional Bool
          , defaultChangeStyle =
              [] : Optional ChangeStyle
          , defaultDistributionStyle =
              [] : Optional DistributionStyle
          , defaultHeatmapStyle =
              [] : Optional HeatmapStyle
          , defaultHostmapStyle =
              [] : Optional HostmapStyle
          , defaultQueryValueStyle =
              [] : Optional QueryValueStyle
          , defaultTimeseriesStyle =
              [] : Optional TimeseriesStyle
          , defaultToplistStyle =
              [] : Optional ToplistStyle
          , defaultMetadata =
              [] : List Metadata
          , distributionStyle =
                λ(value : DistributionStyle)
              → [ value ] : Optional DistributionStyle
          , distributionStyleType =
              distributionStyleType
          , distributionType =
              distributionType
          , emptyAutoscale =
              [] : Optional Bool
          , emptyDistributionStyle =
              [] : Optional DistributionStyle
          , emptyGraphs =
              [] : List Graph
          , emptyHostmapGroups =
              [] : Optional (List Text)
          , emptyHostmapScope =
              [] : Optional (List Text)
          , emptyTemplateVariables =
              [] : List TemplateVariable
          , emptyTimeseriesEvents =
              [] : List TimeseriesEvent
          , emptyTimeseriesMarkers =
              [] : List TimeseriesMarker
          , emptyYAxis =
              [] : Optional YAxis
          , changeStyle =
              λ(value : ChangeStyle) → [ value ] : Optional ChangeStyle
          , changeStyleType =
              changeStyleType
          , changeType =
              changeType
          , heatmapStyle =
              λ(value : HeatmapStyle) → [ value ] : Optional HeatmapStyle
          , heatmapStyleType =
              heatmapStyleType
          , heatmapType =
              heatmapType
          , hostmapGroups =
              λ(value : List Text) → [ value ] : Optional (List Text)
          , hostmapRequestType =
              hostmapRequestType
          , hostmapScope =
              λ(value : List Text) → [ value ] : Optional (List Text)
          , hostmapStyle =
              λ(value : HostmapStyle) → [ value ] : Optional HostmapStyle
          , hostmapType =
              hostmapType
          , queryValueStyle =
              λ(value : QueryValueStyle) → [ value ] : Optional QueryValueStyle
          , queryValueStyleType =
              queryValueStyleType
          , queryValueType =
              queryValueType
          , timeseriesEventExecution =
              timeseriesEventExecution
          , timeseriesMarkerLine =
                λ(value : TimeseriesMarkerLine)
              → (constructors TimeseriesMarker).line value
          , timeseriesMarkerRange =
                λ(value : TimeseriesMarkerRange)
              → (constructors TimeseriesMarker).range value
          , timeseriesStyle =
              λ(value : TimeseriesStyle) → [ value ] : Optional TimeseriesStyle
          , timeseriesStyleType =
              timeseriesStyleType
          , timeseriesType =
              timeseriesType
          , toplistStyle =
              λ(value : ToplistStyle) → [ value ] : Optional ToplistStyle
          , toplistStyleType =
              toplistStyleType
          , toplistType =
              toplistType
          , yaxis =
              λ(value : YAxis) → [ value ] : Optional YAxis
          , aggregator =
              aggregator
          , textAlign =
              textAlign
          , graph =
              graph
          , some =
              λ(T : Type) → λ(value : T) → [ value ] : Optional T
          , none =
              λ(T : Type) → [] : Optional T
          }

in  let TimeboardOpts =
            λ(ExtraFields : Type)
          → { title :
                Text
            , description :
                Text
            , read_only :
                Bool
            , graphs :
                List (ExtraFields → Graph)
            }

in  let buildTimeboard =
            λ(ExtraFields : Type)
          → λ(extraFields : ExtraFields)
          → λ(key : Text)
          → λ(opts : TimeboardOpts ExtraFields)
          → [   { mapKey =
                    key
                , mapValue =
                    { title =
                        opts.title
                    , description =
                        opts.description
                    , read_only =
                        opts.read_only
                    , graph =
                        List/fold
                        (ExtraFields → Graph)
                        opts.graphs
                        (List Graph)
                        (   λ(next : ExtraFields → Graph)
                          → λ(acc : List Graph)
                          → [ next extraFields ] # acc
                        )
                        ([] : List Graph)
                    , template_variable =
                        [] : List TemplateVariable
                    }
                }
              : { mapKey : Text, mapValue : Timeboard }
            ]

in  let buildMetaTimeboards =
            λ(ExtraFields : Type)
          →     let MetaParameters =
                      { titlePrefix :
                          Text
                      , titleSuffix :
                          Text
                      , keyPrefix :
                          Text
                      , keySuffix :
                          Text
                      , fields :
                          ExtraFields
                      }
            
            in    λ(extraFields : List MetaParameters)
                → λ(key : Text)
                → λ(opts : TimeboardOpts ExtraFields)
                → List/fold
                  MetaParameters
                  extraFields
                  (List { mapKey : Text, mapValue : Timeboard })
                  (   λ(next : MetaParameters)
                    → λ(acc : List { mapKey : Text, mapValue : Timeboard })
                    →   buildTimeboard
                        ExtraFields
                        next.fields
                        (next.keyPrefix ++ key ++ next.keySuffix)
                        (   opts
                          ⫽ { title =
                                    next.titlePrefix
                                ++  opts.title
                                ++  next.titleSuffix
                            }
                        )
                      # acc
                  )
                  ([] : List { mapKey : Text, mapValue : Timeboard })

in  { Timeboard =
        timeboard
    , root =
          λ(timeboards : List (List { mapKey : Text, mapValue : Timeboard }))
        → { provider =
              { datadog = { version = "~> 1.0" } }
          , resource =
              { datadog_timeboard =
                  List/concat { mapKey : Text, mapValue : Timeboard } timeboards
              }
          }
    , timeboard =
        buildTimeboard
    , buildMetaTimeboards =
        buildMetaTimeboards
    }
