Return-Path: <SRS0=RGj4=KG=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669D3C48BF6
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 08:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1DECDC43394; Thu, 29 Feb 2024 08:15:35 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5888DC433C7;
	Thu, 29 Feb 2024 08:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5888DC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id E127C603C4;
	Thu, 29 Feb 2024 08:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709194533;
	bh=n4d+nnPAUyFRIJLb2MKkCdcLXzJ7KJKIQqoLf3sxOOQ=;
	h=From:To:Cc:Subject:Date:From;
	b=WbnD9vuwgspKzINXBRqsLhTT3RJLWMpgLMlalcpXXMfH1RzVYugh7s7YnyN1+43V3
	 /4aa2tBTopfDJU13BK9AePg6IbnpES9qioKT8oxvrNLVTxhSpOCYxd04M5nlvhJjes
	 JAW35huhM84N+2v5mL+sdsRweS9kOyiOHQ+sQnDWEynBkZqWpwQAchKtH195pE25Fa
	 IuPYmnNqgymw2cuJm6vPUF2GOIwHKlk1uTXUC8y2ZPtvfsYuv2tDgjCgM78hn+EBU2
	 KPUQlIRweDuXtOIahYUsaD+rHteZmt8P1b/REP1hDAwnzI8sfdSocDSRsYV5vl7nZb
	 80cicRL8TFsrQ==
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Few more SoC changes for omaps
Date: Thu, 29 Feb 2024 10:15:19 +0200
Message-ID: <pull-1709194504-639032@atomide.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit c6e33edb02292059a06ce8fdc4249a5db86a6114:

  ARM: OMAP2+: fix kernel-doc warnings (2024-01-26 10:28:07 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.9/soc-part2-signed

for you to fetch changes up to 6521f6a195c70e16cab375ca1c4d23b6fd3d76b4:

  ARM: AM33xx: PRM: Implement REBOOT_COLD (2024-02-28 09:33:03 +0200)

----------------------------------------------------------------
Few more SoC changes for omaps

Two changes to implement REBOOT_COLD for am335x.

----------------------------------------------------------------
Alexander Sverdlin (2):
      ARM: AM33xx: PRM: Remove redundand defines
      ARM: AM33xx: PRM: Implement REBOOT_COLD

 arch/arm/mach-omap2/am33xx-restart.c   |  3 ++-
 arch/arm/mach-omap2/board-generic.c    |  6 ++++++
 arch/arm/mach-omap2/prm-regbits-33xx.h |  1 +
 arch/arm/mach-omap2/prm.h              |  1 +
 arch/arm/mach-omap2/prm33xx.c          | 22 ++++++++++++++--------
 arch/arm/mach-omap2/prm_common.c       |  6 ++++++
 6 files changed, 30 insertions(+), 9 deletions(-)
