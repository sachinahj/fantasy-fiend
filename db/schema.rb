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

ActiveRecord::Schema.define(version: 20140726054134) do

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "position"
    t.string   "team"
    t.string   "team_abbreviation"
    t.integer  "bye_week"
    t.integer  "rank"
    t.integer  "best_rank"
    t.integer  "worst_rank"
    t.float    "average_rank"
    t.float    "rank_standard_deviation"
    t.integer  "average_draft_position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qb_projections", force: true do |t|
    t.integer  "player_id"
    t.float    "pass_attempts"
    t.integer  "pass_attempts_high"
    t.integer  "pass_attempts_low"
    t.float    "pass_completions"
    t.integer  "pass_completions_high"
    t.integer  "pass_completions_low"
    t.float    "pass_yards"
    t.integer  "pass_yards_high"
    t.integer  "pass_yards_low"
    t.float    "pass_touchdowns"
    t.integer  "pass_touchdowns_high"
    t.integer  "pass_touchdowns_low"
    t.float    "pass_interceptions"
    t.integer  "pass_interceptions_high"
    t.integer  "pass_interceptions_low"
    t.float    "rush_attempts"
    t.integer  "rush_attempts_high"
    t.integer  "rush_attempts_low"
    t.float    "rush_yards"
    t.integer  "rush_yards_high"
    t.integer  "rush_yards_low"
    t.float    "rush_touchdowns"
    t.integer  "rush_touchdowns_high"
    t.integer  "rush_touchdowns_low"
    t.float    "fumbles"
    t.integer  "fumbles_high"
    t.integer  "fumbles_low"
    t.float    "fantasy_points"
    t.integer  "fantasy_points_high"
    t.integer  "fantasy_points_low"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
