Return-Path: <SRS0=6tNM=FS=toshiba.co.jp=nobuhiro1.iwamatsu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2828C4361B
	for <soc@archiver.kernel.org>; Mon, 14 Dec 2020 04:42:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 67D672079A; Mon, 14 Dec 2020 04:42:50 +0000 (UTC)
X-Greylist: delayed 191 seconds by postgrey-1.34 at mail.kernel.org; Mon, 14 Dec 2020 04:42:49 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06F4B20798
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=nobuhiro1.iwamatsu@toshiba.co.jp
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1115.securemx.jp [210.130.202.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06F4B20798
	for <soc@kernel.org>; Mon, 14 Dec 2020 04:42:48 +0000 (UTC)
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1115) id 0BE4dcsl013367; Mon, 14 Dec 2020 13:39:38 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 0BE4dUdA001482; Mon, 14 Dec 2020 13:39:30 +0900
X-Iguazu-Qid: 2wGrOZVerS5rKpi3C1
X-Iguazu-QSIG: v=2; s=0; t=1607920770; q=2wGrOZVerS5rKpi3C1; m=7IJesRA3jgnUPVGZgD82pe4Gu502rZKDIwbO2R71S90=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
	by relay.securemx.jp (mx-mr1110) id 0BE4dSoR014653;
	Mon, 14 Dec 2020 13:39:29 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
	by imx12.toshiba.co.jp  with ESMTP id 0BE4dSFD025201;
	Mon, 14 Dec 2020 13:39:28 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
	by enc02.toshiba.co.jp  with ESMTP id 0BE4dSZY025098;
	Mon, 14 Dec 2020 13:39:28 +0900
Date: Mon, 14 Dec 2020 13:39:22 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, yuji2.ishikawa@toshiba.co.jp
Subject: [GIT PULL] ARM: Visconti: device tree changes for 5.11
X-TSB-HOP: ON
Message-ID: <20201214043922.p7njpxzrcwfoaphe@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20201214043922.vFHqFsBDKuRQyGz9E0LhG_jBlTRPXjrOis-aYho4FM0@z>

Hi, SoC team,

This request includes the WDT / DT patch for the Visconti SoC.
Please pull for v5.11 kernel cycle.

The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:

  Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git visconti-arm-dt-for-v5.11-tag1

for you to fetch changes up to 7fbd66db6d852900a0f8168939e83b03a6bb959f:

  arm64: dts: visconti: Add watchdog support for TMPV7708 SoC (2020-12-01 18:43:05 +0900)

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
