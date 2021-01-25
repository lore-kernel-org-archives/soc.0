Return-Path: <SRS0=IRNQ=G4=toshiba.co.jp=nobuhiro1.iwamatsu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15FEC433DB
	for <soc@archiver.kernel.org>; Mon, 25 Jan 2021 00:34:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 95EBF22C9F; Mon, 25 Jan 2021 00:34:16 +0000 (UTC)
Received: from mo-csw.securemx.jp (mo-csw1516.securemx.jp [210.130.202.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7760722C9C
	for <soc@kernel.org>; Mon, 25 Jan 2021 00:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7760722C9C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=nobuhiro1.iwamatsu@toshiba.co.jp
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 10P0Y8fI018826; Mon, 25 Jan 2021 09:34:08 +0900
X-Iguazu-Qid: 34tMK0YvimSKTYMrtD
X-Iguazu-QSIG: v=2; s=0; t=1611534848; q=34tMK0YvimSKTYMrtD; m=b7kM4uAU537iUyGKBTU1kvS/Ro32Ql6mfFF1bf4k0lg=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
	by relay.securemx.jp (mx-mr1511) id 10P0Y7nC008972;
	Mon, 25 Jan 2021 09:34:07 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
	by imx2.toshiba.co.jp  with ESMTP id 10P0Y7tj004060;
	Mon, 25 Jan 2021 09:34:07 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
	by enc01.toshiba.co.jp  with ESMTP id 10P0Y6b9008805;
	Mon, 25 Jan 2021 09:34:07 +0900
Date: Mon, 25 Jan 2021 09:33:57 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net, arnd@arndb.de
Cc: yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: Visconti: device tree changes for 5.11 / 2nd
X-TSB-HOP: ON
Message-ID: <20210125003357.yd72y4f5vcdnvhnr@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, SoC team,

This request includes the WDT / DT patch for the Visconti SoC.
Please pull for v5.11 kernel cycle.

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git
tags/visconti-arm-dt-for-v5.11-tag2

for you to fetch changes up to 4fd18fc38757217c746aa063ba9e4729814dc737:

  arm64: dts: visconti: Add watchdog support for TMPV7708 SoC
(2021-01-25 09:20:47 +0900)

----------------------------------------------------------------
Visconti device tree updates for 5.11

- Add watchdog support for TMPV7708 SoC
- Add entries for Toshiba Visconti5 watchdog driver

----------------------------------------------------------------
Nobuhiro Iwamatsu (2):
      MAINTAINERS: Add entries for Toshiba Visconti5 watchdog driver
      arm64: dts: visconti: Add watchdog support for TMPV7708 SoC

 MAINTAINERS                                      |  2 ++
 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts |  5 +++++
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi        | 12 ++++++++++++
 3 files changed, 19 insertions(+)

