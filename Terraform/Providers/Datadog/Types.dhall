    let TimeboardTypes =
              let Aggregator =
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
                    < none :
                        Optional Text
                    | center :
                        Text
                    | left :
                        Text
                    | right :
                        Text
                    >

          in  let YAxis =
                    { min :
                        Optional Double
                    , max :
                        Optional Double
                    , scale :
                        Optional Text
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

          in  let DistributionType =
                    < none :
                        Optional Text
                    | area :
                        Text
                    | bars :
                        Text
                    | line :
                        Text
                    >

          in  let DistributionStyleType =
                    < none : Optional Text | solid : Text >

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
                    < none :
                        Optional Text
                    | area :
                        Text
                    | bars :
                        Text
                    | line :
                        Text
                    >

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

          in  let HostmapRequestType =
                    < none : Optional Text | fill : Text | size : Text >

          in  let HostmapType =
                    < none : Optional Text | fill : Text | size : Text >

          in  let HostmapRequest =
                    { q : Text, aggregator : Aggregator, type : HostmapType }

          in  let HostmapStyle = {}

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
                    < none :
                        Optional Text
                    | area :
                        Text
                    | bars :
                        Text
                    | line :
                        Text
                    >

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
                        Optional (List Metadata)
                    , stacked :
                        Optional Bool
                    }

          in  let TimeseriesEvent = { q : Text, tags_execution : Optional Text }

          in  let TimeseriesEventExecution = < and : Text >

          in  let TimeseriesMarkerType =
                    < errorBold :
                        Text
                    | errorDashed :
                        Text
                    | errorSolid :
                        Text
                    | infoBold :
                        Text
                    | infoDashed :
                        Text
                    | infoSolid :
                        Text
                    | okBold :
                        Text
                    | okDashed :
                        Text
                    | okSolid :
                        Text
                    | warningBold :
                        Text
                    | warningDashed :
                        Text
                    | warningSolid :
                        Text
                    >

          in  let TimeseriesMarkerLine =
                    { type :
                        TimeseriesMarkerType
                    , value :
                        Text
                    , label :
                        Optional Text
                    }

          in  let TimeseriesMarkerRange =
                    { type :
                        TimeseriesMarkerType
                    , value :
                        Text
                    , label :
                        Optional Text
                    }

          in  let TimeseriesMarker =
                    < line :
                        TimeseriesMarkerLine
                    | range :
                        TimeseriesMarkerRange
                    >

          in  let TimeseriesType =
                    < area :
                        Text
                    | bars :
                        Text
                    | line :
                        Text
                    | none :
                        Optional Text
                    >

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
                        Optional (List Metadata)
                    }

          in  let ToplistType =
                    < none :
                        Optional Text
                    | area :
                        Text
                    | bars :
                        Text
                    | line :
                        Text
                    >

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
                        { title :
                            Text
                        , request :
                            List HeatmapRequest
                        , viz :
                            Text
                        }
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
                        { title :
                            Text
                        , request :
                            List ProcessRequest
                        , viz :
                            Text
                        }
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
                        , marker :
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
                        , marker :
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

          in  { Aggregator =
                  Aggregator
              , MetadataElem =
                  MetadataElem
              , Metadata =
                  Metadata
              , TemplateVariable =
                  TemplateVariable
              , TextAlign =
                  TextAlign
              , YAxis =
                  YAxis
              , ChangeStyleType =
                  ChangeStyleType
              , ChangeStyle =
                  ChangeStyle
              , ChangeType =
                  ChangeType
              , ChangeRequest =
                  ChangeRequest
              , DistributionType =
                  DistributionType
              , DistributionStyleType =
                  DistributionStyleType
              , DistributionStyle =
                  DistributionStyle
              , DistributionRequest =
                  DistributionRequest
              , HeatmapStyleType =
                  HeatmapStyleType
              , HeatmapStyle =
                  HeatmapStyle
              , HeatmapType =
                  HeatmapType
              , HeatmapRequest =
                  HeatmapRequest
              , HostmapRequestType =
                  HostmapRequestType
              , HostmapType =
                  HostmapType
              , HostmapRequest =
                  HostmapRequest
              , HostmapStyle =
                  HostmapStyle
              , ProcessRequest =
                  ProcessRequest
              , QueryValueStyleType =
                  QueryValueStyleType
              , QueryValueStyle =
                  QueryValueStyle
              , QueryValueType =
                  QueryValueType
              , QueryValueRequest =
                  QueryValueRequest
              , TimeseriesEvent =
                  TimeseriesEvent
              , TimeseriesEventExecution =
                  TimeseriesEventExecution
              , TimeseriesMarkerType =
                  TimeseriesMarkerType
              , TimeseriesMarkerLine =
                  TimeseriesMarkerLine
              , TimeseriesMarkerRange =
                  TimeseriesMarkerRange
              , TimeseriesMarker =
                  TimeseriesMarker
              , TimeseriesType =
                  TimeseriesType
              , TimeseriesStyleType =
                  TimeseriesStyleType
              , TimeseriesStyle =
                  TimeseriesStyle
              , TimeseriesRequest =
                  TimeseriesRequest
              , ToplistType =
                  ToplistType
              , ToplistStyleType =
                  ToplistStyleType
              , ToplistStyle =
                  ToplistStyle
              , ToplistRequest =
                  ToplistRequest
              , TreemapRequest =
                  TreemapRequest
              , Graph =
                  Graph
              , Timeboard =
                  Timeboard
              }

in  let MonitorTypes =
              let ThresholdType =
                    { ok :
                        Optional Double
                    , warning :
                        Optional Double
                    , critical :
                        Optional Double
                    , warning_recovery :
                        Optional Double
                    , critical_recovery :
                        Optional Double
                    }

          in  let Monitor =
                    { name :
                        Text
                    , message :
                        Text
                    , escalation_message :
                        Optional Text
                    , query :
                        Text
                    , type :
                        Text
                    , thresholds :
                        List ThresholdType
                    , notify_no_data :
                        Optional Bool
                    , new_host_delay :
                        Optional Natural
                    , evaluation_delay :
                        Optional Natural
                    , no_data_timeframe :
                        Optional Natural
                    , renotify_interval :
                        Optional Natural
                    , notify_audit :
                        Optional Natural
                    , timeout_h :
                        Optional Natural
                    , require_full_window :
                        Optional Bool
                    , locked :
                        Optional Bool
                    , silenced :
                        Optional Natural
                    , include_tags :
                        Optional Bool
                    , tags :
                        List Text
                    }

          in  { Monitor = Monitor, ThresholdType = ThresholdType }

in  TimeboardTypes ∧ MonitorTypes
