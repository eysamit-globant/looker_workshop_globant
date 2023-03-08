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

  dimension: location {
    type: location
    sql_latitude:  ${latitude};;
    sql_longitude: ${longitude} ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [raw,
      time,
      day_of_month,
      day_of_week,
      hour,
      date,
      week,
      month,
      year,
      quarter]
    sql: ${TABLE}.timestamp ;;
  }

  measure: stolen_vehicules {
    type: sum
    sql: CASE WHEN strpos(${descript}, "STOLEN AUTOMOBILE") > 0 THEN 1 ELSE O END ;;
  }

  measure: theft_vehicules {
    type: sum
    sql: CASE WHEN strpos(${descript}, "THEFT FROM LOCKED AUTO") > 0 THEN 1 ELSE O END ;;
  }

}
