connection: "looker_workshop_globant"

include: "/views/*.view.lkml" # include all views in the views/ folder in this project

explore: sfpd_incidents {}
