#include "simple_io_manager.h"

SimpleIOManager::SimpleIOManager(std::string const &stream_path,
                                 std::string const &output_path,
                                 bool is_output_enabled)
    : simple_reader(SimpleReader(stream_path)),
      simple_writer(SimpleWriter(output_path)),
      is_output_enabled(is_output_enabled) {}

uint64_t SimpleIOManager::read_stream_start_time() {
  if (!simple_reader.has_metadata()) {
    simple_reader.fetch_metadata();
  }
  return simple_reader.get_stream_start_time();
}

uint64_t SimpleIOManager::read_stream_end_time() {
  if (!simple_reader.has_metadata()) {
    simple_reader.fetch_metadata();
  }
  return simple_reader.get_stream_end_time();
}

std::vector<std::shared_ptr<laser::util::Grounding>>
SimpleIOManager::read_stream_data(laser::util::Timeline &timeline) {
  auto data_vector = simple_reader.read_next_data(timeline.get_time());
  auto parsed_data = simple_parser.parse_data(timeline, data_vector);
  return parsed_data;
}

std::vector<std::shared_ptr<laser::util::Grounding>>
SimpleIOManager::read_background_data() {
  //    auto data_vector = simple_background_reader.read_all_data();
  //    return simple_parser.parse_data(data_vector);
  return std::vector<std::shared_ptr<laser::util::Grounding>>();
}

void SimpleIOManager::write_output_data(
    uint64_t time,
    std::vector<std::shared_ptr<laser::util::Grounding>> output_vector) {
  if (is_output_enabled) {
    latest_output = "";
    latest_output = simple_writer.format_output(time, std::move(output_vector));
    simple_writer.write_output(latest_output);
  }
}
