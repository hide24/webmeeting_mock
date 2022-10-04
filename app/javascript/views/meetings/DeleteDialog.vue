<template>
  <div class="text-center">
    <v-dialog
      v-model="dialog"
      width="500"
      scrollable
    >
      <v-card>
        <v-card-title class="text-h5 grey lighten-2">
          会議の削除
        </v-card-title>

        <v-card-text>
          会議の登録を削除します。よろしいですか?
        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="secandary"
            tile
            @click="dialog = false"
          >
            キャンセル
          </v-btn>
          <v-btn
            color="error"
            tile
            @click="sendMeeting"
          >
            削除
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      meetingId: null,
      dialog: false,
    }
  },
  computed: {
  },
  methods: {
    open(meetingId) {
      this.meetingId = meetingId
      this.dialog = true
    },
    close() {
      this.dialog = false
    },
    sendMeeting() {
      this.$emit('deleteMeeting', this.meetingId)
      this.close()
    },
  },
}
</script>

<style scoped>
</style>
