Return-Path: <SRS0=Wqm8=HM=toshiba.co.jp=nobuhiro1.iwamatsu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17523C433DB
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 17:32:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DFA9664ECF; Wed, 10 Feb 2021 17:32:24 +0000 (UTC)
Received: from mo-csw.securemx.jp (mo-csw1515.securemx.jp [210.130.202.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B6D164ED0
	for <soc@kernel.org>; Wed, 10 Feb 2021 17:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B6D164ED0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=nobuhiro1.iwamatsu@toshiba.co.jp
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 11AHWEvi014609; Thu, 11 Feb 2021 02:32:14 +0900
X-Iguazu-Qid: 34tMScsDAnZFFYdiXA
X-Iguazu-QSIG: v=2; s=0; t=1612978334; q=34tMScsDAnZFFYdiXA; m=Km+Q8gkiHMM9wvJSGLkYsgiwpRYJ1OYFW1VtlyXYnn8=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
	by relay.securemx.jp (mx-mr1513) id 11AHWBNW008311;
	Thu, 11 Feb 2021 02:32:12 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
	by imx2.toshiba.co.jp  with ESMTP id 11AHWBGr010235;
	Thu, 11 Feb 2021 02:32:11 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
	by enc01.toshiba.co.jp  with ESMTP id 11AHWBex002763;
	Thu, 11 Feb 2021 02:32:11 +0900
Date: Thu, 11 Feb 2021 02:32:10 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net, arnd@arndb.de
Cc: yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com
Subject: [GIT PULL] ARM: Visconti: device tree changes for 5.12
X-TSB-HOP: ON
Message-ID: <20210210173210.nnytfyrkkj6ylrtb@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi SoC team,

This request includes the GPIO DT patch for the Visconti SoC.
Please pull for v5.12 kernel cycle.

The following changes since commit 4fd18fc38757217c746aa063ba9e4729814dc737:

  arm64: dts: visconti: Add watchdog support for TMPV7708 SoC (2021-01-25 09:20:47 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git dt-for-v5.12

for you to fetch changes up to 0109a17564fc753d8769a1b8d76db3dba17b959b:

  arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver (2021-02-11 02:01:16 +0900)

----------------------------------------------------------------
Nobuhiro Iwamatsu (1):
      arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver

 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts |  4 ++++
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi        | 11 +++++++++++
 2 files changed, 15 insertions(+)
