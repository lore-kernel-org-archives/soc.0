Return-Path: <SRS0=rOi0=HY=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D30C4332F
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 11:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27BF3C433CB; Wed, 13 Dec 2023 11:58:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id F35ECC433C7;
	Wed, 13 Dec 2023 11:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F35ECC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F2A9C15;
	Wed, 13 Dec 2023 03:59:15 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6BC4C3F762;
	Wed, 13 Dec 2023 03:58:28 -0800 (PST)
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
Subject: [GIT PULL] arm64: dts: juno: Updates for v6.8
Date: Wed, 13 Dec 2023 11:58:25 +0000
Message-ID: <20231213115826.3577764-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-update-6.8

for you to fetch changes up to fb4d25d7a33f568bcbb945e64fb94d18ddf229fd:

  arm64: dts: juno: Align thermal zone names with bindings (2023-12-12 10:04:51 +0000)

----------------------------------------------------------------
Arm Vexpress/Juno update for v6.8

Just a single update to align the thermal zone names with bindings matching
[alphanumericals]*-thermal pattern.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: juno: Align thermal zone names with bindings

 arch/arm64/boot/dts/arm/juno-base.dtsi | 12 ++++++------
 arch/arm64/boot/dts/arm/juno-scmi.dtsi | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)
