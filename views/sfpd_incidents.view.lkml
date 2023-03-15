view: sfpd_incidents {

  sql_table_name: `looker_workshop.sfpd_incidents` ;;

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: dayofweek {
    type: string
    sql: ${TABLE}.dayofweek ;;
  }

  dimension: descript {
    type: string
    sql: ${TABLE}.descript ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: location_incidents {
    type: location
    sql_latitude:${latitude} ;;
    sql_longitude:${longitude} ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: pddistrict {
    type: string
    sql: ${TABLE}.pddistrict ;;
  }

  dimension: pdid {
    type: number
    value_format_name: id
    sql: ${TABLE}.pdid ;;
  }

  dimension: resolution {
    type: string
    sql: ${TABLE}.resolution ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  measure: stolen_vehicules {
    type: sum
    sql: CASE WHEN strpos(${descript}, "STOLEN AUTOMOBILE") > 0 THEN 1 ELSE 0 END ;;
  }

  measure: theft_vehicules {
    type: sum
    sql: CASE WHEN strpos(${descript}, "THEFT FROM LOCKED AUTO")> 0 THEN 1 ELSE 0 END ;;
  }


}
