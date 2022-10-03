<template>
  <div class="text-center">
    <v-dialog
      v-model="dialog"
      width="800"
      scrollable
    >
      <v-card>
        <v-card-title class="text-h5 grey lighten-2">
          Schedule new metting
        </v-card-title>

        <v-tabs
          v-model="tab"
          background-color="blue lighten-2"
          dark
        >
          <v-tab
            v-for="service in services"
            :key="service.service_name"
          >
            {{ service.service_name }}
          </v-tab>
        </v-tabs>

        <v-card-text>
          <v-row dense>
            <v-col
              cols="12"
            >
              <div class="h5">Title</div>

              <v-text-field
                dense
                outlined
                v-model="meeting.title"
              ></v-text-field>
            </v-col>
          </v-row>
          <v-row dense class="mt-n3">
            <v-col
              cols="12"
            >
              <div class="h5">Member</div>

              <v-text-field
                dense
                outlined
                v-model="meeting.user_ids"
              ></v-text-field>
            </v-col>
          </v-row>
          <v-row dense class="mt-n3">
            <v-col cols="4">
              <div class="h5">Date</div>

              <v-menu
                v-model="datePicker"
                :close-on-content-click="false"
                :nudge-right="40"
                transition="scale-transition"
                offset-y
                min-width="auto"
              >
                <template v-slot:activator="{ on, attrs }">
                  <v-text-field
                    v-model="startDate"
                    dense
                    outlined
                    prepend-inner-icon="mdi-calendar-range"
                    readonly
                    v-bind="attrs"
                    v-on="on"
                  ></v-text-field>
                </template>
                <v-date-picker
                  no-title
                  v-model="startDate"
                  @input="datePicker = false"
                ></v-date-picker>
              </v-menu>
            </v-col>

            <v-col cols="4">
              <div class="h5">Time</div>

              <div class="timepicker">
                <vue-timepicker
                  hour-label="Hour"
                  minute-label="Minite"
                  close-on-complete
                  hide-clear-button
                  input-width="12em"
                  v-model="startTime"
                ></vue-timepicker>
              </div>
            </v-col>

            <v-col cols="4">
              <div class="h5">Period</div>

              <div class="timepicker">
                <vue-timepicker
                  hour-label="Hour"
                  minute-label="Minite"
                  close-on-complete
                  hide-clear-button
                  input-width="12em"
                  :minute-interval="15"
                  v-model="priod"
                ></vue-timepicker>
              </div>
            </v-col>
            </v-col>
          </v-row>
          <v-row dense class="mt-n3">
            <v-col
              cols="12"
            >
              <div class="h5">Description</div>

              <v-textarea
                dense
                outlined
                v-model="meeting.description"
              ></v-textarea>
            </v-col>
          </v-row>
        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="secandary"
            tile
            @click="dialog = false"
          >
            Cancel
          </v-btn>
          <v-btn
            color="primary"
            tile
            @click="sendMeeting"
          >
            Schedule
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
  import dayjs from 'dayjs'
  import VueTimepicker from 'vue2-timepicker'
  import 'vue2-timepicker/dist/VueTimepicker.css'

  export default {
    components: { VueTimepicker },
    props: {
      services: {
        type: Array,
        required: true,
      },
      currentService: {
        type: String,
      },
    },
    data() {
      return {
        dialog: false,
        meeting: {
        },
        tab: 0,
        datePicker: false,
        startDate: null,
        startTime: '',
        priod: '',
      }
    },
    computed: {
    },
    methods: {
      open(meeting) {
        this.meeting = meeting || {}
        this.startDate = null
        this.startTime = '00:00'
        this.priod = '00:00'
        if(meeting.external_service_id) {
          this.tab = this.services.findIndex(s => s.id == meeting.external_service_id)
        } else {
          this.tab = this.services.findIndex(s => s.service_name == this.currentService)
        }
        if(meeting.start_at) {
          const startAt = dayjs(meeting.start_at)
          this.startDate = startAt.format('YYYY-MM-DD')
          this.startTime = startAt.format('hh:MM')
          if(meeting.end_at) {
            const endAt = dayjs(meeting.end_at)
            const timeDiff = endAt.diff(startAt, 'm')
            const hour = ('00' + timeDiff / 60).slice(-2)
            const min = ('00' + timeDiff % 60).slice(-2)
            this.priod = `${hour}:${min}`
          }
        }
        this.dialog = true
      },
      close() {
        this.dialog = false
      },
      startAt() {
        return dayjs(this.startDate + ' ' + this.startTime)
      },
      endAt() {
        const priods = this.priod.split(':')
        return this.startAt().add(priods[0], 'h').add(priods[1], 'm') 
      },
      serviceId() {
        return this.services[this.tab].id
      },
      sendMeeting() {
        this.meeting.external_service_id = this.serviceId()
        this.meeting.start_at = this.startAt().format()
        this.meeting.end_at = this.endAt().format()
        this.$emit('sendMeeting', this.meeting)
        this.close()
      },
    },
  }
</script>

<style scoped>
.timepicker >>> input {
  height: 3.3em;
  margin-top: -5px;
  outline: thick;
  border-radius: 4px;
}
.timepicker >>> .vue__time-picker .dropdown ul li:not([disabled]).active,
.timepicker >>> .vue__time-picker .dropdown ul li:not([disabled]).active:focus,
.timepicker >>> .vue__time-picker .dropdown ul li:not([disabled]).active:hover {
  background-color: blue;
}
</style>
