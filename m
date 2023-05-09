Return-Path: <SRS0=LCXL=A6=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A0CC77B75
	for <soc@archiver.kernel.org>; Tue,  9 May 2023 14:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA9D4C4339B; Tue,  9 May 2023 14:35:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 0CE49C4339C;
	Tue,  9 May 2023 14:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0CE49C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14257FEC;
	Tue,  9 May 2023 07:35:56 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 762B53F663;
	Tue,  9 May 2023 07:35:10 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] arm/arm64: dts: Fixes for v6.4
Date: Tue,  9 May 2023 15:35:08 +0100
Message-Id: <20230509143508.1188786-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-fixes-6.4

for you to fetch changes up to 55b37d9c8ba23d28c584aef0801fb1e60e4a817c:

  arm64: dts: arm: add missing cache properties (2023-05-08 20:40:36 +0100)

----------------------------------------------------------------
Arm FVP/Vexpress fixes for v6.4

Couple of fixes to address the missing required 'cache-unified' property
in the level 2 and 3 caches on some of the FVP/vexpress platforms.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: dts: vexpress: add missing cache properties
      arm64: dts: arm: add missing cache properties

 arch/arm/boot/dts/vexpress-v2p-ca5s.dts              | 1 +
 arch/arm64/boot/dts/arm/foundation-v8.dtsi           | 1 +
 arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts           | 1 +
 arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts | 1 +
 4 files changed, 4 insertions(+)
