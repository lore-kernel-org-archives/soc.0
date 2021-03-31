Return-Path: <SRS0=Ddah=I5=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85017C433C1
	for <soc@archiver.kernel.org>; Wed, 31 Mar 2021 10:04:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5622361981; Wed, 31 Mar 2021 10:04:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 09E6F6191D;
	Wed, 31 Mar 2021 10:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09E6F6191D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E5881042;
	Wed, 31 Mar 2021 03:04:17 -0700 (PDT)
Received: from bogus (unknown [10.57.57.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F6773F792;
	Wed, 31 Mar 2021 03:04:15 -0700 (PDT)
Date: Wed, 31 Mar 2021 11:04:10 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Kevin Hilman <khilman@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] arm64: dts: juno: Updates for v5.13
Message-ID: <20210331100410.cenuhvpqoumvsk52@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20171215

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-5.13

for you to fetch changes up to d9df28ba587f646b50a7e307bbb0e6f85c7deb21:

  arm64: dts: juno: Enable more SMMUs (2021-03-15 13:24:09 +0000)

----------------------------------------------------------------
ARMv8 Juno updates for v5.13

Couple of changes to describe PCI dma-ranges correctly which was
previously removed and to enable the PCIe and DMA SMMU.

----------------------------------------------------------------
Robin Murphy (2):
      arm64: dts: juno: Describe PCI dma-ranges
      arm64: dts: juno: Enable more SMMUs

 arch/arm64/boot/dts/arm/juno-base.dtsi | 5 ++++-
 arch/arm64/boot/dts/arm/juno-r1.dts    | 4 ++++
 arch/arm64/boot/dts/arm/juno-r2.dts    | 4 ++++
 3 files changed, 12 insertions(+), 1 deletion(-)
