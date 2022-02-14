Return-Path: <SRS0=UCfg=S5=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80670C433EF
	for <soc@archiver.kernel.org>; Mon, 14 Feb 2022 14:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4BC87C340EF; Mon, 14 Feb 2022 14:26:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 8639FC340E9;
	Mon, 14 Feb 2022 14:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8639FC340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27C671063;
	Mon, 14 Feb 2022 06:26:27 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 10B653F70D;
	Mon, 14 Feb 2022 06:26:25 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] arm64: dts: juno: Fix for v5.17
Date: Mon, 14 Feb 2022 14:26:15 +0000
Message-Id: <20220214142615.2375269-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-fix-5.17

for you to fetch changes up to 31eeb6b09f4053f32a30ce9fbcdfca31f713028d:

  arm64: dts: juno: Remove GICv2m dma-range (2022-01-26 10:23:04 +0000)

----------------------------------------------------------------
Arm Juno fix for v5.17

Just a single fix to address coherency issue reported[1] by removing the
GICv2m address from the DMA ranges as it loose coherency if mapped as
cacheable at the SMMU due to the attribute combining rules. The GICv2m
range is normally programmed for Device memory attributes.

[1] https://lore.kernel.org/stable/0a1d437d-9ea0-de83-3c19-e07f560ad37c@arm.com/

----------------------------------------------------------------
Robin Murphy (1):
      arm64: dts: juno: Remove GICv2m dma-range

 arch/arm64/boot/dts/arm/juno-base.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
