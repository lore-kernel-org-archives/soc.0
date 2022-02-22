Return-Path: <SRS0=HxAm=TF=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEBBC433EF
	for <soc@archiver.kernel.org>; Tue, 22 Feb 2022 20:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B421C340F1; Tue, 22 Feb 2022 20:18:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 68E26C340E8;
	Tue, 22 Feb 2022 20:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 68E26C340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61930139F;
	Tue, 22 Feb 2022 12:18:16 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 472593F70D;
	Tue, 22 Feb 2022 12:18:15 -0800 (PST)
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
Subject: [GIT PULL] arm64: dts: juno: Update for v5.18
Date: Tue, 22 Feb 2022 20:18:12 +0000
Message-Id: <20220222201812.3338619-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 31eeb6b09f4053f32a30ce9fbcdfca31f713028d:

  arm64: dts: juno: Remove GICv2m dma-range (2022-01-26 10:23:04 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-update-5.18

for you to fetch changes up to 96bb0954860a4c8b8c77d59fc53cd4cafac914f5:

  arm64: dts: juno: Add separate SCMI variants (2022-02-21 10:53:25 +0000)

----------------------------------------------------------------
Arm Juno update for v5.18

Just a single update adding long waited support for SCMI firmware variant
as separate devicetrees. I wanted to deal with this differences in the
firmware interface within the bootloader for long time. But with variety
of bootloaders (u-boot, UEFI, ..etc) and need to add SCMI and SCPI
support for sake of discovery with discrepancies in shared memory layout,
it turned out difficult.

So, finally we are adding it as separate files so that we don't break
support for older SCPI firmware interface.

----------------------------------------------------------------
Robin Murphy (1):
      arm64: dts: juno: Add separate SCMI variants

 arch/arm64/boot/dts/arm/Makefile         |   2 +-
 arch/arm64/boot/dts/arm/juno-r1-scmi.dts |  23 ++++
 arch/arm64/boot/dts/arm/juno-r2-scmi.dts |  23 ++++
 arch/arm64/boot/dts/arm/juno-scmi.dts    |   9 ++
 arch/arm64/boot/dts/arm/juno-scmi.dtsi   | 199 +++++++++++++++++++++++++++++++
 5 files changed, 255 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/arm/juno-r1-scmi.dts
 create mode 100644 arch/arm64/boot/dts/arm/juno-r2-scmi.dts
 create mode 100644 arch/arm64/boot/dts/arm/juno-scmi.dts
 create mode 100644 arch/arm64/boot/dts/arm/juno-scmi.dtsi
