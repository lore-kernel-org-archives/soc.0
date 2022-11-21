Return-Path: <SRS0=puPy=3V=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB82BC433FE
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 13:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2EB6C433D7; Mon, 21 Nov 2022 13:18:22 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 6B5B1C433C1;
	Mon, 21 Nov 2022 13:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B5B1C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 727E080A7;
	Mon, 21 Nov 2022 13:08:07 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Regulator changes for am335x-pcm-953
Date: Mon, 21 Nov 2022 15:18:17 +0200
Message-Id: <pull-1669036672-530717@atomide.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/am335x-pcm-953-regulators

for you to fetch changes up to 8950f345a67d8046d2472dd6ea81fa18ef5b4844:

  ARM: dts: am335x-pcm-953: Define fixed regulators in root node (2022-11-09 10:09:51 +0200)

----------------------------------------------------------------
Regulator changes for am335x-pcm-953

This is for deferred probe issue on am335x-pcm-953 sdhci-omap regulator.

----------------------------------------------------------------
Dominik Haller (1):
      ARM: dts: am335x-pcm-953: Define fixed regulators in root node

 arch/arm/boot/dts/am335x-pcm-953.dtsi | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)
