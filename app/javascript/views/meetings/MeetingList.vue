<template>
    <v-simple-table>
      <template v-slot:default>
        <thead>
          <tr>
            <th class="text-left">
              Title
            </th>
            <th class="text-left">
              Start at
            </th>
            <th class="text-left">
              End at
            </th>
            <th class="text-left">
              Operations
            </th>
          </tr>
        </thead>
        <tbody v-if="meetings.length < 1">
          no meetings was scheduled.
        </tbody>
        <tbody v-else>
          <tr
            v-for="item in meetings"
            :key="item.id"
          >
            <td>{{ item.title }}</td>
            <td>{{ item.start_at }}</td>
            <td>{{ item.end_at }}</td>
            <td>
              <v-btn
                rounded
                color="success"
                :disabled="past"
              >
                <v-icon>
                  mdi-play
                </v-icon>
                Start
              </v-btn>
            </td>
            <td>
              <v-btn
                rounded
                color="primary"
                @click="editButton(item.id)"
              >
                <v-icon>
                  mdi-file-document-edit-outline
                </v-icon>
                Edit
              </v-btn>
            </td>
            <td>
              <v-btn
                rounded
                color="error"
                @click="deleteButton(item.id)"
              >
                <v-icon>
                  mdi-trash-can-outline
                </v-icon>
                Delete
              </v-btn>
            </td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
</template>

<script>
export default {
  props: {
    meetings: {
      type: Array,
      required: true,
    },
    past: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
    }
  },
  methods: {
    editButton(id) {
      this.$emit('editMeeting', id)
    },
    deleteButton(id) {
      this.$emit('deleteMeeting', id)
    },
  },
}
</script>

<style scoped>
</style>