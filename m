Return-Path: <SRS0=cbMu=LI=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D53CD1288
	for <soc@archiver.kernel.org>; Wed,  3 Apr 2024 09:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC466C43390; Wed,  3 Apr 2024 09:22:54 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CD3FC433F1;
	Wed,  3 Apr 2024 09:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0CD3FC433F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 40AA460339;
	Wed,  3 Apr 2024 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1712136172;
	bh=8HTgpvS7aR8i8Ht7gH/5QekuK2QNK6oKHuzOKRu0yNs=;
	h=From:To:Cc:Subject:Date:From;
	b=OftVuP1lwHnTsflTNlSSM64Y++CnQsjbpGynqKAHjdh/joCszijb2XknrN3jm0GYd
	 TT970gWiZVIMC9eoEDfKAi0AAYBD7E7ri9BtRdR0TR33f3nrWO3zPE/UJmDEJGU1bM
	 g74MnWWLMAcu1q5RZVIxX90fRwpx5wRUa54vANDvAQWavghG/dD59i0GxDGeqZaAXp
	 68Oy0kOfImk8cmH+z328F5Pv7OaJlHyLS9QA2fQlWWjkzgTUcjXOmWArB/8JI/PvwO
	 qZtKb3oJqt4FEdv1sF87BHtdvcMjcLUnnewlZ8hwvxDKcW6Y9daDldC0xWf+VO2b5H
	 8gy4WlZwacdxg==
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [GIT PULL] GPIO regression fixes for n8x0
Date: Wed,  3 Apr 2024 12:22:29 +0300
Message-ID: <pull-1712135932-125424@atomide.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.9/n8x0-fixes-signed

for you to fetch changes up to 4421405e3634a3189b541cf1e34598e44260720d:

  ARM: OMAP2+: fix USB regression on Nokia N8x0 (2024-03-08 11:02:38 +0200)

Sorry this got delayed a bit as I had some SSD issue, please feel free
to merge whenever suitable.

----------------------------------------------------------------
GPIO regression fixes for n8x0

A series of fixes for n8x0 GPIO regressions caused by the changes to use
GPIO descriptors.

----------------------------------------------------------------
Aaro Koskinen (6):
      ARM: OMAP2+: fix bogus MMC GPIO labels on Nokia N8x0
      ARM: OMAP2+: fix N810 MMC gpiod table
      mmc: omap: fix broken slot switch lookup
      mmc: omap: fix deferred probe
      mmc: omap: restore original power up/down steps
      ARM: OMAP2+: fix USB regression on Nokia N8x0

 arch/arm/mach-omap2/board-n8x0.c | 23 +++++++++----------
 drivers/mmc/host/omap.c          | 48 ++++++++++++++++++++++++++--------------
 2 files changed, 41 insertions(+), 30 deletions(-)
