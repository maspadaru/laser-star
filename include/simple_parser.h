#ifndef SIMPLEAPP_SIMPLE_PARSER_H
#define SIMPLEAPP_SIMPLE_PARSER_H

#include <memory>
#include <string>
#include <vector>
#include <sstream>

#include <util/grounding.h>
#include <util/timeline.h>

class SimpleParser {
  private:
    uint64_t current_tuple_counter = 0;
    std::shared_ptr<laser::util::Grounding>
    parse_string(laser::util::Timeline const &timeline, std::string const &input);

  public:
    ~SimpleParser() = default;

    std::vector<std::shared_ptr<laser::util::Grounding>>
    parse_data(laser::util::Timeline &timeline,
               std::vector<std::string> const &raw_data_vector);
};

#endif // SIMPLEAPP_SIMPLE_PARSER_H
