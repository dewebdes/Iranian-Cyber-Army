SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Table structure for table `attacks`
--

CREATE TABLE `attacks` (
  `id` mediumint NOT NULL,
  `msg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remoteip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remoteport` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bootps`
--

CREATE TABLE `bootps` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `op` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `htype` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `hlen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `hops` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `xid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `secs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `flags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ciaddr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `yiaddr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `siaddr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `giaddr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `chaddr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commands`
--

CREATE TABLE `commands` (
  `id` mediumint NOT NULL,
  `cmdname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dhcps`
--

CREATE TABLE `dhcps` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dnsqr`
--

CREATE TABLE `dnsqr` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qtype` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qclass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dnsropts`
--

CREATE TABLE `dnsropts` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rrname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rclass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `extrcode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `version` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `z` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rdlen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rdata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dnsrrnsecs2`
--

CREATE TABLE `dnsrrnsecs2` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rrname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rclass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ttl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rdlen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nextname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `typebitmaps` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dnsrrs`
--

CREATE TABLE `dnsrrs` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rrname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rclass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ttl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rdlen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rdata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dnsrrsoas`
--

CREATE TABLE `dnsrrsoas` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rrname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rclass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ttl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rdlen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `serial` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refresh` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `retry` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `expire` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `minimum` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dnsrrsrvs2`
--

CREATE TABLE `dnsrrsrvs2` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rrname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rclass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ttl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rdlen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `priority` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `weight` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `port` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `target` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dnss`
--

CREATE TABLE `dnss` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `length` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `idv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `opcode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `aa` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `z` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ad` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rcode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qdcount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ancount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nscount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `arcount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `an` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ns` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edns0tlvs`
--

CREATE TABLE `edns0tlvs` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `optcode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `optlen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `optdata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ethrs`
--

CREATE TABLE `ethrs` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dst` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `src` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE `filters` (
  `id` mediumint NOT NULL,
  `tblname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `filname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ipoptionrouteralerts`
--

CREATE TABLE `ipoptionrouteralerts` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `copy_flag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `optclass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `optionv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `length` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `alert` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ips`
--

CREATE TABLE `ips` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `version` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ihl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `len` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `flags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `frag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ttl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `proto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `chksum` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `src` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dst` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `layers`
--

CREATE TABLE `layers` (
  `id` mediumint NOT NULL,
  `namefull` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `clsname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `finddt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `handeled` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tblname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fldnames` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `typ` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `llmnquery`
--

CREATE TABLE `llmnquery` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `idv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `opcode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `c` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `z` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rcode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qdcount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ancount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nscount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `arcount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `an` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ns` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nbnsqueryrequests`
--

CREATE TABLE `nbnsqueryrequests` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME_TRN_ID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `FLAGS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `QDCOUNT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ANCOUNT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NSCOUNT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ARCOUNT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `QUESTION_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `SUFFIX` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NULLv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `QUESTION_TYPE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `QUESTION_CLASS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nginx`
--

CREATE TABLE `nginx` (
  `id` mediumint NOT NULL,
  `time_local` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remote_addr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_method` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_length` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bytes_sent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_bytes_sent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_referer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_user_agent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `upstream_addr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `upstream_status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `upstream_response_time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `upstream_connect_time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `upstream_header_time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ntpheaders`
--

CREATE TABLE `ntpheaders` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `leap` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `version` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `stratum` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `poll` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `precisionv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `delay` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dispersion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `idv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ref_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ref` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `orig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `recv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packets`
--

CREATE TABLE `packets` (
  `id` mediumint NOT NULL,
  `idx` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `hexraw` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `leyars` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admflags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `src` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dst` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `idnum` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paddings`
--

CREATE TABLE `paddings` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `loadv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `raws`
--

CREATE TABLE `raws` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `loadv` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tcps`
--

CREATE TABLE `tcps` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sport` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dport` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seq` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ack` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dataofs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reserved` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `flags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `windowv` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `chksum` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `urgptr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `udps`
--

CREATE TABLE `udps` (
  `id` mediumint NOT NULL,
  `pktid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sport` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dport` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `len` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `chksum` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attacks`
--
ALTER TABLE `attacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bootps`
--
ALTER TABLE `bootps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dhcps`
--
ALTER TABLE `dhcps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dnsqr`
--
ALTER TABLE `dnsqr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dnsropts`
--
ALTER TABLE `dnsropts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dnsrrnsecs2`
--
ALTER TABLE `dnsrrnsecs2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dnsrrs`
--
ALTER TABLE `dnsrrs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dnsrrsoas`
--
ALTER TABLE `dnsrrsoas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dnsrrsrvs2`
--
ALTER TABLE `dnsrrsrvs2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dnss`
--
ALTER TABLE `dnss`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edns0tlvs`
--
ALTER TABLE `edns0tlvs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ethrs`
--
ALTER TABLE `ethrs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ipoptionrouteralerts`
--
ALTER TABLE `ipoptionrouteralerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ips`
--
ALTER TABLE `ips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layers`
--
ALTER TABLE `layers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `llmnquery`
--
ALTER TABLE `llmnquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nbnsqueryrequests`
--
ALTER TABLE `nbnsqueryrequests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nginx`
--
ALTER TABLE `nginx`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ntpheaders`
--
ALTER TABLE `ntpheaders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packets`
--
ALTER TABLE `packets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paddings`
--
ALTER TABLE `paddings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raws`
--
ALTER TABLE `raws`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tcps`
--
ALTER TABLE `tcps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `udps`
--
ALTER TABLE `udps`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attacks`
--
ALTER TABLE `attacks`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bootps`
--
ALTER TABLE `bootps`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commands`
--
ALTER TABLE `commands`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dhcps`
--
ALTER TABLE `dhcps`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dnsqr`
--
ALTER TABLE `dnsqr`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dnsropts`
--
ALTER TABLE `dnsropts`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dnsrrnsecs2`
--
ALTER TABLE `dnsrrnsecs2`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dnsrrs`
--
ALTER TABLE `dnsrrs`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dnsrrsoas`
--
ALTER TABLE `dnsrrsoas`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dnsrrsrvs2`
--
ALTER TABLE `dnsrrsrvs2`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dnss`
--
ALTER TABLE `dnss`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edns0tlvs`
--
ALTER TABLE `edns0tlvs`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ethrs`
--
ALTER TABLE `ethrs`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filters`
--
ALTER TABLE `filters`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipoptionrouteralerts`
--
ALTER TABLE `ipoptionrouteralerts`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ips`
--
ALTER TABLE `ips`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `layers`
--
ALTER TABLE `layers`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `llmnquery`
--
ALTER TABLE `llmnquery`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nbnsqueryrequests`
--
ALTER TABLE `nbnsqueryrequests`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nginx`
--
ALTER TABLE `nginx`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ntpheaders`
--
ALTER TABLE `ntpheaders`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packets`
--
ALTER TABLE `packets`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paddings`
--
ALTER TABLE `paddings`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raws`
--
ALTER TABLE `raws`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tcps`
--
ALTER TABLE `tcps`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `udps`
--
ALTER TABLE `udps`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
