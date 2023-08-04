Return-Path: <SRS0=P5IO=DV=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7627DC001DF
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 12:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5481CC433CA; Fri,  4 Aug 2023 12:32:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 390AAC433C8;
	Fri,  4 Aug 2023 12:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 390AAC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E95D1007;
	Fri,  4 Aug 2023 05:33:09 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 13AD63F5A1;
	Fri,  4 Aug 2023 05:32:24 -0700 (PDT)
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
Subject: [GIT PULL] arm64: dts: juno: Update for v6.6
Date: Fri,  4 Aug 2023 13:32:23 +0100
Message-ID: <20230804123223.3258086-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-update-6.6

for you to fetch changes up to cc958441ed412f74049c0c00c97f1310d941f9ff:

  arm64: dts: arm: minor whitespace cleanup around '=' (2023-07-13 14:00:43 +0100)

----------------------------------------------------------------
Armv8 Juno/FVP update for v6.6

Just a single minor whitespace cleanup in couple of FVP device trees.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: arm: minor whitespace cleanup around '='

 arch/arm64/boot/dts/arm/corstone1000.dtsi        | 20 ++++++++------------
 arch/arm64/boot/dts/arm/foundation-v8-gicv3.dtsi | 10 +++++-----
 2 files changed, 13 insertions(+), 17 deletions(-)
