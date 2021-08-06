Return-Path: <SRS0=F00/=M5=foss.st.com=prvs=2852d96a35=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1696C4338F
	for <soc@archiver.kernel.org>; Fri,  6 Aug 2021 07:45:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7B72E611C9; Fri,  6 Aug 2021 07:45:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57DD461050;
	Fri,  6 Aug 2021 07:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57DD461050
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1767hvR3004095;
	Fri, 6 Aug 2021 09:45:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=OcGwJQkANQEOJkkp9PmZDQqGR76qVEvIVPfIfmVId3Y=;
 b=SpigNfz0ncM2yoPFoPIhvM8IGK1kjFCDsB9QkeMxqoq/pHbLy6hLeHAd9S8Sfpt1YW4c
 SLUZlSXHaWwSlaMPtD3KwFVc4AVLfNYp7Tgm/I086Gt8kE2xHtvbdegYt+ZqJmZkxW5v
 LvRMOXkQ0wEBHNcbT1l0gFwuYdp6WAqNYc011Dsef7MrNazOlV6nuKeQwU70OPvhaQDv
 3NL9Dg6wW+3QCD2B4LZn8dxqo1qaAe7AwOlbOZVvcq4LpFbrhmi3zoy6EAqZC57UOVY2
 ALn3wqzZeS8wO6Brwf5yIEOZGsSIaDUV4YB+fpirwyXmeNg46h9AUixoD+me1RjuNawg HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 3a8bpvwkcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Aug 2021 09:45:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F71F10002A;
	Fri,  6 Aug 2021 09:45:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F213A216EF7;
	Fri,  6 Aug 2021 09:45:13 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 6 Aug
 2021 09:45:12 +0200
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@kernel.org>, SoC Team <soc@kernel.org>,
        "arm@kernel.org"
	<arm@kernel.org>
CC: Alain Volmat <avolmat@me.com>,
        Patrice CHOTARD - foss
	<patrice.chotard@foss.st.com>,
        Linux ARM Mailing List
	<linux-arm-kernel@lists.infradead.org>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [GIT PULL] STi DT update for v5.15 #1
Message-ID: <1d95209f-9cb4-47a3-2696-7a93df7cdc05@foss.st.com>
Date: Fri, 6 Aug 2021 09:45:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-06_02:2021-08-05,2021-08-06 signatures=0

Hi

This STi DT update is dedicated for v5.15. 
It provides mainly clocks update and introduces a new board.

Thanks
Patrice

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pchotard/sti.git tags/sti-dt-for-v5.15-round1

for you to fetch changes up to f9807f9cb396544ab6bdb4f4451505211ca602f7:

  ARM: dts: sti: remove clk_ignore_unused from bootargs for stih410-b2260 (2021-08-06 09:30:03 +0200)

----------------------------------------------------------------
Highlights:
-----------
  - Introduce 4KOpen STiH418-b2264 board
  - Remove clk_ignore_unused from STi boards DT
  - Remove clock-output-names and clk_critical properties
  - Update some clock compatible

----------------------------------------------------------------
Alain Volmat (13):
      ARM: dts: sti: update flexgen compatible within stih418-clock
      ARM: dts: sti: update flexgen compatible within stih407-clock
      ARM: dts: sti: update flexgen compatible within stih410-clock
      ARM: dts: sti: update clkgen-pll entries in stih407-clock
      ARM: dts: sti: update clkgen-pll entries in stih410-clock
      ARM: dts: sti: update clkgen-pll entries in stih418-clock
      ARM: dts: sti: update clkgen-fsyn entries in stih407-clock
      ARM: dts: sti: update clkgen-fsyn entries in stih410-clock
      ARM: dts: sti: update clkgen-fsyn entries in stih418-clock
      ARM: dts: sti: add the spinor controller node within stih407-family
      ARM: dts: sti: disable rng11 on the stih418 platform
      ARM: dts: sti: add the thermal sensor node within stih418
      ARM: dts: sti: Introduce 4KOpen (stih418-b2264) board

Patrice Chotard (4):
      ARM: dts: sti: remove clk_ignore_unused from bootargs for stih407-b2120
      ARM: dts: sti: remove clk_ignore_unused from bootargs for stih410-b2120
      ARM: dts: sti: remove clk_ignore_unused from bootargs for stih418-b2199
      ARM: dts: sti: remove clk_ignore_unused from bootargs for stih410-b2260

 arch/arm/boot/dts/Makefile            |   3 +-
 arch/arm/boot/dts/stih407-b2120.dts   |   1 -
 arch/arm/boot/dts/stih407-clock.dtsi  | 128 +++-------------------------
 arch/arm/boot/dts/stih407-family.dtsi |  15 ++++
 arch/arm/boot/dts/stih410-b2120.dts   |   1 -
 arch/arm/boot/dts/stih410-b2260.dts   |   1 -
 arch/arm/boot/dts/stih410-clock.dtsi  | 138 +++----------------------------
 arch/arm/boot/dts/stih418-b2199.dts   |   1 -
 arch/arm/boot/dts/stih418-b2264.dts   | 151 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stih418-clock.dtsi  | 136 +++---------------------------
 arch/arm/boot/dts/stih418.dtsi        |  12 +++
 11 files changed, 215 insertions(+), 372 deletions(-)
 create mode 100644 arch/arm/boot/dts/stih418-b2264.dts
