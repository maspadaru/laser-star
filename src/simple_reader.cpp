//
// Created by mike on 03/07/18.
//

#include "simple_reader.h"

SimpleReader::SimpleReader(std::string const &stream_path) {
    source.open(stream_path);
}

SimpleReader::~SimpleReader() { source.close(); }

bool SimpleReader::has_metadata() const {
    return false;
}

uint64_t SimpleReader::get_stream_start_time() const {
    return this->start_time;
}

uint64_t SimpleReader::get_stream_end_time() const {
    return this->end_time;
}

bool SimpleReader::read_line() {
    std::getline(source, latest_read_line);
    return source.good();
}

bool SimpleReader::is_valid_line(
        std::string key, std::string delimiter, std::string value) const {
    bool result = !key.empty() && !delimiter.empty() && !value.empty();
    const char delimiter_char = delimiter.front();
    result = result && delimiter_char == EXPECTED_LINE_DELIMITER;
    return result;
}

std::unordered_map<char, std::string> SimpleReader::parse_latest_line() const {
    std::unordered_map<char, std::string> result;
    std::stringstream line_stream(latest_read_line);
    std::string key;
    std::string delimiter;
    std::string value;
    line_stream >> key >> delimiter;
    std::getline(line_stream, value);
    if (!line_stream.fail() && is_valid_line(key, delimiter, value)) {
        result[LINE_KEY] = key;
        result[LINE_DELIMITER] = delimiter;
        result[LINE_VALUE] = value;
    }
    return result;
}

std::vector<std::string> SimpleReader::read_all_lines() {
    std::vector<std::string> result;
    while (read_line()) {
        auto line_map = parse_latest_line();
        if (!line_map.empty()) {
            result.push_back(line_map.at(LINE_VALUE));
        }
    }
    latest_read_line.clear();
    return result;
}

std::vector<std::string> SimpleReader::read_all_data() {
    return read_all_lines();
}

std::vector<std::string>
SimpleReader::read_next_data(uint64_t request_time_point) {
    std::vector<std::string> fact_vector;
    bool keep_going = true;
    while (keep_going) {

        /* When reading a line, the time point will be checked.
         * If the reader has read a line corresponding to the next time point
         * than it can conclude that all the input for the requested time point
         * has been read. Now it can return.
         * The first line in the input corresponding to the next time point,
         * that has just been read, will be kept in the latest_read_line variable
         * until read_next_data() is called again.
         */

        if (latest_read_line.empty()) {
            read_line();
        }
        auto line_map = parse_latest_line();
        if (line_map.empty()) {
            keep_going = false;
        } else {
            uint64_t input_time = stoull(line_map.at(LINE_KEY));
            if (input_time == request_time_point) {
                fact_vector.push_back(line_map[LINE_VALUE]);
                latest_read_line.clear();
            } else if (input_time > request_time_point) {
                keep_going = false;
            } else {
                // this should never happen, as it is already checked in
                // InputManager and Program. But let's check anyway
                throw laser::util::FormatException(
                        "SimpleReader: out-of-order read. Most likely do to bad "
                        "format of input source");
            }
        }
    }
    return fact_vector;
}

bool SimpleReader::fetch_metadata() {
    if (!has_metadata_m) {
        std::string nothing;
        source >> start_time;
        source >> end_time;
        std::getline(source, nothing, '\n');
        has_metadata_m = true;
    }
    return has_metadata_m;
}
