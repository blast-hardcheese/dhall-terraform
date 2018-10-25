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
                          T.timeseriesMarkerType.errorDashed
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
          https://raw.githubusercontent.com/dhall-lang/Prelude/e44284bc37a5808861dacd4c8bd13d18411cb961/List/concat

in  let Types = ./Datadog/Types.dhall

in  let timeboard =
              let aggregator =
                        let f = constructors Types.Aggregator

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
                        let f = constructors Types.TextAlign

                    in  { none =
                            f.none ([] : Optional Text)
                        , center =
                            f.center "center"
                        , left =
                            f.left "left"
                        , right =
                            f.right "right"
                        }

          in  let changeType =
                        let f = constructors Types.ChangeType

                    in  { none =
                            f.none ([] : Optional Text)
                        , line =
                            f.line "line"
                        }

          in  let changeStyleType =
                        let f = constructors Types.ChangeStyleType

                    in  { none = f.none ([] : Optional Text) }

          in  let distributionStyleType =
                        let f = constructors Types.DistributionStyleType

                    in  { none =
                            f.none ([] : Optional Text)
                        , solid =
                            f.solid "solid"
                        }

          in  let distributionType =
                        let f = constructors Types.DistributionType

                    in  { none =
                            f.none ([] : Optional Text)
                        , area =
                            f.area "area"
                        , bars =
                            f.bars "bars"
                        , line =
                            f.line "line"
                        }

          in  let heatmapStyleType =
                        let f = constructors Types.HeatmapStyleType

                    in  { none =
                            f.none ([] : Optional Text)
                        , solid =
                            f.solid "solid"
                        }

          in  let heatmapType =
                        let f = constructors Types.HeatmapType

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

          in  let hostmapRequestType =
                        let f = constructors Types.HostmapRequestType

                    in  { none =
                            f.none ([] : Optional Text)
                        , fill =
                            f.fill "fill"
                        , size =
                            f.size "size"
                        }

          in  let hostmapType =
                        let f = constructors Types.HostmapType

                    in  { none =
                            f.none ([] : Optional Text)
                        , fill =
                            f.fill "fill"
                        , size =
                            f.size "size"
                        }

          in  let queryValueStyleType =
                        let f = constructors Types.QueryValueStyleType

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
                        let f = constructors Types.QueryValueType

                    in  { none =
                            f.none ([] : Optional Text)
                        , area =
                            f.area "area"
                        , bars =
                            f.bars "bars"
                        , line =
                            f.line "line"
                        }

          in  let timeseriesEventExecution =
                        let f = constructors Types.TimeseriesEventExecution

                    in  { and = f.and "and" }

          in  let timeseriesStyleType =
                        let f = constructors Types.TimeseriesStyleType

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

          in  let timeseriesMarkerType =
                        let f = constructors Types.TimeseriesMarkerType

                    in  { errorBold =
                            f.errorBold "error bold"
                        , errorDashed =
                            f.errorDashed "error dashed"
                        , errorSolid =
                            f.errorSolid "error solid"
                        , infoBold =
                            f.infoBold "info bold"
                        , infoDashed =
                            f.infoDashed "info dashed"
                        , infoSolid =
                            f.infoSolid "info solid"
                        , okBold =
                            f.okBold "ok bold"
                        , okDashed =
                            f.okDashed "ok dashed"
                        , okSolid =
                            f.okSolid "ok solid"
                        , warningBold =
                            f.warningBold "warning bold"
                        , warningDashed =
                            f.warningDashed "warning dashed"
                        , warningSolid =
                            f.warningSolid "warning solid"
                        }

          in  let timeseriesType =
                        let f = constructors Types.TimeseriesType

                    in  { area =
                            f.area "area"
                        , bars =
                            f.bars "bars"
                        , line =
                            f.line "line"
                        , none =
                            f.none ([] : Optional Text)
                        }

          in  let toplistStyleType =
                        let f = constructors Types.ToplistStyleType

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
                        let f = constructors Types.ToplistType

                    in  { none =
                            f.none ([] : Optional Text)
                        , area =
                            f.area "area"
                        , bars =
                            f.bars "bars"
                        , line =
                            f.line "line"
                        }

          in  let graph =
                        let f = constructors Types.Graph

                    in  { change =
                              λ(title : Text)
                            → λ(opts : { autoscale : Optional Bool })
                            → λ(variables : List Types.TemplateVariable)
                            → λ(requests : List Types.ChangeRequest)
                            → { graph =
                                  f.change
                                  { title =
                                      title
                                  , autoscale =
                                      opts.autoscale
                                  , request =
                                      requests
                                  , viz =
                                      "change"
                                  }
                              , vars =
                                  variables
                              }
                        , distribution =
                              λ(title : Text)
                            → λ(opts : { autoscale : Optional Bool })
                            → λ(variables : List Types.TemplateVariable)
                            → λ(requests : List Types.DistributionRequest)
                            → { graph =
                                  f.distribution
                                  { title =
                                      title
                                  , autoscale =
                                      opts.autoscale
                                  , request =
                                      requests
                                  , viz =
                                      "distribution"
                                  }
                              , vars =
                                  variables
                              }
                        , heatmap =
                              λ(title : Text)
                            → λ ( opts
                                : { autoscale :
                                      Optional Bool
                                  , events :
                                      List Types.TimeseriesEvent
                                  , markers :
                                      List Types.TimeseriesMarker
                                  , yaxis :
                                      Optional Types.YAxis
                                  }
                                )
                            → λ(variables : List Types.TemplateVariable)
                            → λ(requests : List Types.HeatmapRequest)
                            → { graph =
                                  f.heatmap
                                  { title =
                                      title
                                  , request =
                                      requests
                                  , viz =
                                      "heatmap"
                                  }
                              , vars =
                                  variables
                              }
                        , hostmap =
                              λ(title : Text)
                            → λ ( opts
                                : { style :
                                      Optional Types.HostmapStyle
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
                            → λ(variables : List Types.TemplateVariable)
                            → λ(requests : List Types.HostmapRequest)
                            → { graph =
                                  f.hostmap
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
                              , vars =
                                  variables
                              }
                        , query_value =
                              λ(title : Text)
                            → λ ( opts
                                : { aggregator :
                                      Types.Aggregator
                                  , autoscale :
                                      Optional Bool
                                  , custom_unit :
                                      Optional Text
                                  , precision :
                                      Optional Text
                                  , text_align :
                                      Types.TextAlign
                                  , markers :
                                      List Types.TimeseriesMarker
                                  , events :
                                      List Types.TimeseriesEvent
                                  , yaxis :
                                      Optional Types.YAxis
                                  , include_no_metric_hosts :
                                      Optional Bool
                                  , include_ungrouped_hosts :
                                      Optional Bool
                                  }
                                )
                            → λ(variables : List Types.TemplateVariable)
                            → λ(requests : List Types.QueryValueRequest)
                            → { graph =
                                  f.query_value
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
                                  , marker =
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
                              , vars =
                                  variables
                              }
                        , process =
                              λ(title : Text)
                            → λ(opts : {})
                            → λ(variables : List Types.TemplateVariable)
                            → λ(requests : List Types.ProcessRequest)
                            → { graph =
                                  f.process
                                  { title =
                                      title
                                  , request =
                                      requests
                                  , viz =
                                      "process"
                                  }
                              , vars =
                                  variables
                              }
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
                                      Optional Types.YAxis
                                  , markers :
                                      List Types.TimeseriesMarker
                                  , include_no_metric_hosts :
                                      Optional Bool
                                  , include_ungrouped_hosts :
                                      Optional Bool
                                  , events :
                                      List Types.TimeseriesEvent
                                  , text_align :
                                      Types.TextAlign
                                  , aggregator :
                                      Types.Aggregator
                                  }
                                )
                            → λ(variables : List Types.TemplateVariable)
                            → λ(requests : List Types.TimeseriesRequest)
                            → { graph =
                                  f.timeseries
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
                                  , marker =
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
                              , vars =
                                  variables
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
                                      Types.TextAlign
                                  , yaxis :
                                      Optional Types.YAxis
                                  }
                                )
                            → λ(variables : List Types.TemplateVariable)
                            → λ(requests : List Types.ToplistRequest)
                            → { graph =
                                  f.toplist
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
                              , vars =
                                  variables
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
                            → λ(variables : List Types.TemplateVariable)
                            → λ(requests : List Types.TreemapRequest)
                            → { graph =
                                  f.treemap
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
                              , vars =
                                  variables
                              }
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
                          List
                          (   ExtraFields
                            → { graph :
                                  Types.Graph
                              , vars :
                                  List Types.TemplateVariable
                              }
                          )
                      , template_variable :
                          List Types.TemplateVariable
                      }

          in  let buildTimeboard =
                      λ(ExtraFields : Type)
                    → λ(extraFields : ExtraFields)
                    → λ(key : Text)
                    → λ(opts : TimeboardOpts ExtraFields)
                    →     let meta =
                                List/fold
                                (   ExtraFields
                                  → { graph :
                                        Types.Graph
                                    , vars :
                                        List Types.TemplateVariable
                                    }
                                )
                                opts.graphs
                                (List Types.Graph)
                                (   λ ( next
                                      :   ExtraFields
                                        → { graph :
                                              Types.Graph
                                          , vars :
                                              List Types.TemplateVariable
                                          }
                                      )
                                  → λ(acc : List Types.Graph)
                                  →     let res = next extraFields

                                    in  [ res.graph ] # acc
                                )
                                ([] : List Types.Graph)

                      in  [   { mapKey =
                                  key
                              , mapValue =
                                  { title =
                                      opts.title
                                  , description =
                                      opts.description
                                  , read_only =
                                      opts.read_only
                                  , graph =
                                      meta
                                  , template_variable =
                                      opts.template_variable
                                  }
                              }
                            : { mapKey : Text, mapValue : Types.Timeboard }
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
                            (List { mapKey : Text, mapValue : Types.Timeboard })
                            (   λ(next : MetaParameters)
                              → λ ( acc
                                  : List
                                    { mapKey :
                                        Text
                                    , mapValue :
                                        Types.Timeboard
                                    }
                                  )
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
                            ( [] : List
                                   { mapKey : Text, mapValue : Types.Timeboard }
                            )

          in  { autoscale =
                  λ(value : Bool) → [ value ] : Optional Bool
              , buildTimeboard =
                  buildTimeboard
              , buildMetaTimeboards =
                  buildMetaTimeboards
              , defaultChangeStyle =
                  [] : Optional Types.ChangeStyle
              , defaultDistributionStyle =
                  [] : Optional Types.DistributionStyle
              , defaultHeatmapStyle =
                  [] : Optional Types.HeatmapStyle
              , defaultHostmapStyle =
                  [] : Optional Types.HostmapStyle
              , defaultQueryValueStyle =
                  [] : Optional Types.QueryValueStyle
              , defaultTimeseriesStyle =
                  [] : Optional Types.TimeseriesStyle
              , defaultToplistStyle =
                  [] : Optional Types.ToplistStyle
              , defaultMetadata =
                  [] : Optional (List Types.Metadata)
              , distributionStyle =
                    λ(value : Types.DistributionStyle)
                  → [ value ] : Optional Types.DistributionStyle
              , distributionStyleType =
                  distributionStyleType
              , distributionType =
                  distributionType
              , emptyAutoscale =
                  [] : Optional Bool
              , emptyDistributionStyle =
                  [] : Optional Types.DistributionStyle
              , emptyGraphs =
                  [] : List Types.Graph
              , emptyHostmapGroups =
                  [] : Optional (List Text)
              , emptyHostmapScope =
                  [] : Optional (List Text)
              , emptyTemplateVariables =
                  [] : List Types.TemplateVariable
              , emptyTimeseriesEvents =
                  [] : List Types.TimeseriesEvent
              , emptyTimeseriesMarkers =
                  [] : List Types.TimeseriesMarker
              , emptyYAxis =
                  [] : Optional Types.YAxis
              , changeStyle =
                    λ(value : Types.ChangeStyle)
                  → [ value ] : Optional Types.ChangeStyle
              , changeStyleType =
                  changeStyleType
              , changeType =
                  changeType
              , heatmapStyle =
                    λ(value : Types.HeatmapStyle)
                  → [ value ] : Optional Types.HeatmapStyle
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
                    λ(value : Types.HostmapStyle)
                  → [ value ] : Optional Types.HostmapStyle
              , hostmapType =
                  hostmapType
              , queryValueStyle =
                    λ(value : Types.QueryValueStyle)
                  → [ value ] : Optional Types.QueryValueStyle
              , queryValueStyleType =
                  queryValueStyleType
              , queryValueType =
                  queryValueType
              , timeseriesEventExecution =
                  timeseriesEventExecution
              , timeseriesMarkerLine =
                    λ(value : Types.TimeseriesMarkerLine)
                  → (constructors Types.TimeseriesMarker).line value
              , timeseriesMarkerRange =
                    λ(value : Types.TimeseriesMarkerRange)
                  → (constructors Types.TimeseriesMarker).range value
              , timeseriesStyle =
                    λ(value : Types.TimeseriesStyle)
                  → [ value ] : Optional Types.TimeseriesStyle
              , timeseriesStyleType =
                  timeseriesStyleType
              , timeseriesType =
                  timeseriesType
              , timeseriesMarkerType =
                  timeseriesMarkerType
              , toplistStyle =
                    λ(value : Types.ToplistStyle)
                  → [ value ] : Optional Types.ToplistStyle
              , toplistStyleType =
                  toplistStyleType
              , toplistType =
                  toplistType
              , yaxis =
                  λ(value : Types.YAxis) → [ value ] : Optional Types.YAxis
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
              , var =
                    λ(name : Text)
                  → λ(prefix : Text)
                  → { name =
                        name
                    , prefix =
                        prefix
                    , default =
                        [] : Optional Text
                    }
              , dvar =
                    λ(name : Text)
                  → λ(prefix : Text)
                  → λ(default : Text)
                  → { name =
                        name
                    , prefix =
                        prefix
                    , default =
                        [ default ] : Optional Text
                    }
              }

in  let monitor =
              let buildMonitor =
                      λ(name : Text)
                    → λ(opts : { message : Text, query : Text, type : Text })
                    → { name =
                          name
                      , message =
                          opts.message
                      , query =
                          opts.query
                      , type =
                          opts.type
                      , tags =
                          [] : List Text
                      , thresholds =
                          [] : List Types.ThresholdType
                      , escalation_message =
                          None Text
                      , notify_no_data =
                          None Bool
                      , new_host_delay =
                          None Natural
                      , evaluation_delay =
                          None Natural
                      , no_data_timeframe =
                          None Natural
                      , renotify_interval =
                          None Natural
                      , notify_audit =
                          None Natural
                      , timeout_h =
                          None Natural
                      , require_full_window =
                          None Bool
                      , locked =
                          None Bool
                      , silenced =
                          None Natural
                      , include_tags =
                          None Bool
                      }

          in  let monitors =
                      λ(monitors : List Types.Monitor)
                    →     let a = Types.Monitor

                      in  let list =
                                List { mapKey : Text, mapValue : Types.Monitor }

                      in  List/fold
                          a
                          monitors
                          list
                          (   λ(next : a)
                            → λ(acc : list)
                            → [ { mapKey = next.name, mapValue = next } ] # acc
                          )

          in  { emptyMonitors =
                  [] : List (List { mapKey : Text, mapValue : Types.Monitor })
              , buildMonitor =
                  buildMonitor
              , monitors =
                  monitors
              }

in  { Monitor =
        monitor
    , Timeboard =
        timeboard
    , root =
          λ ( timeboards
            : List (List { mapKey : Text, mapValue : Types.Timeboard })
            )
        → { provider =
              { datadog = { version = "~> 1.0" } }
          , resource =
              { datadog_timeboard =
                  List/concat
                  { mapKey : Text, mapValue : Types.Timeboard }
                  timeboards
              }
          }
    }
