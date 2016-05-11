CREATE TABLE `agents` (
  `hostname` varchar(32) NOT NULL,
  `agent_type` varchar(8) NOT NULL,
  `is_distinguish_agent` bit(1) NOT NULL DEFAULT b'0',
  `is_leader` bit(1) NOT NULL DEFAULT b'0',
  `is_alive` bit(1) NOT NULL DEFAULT b'0',
  `last_ping_ts` timestamp NULL,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `proposer_proposals` (
  `proposal_id` int(11) NOT NULL,
  `proposer_hostname` varchar(11) NOT NULL,
  `value` int(11) NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`proposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `acceptor_promises` (
  `local_id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `proposer_hostname` varchar(32) NOT NULL,
  `value` int(11) NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`local_id`),
  UNIQUE KEY `idx1` (`proposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `acceptor_accepts` (
  `local_id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `proposer_hostname` varchar(32) NOT NULL,
  `value` int(11) NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`local_id`),
  UNIQUE KEY `idx1` (`proposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `learner_accept_logs` (
  `local_id` int(11) NOT NULL AUTO_INCREMENT,
  `acceptor_hostname` varchar(32) NOT NULL,
  `proposal_id` int(11) NOT NULL,
  `proposer_hostname` varchar(32) NOT NULL,
  `value` int(11) NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`local_id`),
  UNIQUE KEY `idx1` (`proposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `learner_consensus` (
  `local_id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `proposer_hostname` varchar(32) NOT NULL,
  `value` int(11) NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`local_id`),
  UNIQUE KEY `idx1` (`proposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
