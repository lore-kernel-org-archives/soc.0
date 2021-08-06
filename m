Return-Path: <SRS0=HLeY=M5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB19C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 07:47:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67E9061050
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 07:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67E9061050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:CC:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z0olOtfEKT1sZdyt633UKcAEH6KMLfflvAjR33oAPQM=; b=wTHPG7r1jJ+qjx
	K/DTd+ZO/4YWQ4yHpIVqIxJcvYjzBYYsqiAhPKVH1mtiTHHNLaWYg/xb0u4EZn8Tr65bfb3SbzlPC
	YJv4Gdb45gok6qkVibWDB+lSPZIw1S0ZAhQjU+lZMUauiCB/x/N4xLswFaINrLMVYtv+FH8c0yajT
	HRIowsp6pOpWckfIWv6mQyZ3liBgFsI7Mj7UtInmL20Tn0snUMfzggI50otn8OQy2XfpnWhAIxpGu
	mG6lJQTQQjxEfFhR3TkbncC4dbfh1hwoQmpe0YCBKkGmL9Yr+la76cqTOvLp31qrLZKFIxMBNcksC
	LYPlLFS2z8WpxwGPHmSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBuXo-00BmrV-6H; Fri, 06 Aug 2021 07:45:28 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBuXk-00Bmr2-4L
 for linux-arm-kernel@lists.infradead.org; Fri, 06 Aug 2021 07:45:26 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1767hvR3004095; Fri, 6 Aug 2021 09:45:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=to : cc : from :
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
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@kernel.org>, SoC Team <soc@kernel.org>, "arm@kernel.org"
 <arm@kernel.org>
CC: Alain Volmat <avolmat@me.com>, Patrice CHOTARD - foss
 <patrice.chotard@foss.st.com>, Linux ARM Mailing List
 <linux-arm-kernel@lists.infradead.org>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [GIT PULL] STi DT update for v5.15 #1
Message-ID: <1d95209f-9cb4-47a3-2696-7a93df7cdc05@foss.st.com>
Date: Fri, 6 Aug 2021 09:45:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_02:2021-08-05,
 2021-08-06 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_004524_709393_B55BE2FF 
X-CRM114-Status: GOOD (  14.73  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210806074512.7X1IV-TPYU5McJ2MIORSi0IW4DZNJLGL6cSKVllfsU0@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
