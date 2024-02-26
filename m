Return-Path: <SRS0=ef6L=KD=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5811C48BF6
	for <soc@archiver.kernel.org>; Mon, 26 Feb 2024 10:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B296C43394; Mon, 26 Feb 2024 10:43:11 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A86EC433F1;
	Mon, 26 Feb 2024 10:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A86EC433F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id EA011604E8;
	Mon, 26 Feb 2024 10:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1708944189;
	bh=r+im7roRpYG1Yh4e3je3sYTXtj6U+RSWFzwn/ezHhS8=;
	h=From:To:Cc:Subject:Date:From;
	b=XrH9eNmj9A5qDaJ08kmbBM8A7B6l67WVVpwpD9sYr6acI3nDlSGbqcnwY1DIngNG2
	 vY0+/jmSbiHeU8msKq6YJKiWT5jXNFWYHdlrnCXlO7QQBOWITKtYmey70IR9Aw6MVD
	 FNcN7tK/z+vQ0H6AW8aDcNqCgxjuP3vcie1pgWw3BfulGM7hR46hGlMQySJZeRIGou
	 Ap5a55tpTvUm370ZxfpM+y9uKQ1YtLjILEPAZpS3Jcl7RwsyyN2ki9i9p4jdH+M+Qq
	 2qzPpCed+Co+fgNVsKXtvx/uHwr2AEeXgTY3R8WrTC72WarJXZUEjUGaqDAoVOWQ4d
	 qUNmx6qhe8UsQ==
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>,
	"Randy Dunlap" <rdunlap@infradead.org>
Subject: [GIT PULL] Kerneldoc fixes for omaps for v6.9
Date: Mon, 26 Feb 2024 12:42:44 +0200
Message-ID: <pull-1708944095-4485@atomide.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.9/soc-signed

for you to fetch changes up to c6e33edb02292059a06ce8fdc4249a5db86a6114:

  ARM: OMAP2+: fix kernel-doc warnings (2024-01-26 10:28:07 +0200)

----------------------------------------------------------------
Kerneldoc warning fixes for omaps for v6.9

A series of kerneldoc warning fixes for omaps from Randy.

----------------------------------------------------------------
Randy Dunlap (13):
      ARM: OMAP2+: am33xx-restart: fix function name in kernel-doc
      ARM: OMAP2+: clockdomain: fix kernel-doc warnings
      ARM: OMAP2+: clock: fix a function name in kernel-doc
      ARM: OMAP2+: cm33xx: use matching function name in kernel-doc
      ARM: OMAP2+: CMINST: use matching function name in kernel-doc
      ARM: OMAP2+: hwmod: remove misuse of kernel-doc
      ARM: OMAP2+: hwmod: fix kernel-doc warnings
      ARM: OMAP2+: pmic-cpcap: fix kernel-doc warnings
      ARM: OMAP2+: prm44xx: fix a kernel-doc warning
      ARM: OMAP2+: PRM: fix kernel-doc warnings
      ARM: OMAP2+: fix a kernel-doc warning
      ARM: OMAP2+: fix kernel-doc warnings
      ARM: OMAP2+: fix kernel-doc warnings

 arch/arm/mach-omap2/am33xx-restart.c         |  2 +-
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c |  2 +-
 arch/arm/mach-omap2/clockdomain.c            |  4 ++--
 arch/arm/mach-omap2/cm33xx.c                 |  2 +-
 arch/arm/mach-omap2/cminst44xx.c             |  2 +-
 arch/arm/mach-omap2/omap-secure.c            |  4 ++--
 arch/arm/mach-omap2/omap_hwmod.c             |  9 +++++----
 arch/arm/mach-omap2/omap_hwmod_common_data.c |  6 +++---
 arch/arm/mach-omap2/pmic-cpcap.c             | 24 ++++++++++++------------
 arch/arm/mach-omap2/powerdomain.c            |  2 +-
 arch/arm/mach-omap2/prm44xx.c                |  2 +-
 arch/arm/mach-omap2/prm_common.c             |  4 +++-
 arch/arm/mach-omap2/wd_timer.c               |  4 +++-
 13 files changed, 36 insertions(+), 31 deletions(-)
