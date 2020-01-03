#include <fstream>
#include <iostream>
#include <sstream>
#include <string>

#include <core/reasoner.h>
#include <rule/rule_parser.h>
#include <util/chase_algorithm.h>

#include "simple_io_manager.h"

std::string read_program(std::string const &program_path) {
    std::string result;
    std::ifstream f(program_path);
    if (f) {
        std::ostringstream ss;
        ss << f.rdbuf();
        result = ss.str();
    }
    return result;
}

void run(laser::util::ChaseAlgorithm chase_algorithm,
         std::string const &stream_path, std::string const &output_path,
         bool is_output_enabled, std::string const &rules) {
    laser::util::Settings::get_instance().set_chase_algorithm(chase_algorithm);
    auto simple_io_manager =
        SimpleIOManager(stream_path, output_path, is_output_enabled);
    auto rule_parser = laser::rule::RuleParser(rules);
    auto rule_vector = rule_parser.get_rules();
    auto reasoner = laser::core::Reasoner(rule_vector, &simple_io_manager);
    auto clock_start = std::chrono::high_resolution_clock::now();
    reasoner.start();
    auto clock_end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> clock_elapsed =
        clock_end - clock_start;
    auto total_facts = reasoner.get_total_facts_read();
    double total_ms = clock_elapsed.count();
    double throughput = (total_facts * 1.0) / (total_ms / 1000);
    std::cout << "Time: " << total_ms / 1000 << " seconds" << std::endl;
    std::cout << "Throughput: " << throughput << " facts / second " << std::endl;
    std::cout << "************************************************************"
              << std::endl;
    std::cout << std::endl;
}

int main(int argc, char **argv) {
    if (argc < 4) {
        std::cerr << "Usage: star CHASE_ALGORITHM=(S/R/I) PROGRAM_PATH "
                     "INPUT_PATH [OUTPUT_PATH]  "
                  << std::endl;
        return 1;
    }
    std::string chase_algorithm_str(argv[1]);
    std::string program_path(argv[2]);
    std::string stream_path(argv[3]);
    std::string output_path;
    bool is_output_enabled = false;
    if (argc == 5) {
        output_path = argv[4];
        is_output_enabled = true;
    }
    auto chase_algorithm = laser::util::ChaseAlgorithm::OBLIVIOUS;
    if (chase_algorithm_str == "S") {
        chase_algorithm = laser::util::ChaseAlgorithm::SKOLEM;
    } else if (chase_algorithm_str == "R") {
        chase_algorithm = laser::util::ChaseAlgorithm::RESTRICTED;
    } else if (chase_algorithm_str == "I") {
        chase_algorithm = laser::util::ChaseAlgorithm::INDEXED;
    }
    std::string const &rules = read_program(program_path);

    std::cout << std::endl;
    std::cout << "STAR - Semantic Time-Aware Reasoner powered by LASER++ " << std::endl;
    std::cout << "Program: " << program_path << std::endl;
    std::cout << "Input: " << stream_path << std::endl;
    std::cout << "Chase: " << chase_algorithm_str << std::endl;

    run(chase_algorithm, stream_path, output_path, is_output_enabled, rules);
}
