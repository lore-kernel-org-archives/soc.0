Return-Path: <SRS0=RGj4=KG=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E28C48BF6
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 08:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0DE6C43390; Thu, 29 Feb 2024 08:14:27 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 927A6C433F1;
	Thu, 29 Feb 2024 08:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 927A6C433F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id C0BB0603C4;
	Thu, 29 Feb 2024 08:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709194465;
	bh=ppvuhnrUpK5zFoCfAJnSwRpPqxTqpOnOlV+dZsZUDrg=;
	h=From:To:Cc:Subject:Date:From;
	b=je2ARkixgy1ROZW69C/RtHAHYzdMgMuxYlszEP1Xonu6oiaYiLmo/bwRa3fU5EpBH
	 8GcPR1CTaXqA2g+lTTHM/fVGzvym2fDb2I0c1wgZ/4mpZ/U0FljN1E1AQNSoLYP5N3
	 UWq1Bwdmjw2MlY0SMZRF1jUW1Y3J8e9ycLulg5nDM+bnpdFpOjuvFti/WcVL4Ze9O5
	 vkgOpjgcubpFSSXV3GYSiBXgDckWS9YaxESjnSb4yLzHSryqOtIoDQWFIYRVjDDldH
	 3CuaO4JlSufAkIBCdJxRd4kYp1GXIxD31oaJejYLsvEhTPTMcMteQiaTLSodjIUV7S
	 crzImmCh5i99g==
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Kconfig change for omap1
Date: Thu, 29 Feb 2024 10:14:08 +0200
Message-ID: <pull-1709194435-723888@atomide.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.9/omap1-signed

for you to fetch changes up to bd69d2c7312a210129b3c840dd5a7c970a64e0c8:

  ARM: omap1: remove duplicated 'select ARCH_OMAP' (2024-02-28 09:27:20 +0200)

----------------------------------------------------------------
Kconfig change for omap1

Just one change to drop a duplicate select ARCH_OMAP.

----------------------------------------------------------------
Masahiro Yamada (1):
      ARM: omap1: remove duplicated 'select ARCH_OMAP'

 arch/arm/mach-omap1/Kconfig | 1 -
 1 file changed, 1 deletion(-)
