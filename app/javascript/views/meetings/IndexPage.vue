<template>
  <v-container>
    <v-row justify="end">
      <v-col cols="2">
        <v-btn
          rounded
          color="success"
          small
          @click="openNewDialog"
        >
          <v-icon>mdi-plus</v-icon>
          Add a meeting
        </v-btn>
      </v-col>
    </v-row>

    <v-row>
      <v-col cols="12">
        <v-tabs
          v-model="selectedTab"
        >
          <v-tabs-slider color="blue"></v-tabs-slider>

          <v-tab
            v-for="(item, index) in tabs"
            :key="item"
            :class="selectedTab == index ? 'tab-active': 'tab'"
          >
            {{ item }}
          </v-tab>
        </v-tabs>

        <v-tabs-items v-model="selectedTab">
          <v-tab-item :key="0">
            <meeting-list :meetings="currentMeetings"
              @deleteMeeting="confirmDelete"
              @editMeeting="openEditDialog"
            ></meeting-list>
          </v-tab-item>
          <v-tab-item :key="1">
            <meeting-list :meetings="pastMeetings"
              @deleteMeeting="confirmDelete"
              @editMeeting="openEditDialog"
            ></meeting-list>
          </v-tab-item>
        </v-tabs-items>
        <v-overlay
          :value="loading"
          absolute
        >
          <v-progress-circular
            indeterminate
            size="64"
          ></v-progress-circular>
        </v-overlay>

      </v-col>
    </v-row>
    <meeting-dialog ref="dialog" :services="services" :currentService="currentService" @sendMeeting="reciveMeeting"></meeting-dialog>
    <delete-dialog ref="confirm" @deleteMeeting="deleteMeeting"></delete-dialog>
  </v-container>
</template>

<script>
import dayjs from 'dayjs'
import { MeetingApi, ExternalServiceApi } from 'services/ApiService'

import MeetingList from './MeetingList.vue'
import MeetingDialog from './MeetingDialog.vue'
import DeleteDialog from './DeleteDialog.vue'

export default {
  components: { MeetingList, MeetingDialog, DeleteDialog },
  data() {
    return {
      meetings: [],
      selectedTab: null,
      tabs: ['schedule', 'past'],
      loading: false,
      services: [],
      currentService: null,
      day: '',
    }
  },
  computed: {
    currentMeetings() {
      return this.meetings.filter(meeting => dayjs(meeting.end_at) > dayjs())
    },
    pastMeetings() {
      return this.meetings.filter(meeting => dayjs(meeting.end_at) <= dayjs())
    },
  },
  methods: {
    updateMeetings() {
      this.loading = true
      MeetingApi.getAll()
      .then( response => {
        this.meetings = response.data
        this.loading = false
      })
    },
    updateServices() {
      ExternalServiceApi.getAll()
      .then( response => {
        this.services = response.data
        this.currentService = this.services[1].service_name
      })
    },
    openNewDialog() {
      this.$refs.dialog.open({})
    },
    openEditDialog(meetingId) {
      const meeting = JSON.parse(JSON.stringify(this.meetings.find(m => m.id == meetingId)))
      this.$refs.dialog.open(meeting)
    },
    confirmDelete(meetingId) {
      this.$refs.confirm.open(meetingId)
    },
    reciveMeeting(meeting) {
      if(meeting.id) {
        this.updateMeeting(meeting)
      } else {
        this.createMeeting(meeting)
      }
    },
    createMeeting(meeting) {
      this.loading = true
      MeetingApi.create(meeting)
      .then( response => {
        this.updateMeetings()
        this.$toasted.show('Meeting was succesfully created.')
      })
      .catch( response => {
        this.$toasted.error('Error occurred.')
        this.loading = false
      })
    },
    updateMeeting(meeting) {
      this.loading = true
      MeetingApi.update(meeting)
      .then( response => {
        this.updateMeetings()
        this.$toasted.show('Meeting was succesfully updated.')
      })
      .catch( response => {
        this.$toasted.error('Error occurred.')
        this.loading = false
      })
    },
    deleteMeeting(meetingId) {
      this.loading = true
      MeetingApi.delete(meetingId)
      .then( response => {
        this.updateMeetings()
        this.$toasted.show('Meeting was succesfully deleted.')
      })
      .catch( response => {
        this.$toasted.error('Error occurred.')
        this.loading = false
      })
    },
  },
  mounted() {
    this.updateMeetings()
    this.updateServices()
  },
}
</script>

<style scoped>
.tab {
  background-color: #d0e0e0;
}
.tab-active {
  background-color: #f0f0f0;
}
</style>