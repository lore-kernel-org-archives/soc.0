Return-Path: <SRS0=xBia=LI=toshiba.co.jp=nobuhiro1.iwamatsu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4C0C2B9F4
	for <soc@archiver.kernel.org>; Mon, 14 Jun 2021 23:59:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8B7E2610EA; Mon, 14 Jun 2021 23:59:57 +0000 (UTC)
X-Greylist: delayed 771 seconds by postgrey-1.34 at mail.kernel.org; Mon, 14 Jun 2021 23:59:55 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDBF761029
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=nobuhiro1.iwamatsu@toshiba.co.jp
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1514.securemx.jp [210.130.202.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDBF761029
	for <soc@kernel.org>; Mon, 14 Jun 2021 23:59:55 +0000 (UTC)
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1514) id 15ENl4eD007394; Tue, 15 Jun 2021 08:47:05 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 15ENkwRQ024308; Tue, 15 Jun 2021 08:46:58 +0900
X-Iguazu-Qid: 34tMM6VucyrxN4YB1E
X-Iguazu-QSIG: v=2; s=0; t=1623714417; q=34tMM6VucyrxN4YB1E; m=DEUh+4u85pEsAkByQzSzgEoDoYAYV9OXSYKv9iFVJk0=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1513) id 15ENkuDx003257
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 15 Jun 2021 08:46:57 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id 1E66C1000CE;
	Tue, 15 Jun 2021 08:46:56 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
	by enc01.toshiba.co.jp  with ESMTP id 15ENkt53022785;
	Tue, 15 Jun 2021 08:46:55 +0900
Date: Tue, 15 Jun 2021 08:46:54 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net, arnd@arndb.de
Cc: yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: Visconti: device tree changes for 5.14
X-TSB-HOP: ON
Message-ID: <20210614234654.2u3xetnn5rwhymwz@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20210614234654.coPMcWmETuW4tsFQiECGiquJq299LbuhomhP8GZPnww@z>

Hi SoC team,

This request includes the PWM DT patch for the Visconti SoC.
Please pull for v5.14 kernel cycle.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git tags/visconti-arm-dt-for-v5.14

for you to fetch changes up to 172cdcaefea5c297fdb3d20b7d5aff60ae4fbce6:

  arm64: dts: visconti: Add PWM support for TMPV7708 SoC (2021-06-15 08:25:28 +0900)

----------------------------------------------------------------
Visconti device tree updates for 5.14

- Add DT support for Toshiba Visconti5 PWM driver

----------------------------------------------------------------
Nobuhiro Iwamatsu (1):
      arm64: dts: visconti: Add PWM support for TMPV7708 SoC

 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts | 8 ++++++++
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi        | 9 +++++++++
 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi   | 5 +++++
 3 files changed, 22 insertions(+)

