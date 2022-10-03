<template>
  <v-container>
    <v-row justify="end">
      <v-col cols="2">
        <v-btn
          rounded
          color="success"
          small
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
            <meeting-list :meetings="currentMeetings"></meeting-list>
          </v-tab-item>
          <v-tab-item :key="1">
            <meeting-list :meetings="pastMeetings"></meeting-list>
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
  </v-container>
</template>

<script>
import dayjs from 'dayjs'
import { MeetingApi } from 'services/ApiService'

import MeetingList from './MeetingList.vue'

export default {
  components: { MeetingList },
  data() {
    return {
      meetings: [],
      selectedTab: null,
      tabs: ['schedule', 'past'],
      loading: false,
    }
  },
  computed: {
    currentMeetings() {
      return this.meetings.filter(meeting => dayjs(meeting.end_at) <= dayjs())
    },
    pastMeetings() {
      return this.meetings.filter(meeting => dayjs(meeting.end_at) > dayjs())
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
  },
  mounted() {
    this.updateMeetings()
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