# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140730135852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "display_name"
    t.string   "position"
    t.string   "team"
    t.string   "team_abbreviation"
    t.integer  "bye_week"
    t.integer  "overall_rank"
    t.integer  "position_rank"
    t.integer  "position_draft_position"
    t.integer  "overall_draft_position"
    t.string   "quarterback"
    t.string   "depth_chart_position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "season_projections", force: true do |t|
    t.integer  "player_id"
    t.integer  "year"
    t.float    "pass_completions"
    t.float    "pass_attempts"
    t.float    "pass_yards"
    t.float    "pass_touchdowns"
    t.float    "pass_interceptions"
    t.float    "rush_attempts"
    t.float    "rush_yards"
    t.float    "rush_touchdowns"
    t.float    "receive_receptions"
    t.float    "receive_yards"
    t.float    "receive_touchdowns"
    t.float    "field_goals_made"
    t.float    "field_goals_attempts"
    t.integer  "sos_qb_rank"
    t.float    "sos_qb_fpa"
    t.integer  "sos_rb_rank"
    t.float    "sos_rb_fpa"
    t.integer  "sos_wr_rank"
    t.float    "sos_wr_fpa"
    t.integer  "sos_te_rank"
    t.float    "sos_te_fpa"
    t.float    "extra_points_made"
    t.float    "fumbles"
    t.float    "fantasy_points"
    t.float    "fantasy_points_per_week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "season_projections", ["player_id"], name: "index_season_projections_on_player_id", using: :btree

  create_table "season_stats", force: true do |t|
    t.integer  "player_id"
    t.integer  "year"
    t.integer  "pass_completions"
    t.integer  "pass_attempts"
    t.float    "pass_completion_percent"
    t.integer  "pass_yards"
    t.float    "pass_yards_per_attempt"
    t.integer  "pass_touchdowns"
    t.integer  "pass_interceptions"
    t.float    "qb_rating"
    t.integer  "rush_attempts"
    t.integer  "rush_yards"
    t.float    "rush_yards_per_attempt"
    t.integer  "rush_touchdowns"
    t.integer  "receive_targets"
    t.integer  "receive_receptions"
    t.integer  "receive_yards"
    t.integer  "receive_touchdowns"
    t.float    "receive_completion_percent"
    t.integer  "receive_long"
    t.float    "receive_yards_per_target"
    t.float    "receive_yards_per_reception"
    t.integer  "field_goals_made"
    t.integer  "field_goals_attempts"
    t.float    "field_goals_percent"
    t.integer  "field_goals_long"
    t.integer  "extra_points_made"
    t.integer  "extra_points_attempts"
    t.integer  "defense_tackles_for_loss"
    t.integer  "defense_sacks"
    t.integer  "defense_qb_hits"
    t.integer  "defense_interceptions"
    t.integer  "defense_fumble_recoveries"
    t.integer  "defense_safeties"
    t.integer  "defense_touchdowns"
    t.integer  "defense_return_touchdowns"
    t.integer  "defense_points_allowed"
    t.integer  "snap_games_played"
    t.integer  "snap_snaps"
    t.float    "snap_snaps_per_game"
    t.float    "snap_percent"
    t.float    "snap_rush_percent"
    t.float    "snap_target_percent"
    t.float    "snap_reception_percent"
    t.float    "snap_touch_percent"
    t.float    "snap_util_percent"
    t.float    "snap_fantasy_points_percent"
    t.integer  "fumbles"
    t.integer  "fumbles_lost"
    t.float    "fantasy_points"
    t.float    "fantasy_points_per_week"
    t.integer  "fpa_qb_rank"
    t.float    "fpa_qb_fpa"
    t.integer  "fpa_rb_rank"
    t.float    "fpa_rb_fpa"
    t.integer  "fpa_wr_rank"
    t.float    "fpa_wr_fpa"
    t.integer  "fpa_te_rank"
    t.float    "fpa_te_fpa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "season_stats", ["player_id"], name: "index_season_stats_on_player_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "team"
    t.string   "team_abbreviation"
    t.integer  "bye_week"
    t.integer  "sos_qb_rank"
    t.float    "sos_qb_fpa"
    t.integer  "sos_rb_rank"
    t.float    "sos_rb_fpa"
    t.integer  "sos_wr_rank"
    t.float    "sos_wr_fpa"
    t.integer  "sos_te_rank"
    t.float    "sos_te_fpa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
