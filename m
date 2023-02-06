Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8141C05027
	for <soc@archiver.kernel.org>; Mon,  6 Feb 2023 16:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CCE21C433EF; Mon,  6 Feb 2023 16:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561C3C433D2;
	Mon,  6 Feb 2023 16:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675700809;
	bh=cvlkF2moKqRYWYh68rf7LZClSIAIHf7L0F/n+EarcS8=;
	h=From:Subject:Date:List-Id:To:Cc:From;
	b=Is628KAC6s+DO5n2OnjpOrDx/zrxNSMRkRFbSHD+DOBmRz2J432dk1f9Alb/7aURi
	 gZVlOAm3/Xdropfs+TQ2lMBWuuHZIG8fbk5hVGIToelB6OpAvEU/N53kQ0ZrNWOv2m
	 gEy/qddTEhDiI3/c2JNB16MrKKvkcBy8b46giq9noCYsghUxt5KcWaUvn2Y1zGR4vA
	 0RFvmc02DAWlD8g9/fMt4E0gXAxYXvBaTQ/buroJcgrA8/8Fs6MVX9Al4INLCHa9sJ
	 BAL5ylTuPEXh98dNJ2xYEsZS7Ms7QL6BjpeFAf5B3kBJ2eYymiYMNN2YGKX/TaGxPi
	 v/vVH/dgP4h6A==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] arm64: configs: Provide slimmed down configuration for
 guests
Date: Mon, 06 Feb 2023 16:26:32 +0000
Message-Id: <20230203-arm64-defconfigs-v1-0-6d0d03a6dbd2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADgq4WMC/x2NQQqDQAwAvyI5d2G7WpF+pfQQY6KhdLck0Ari3
 117nIFhNnA2ZYd7s4HxV11LrnC9NEAL5pmDTpUhxdTGFNuA9u67MLFQyaKzB4odyU2wT8MANRv
 ROYyGmZYz/BV7nfpjLLr+T4/nvh9uXddXeQAAAA==
List-Id: <soc.lore.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, soc@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cvlkF2moKqRYWYh68rf7LZClSIAIHf7L0F/n+EarcS8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj4SpF2kzo+TQoE9str2cZ5kY1ShsH+XIX6DgoStPT
 S0aEN3GJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY+EqRQAKCRAk1otyXVSH0AIRB/
 0QQt/UtnC4Jkpl1+buU9L3NhR/3YOsuygKzVrg/VswQiJKmE3tov6uS55A9oE+BDMt479gHn3lDeVV
 JX7UT21AZ6ORFr2E4V3a5MOBh9Zf8B95sZMV5S8o0fubBnpsFWaUSYs8IOjShXXrPYfwYHBw/tsN2r
 VoddFQ+fmofPoNC6T+JDx/kvO27/FKguXcvzZoozxr/2SISTGDG3Vq+OJ/+EBi7ynV4RIGGzUXIpcg
 rguNgNzSstcYGlqVG8zC72hW0w5KptKClzL+WsCVg6zv3TDJ+COfViSNpJIhsnWP3iF/xx/xxQrjse
 jf3WaBNpfreyDddfm9d+xca1CvzSeR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

It has been noted that due to the extensive platform support it
enables the arm64 defconfig is rather large and takes a while to
build in comparison with other architectures which can be a
burden when doing cross architecture work, especially when
testing is mainly in emulation.  We can mitigate this by providing
a configuration that only enables the support required to run in
mach-virt, this will be much smaller and quicker to build.

Having two completely separate configurations would mean that we'd
need to make any changes to the architecture wide configuration in
both the existing defconfig and the new configuration if we wanted to
ensure consistent default behaviour.  We can reduce this by splitting
the existing defconfig into a base fragment which enables options for
the architecture itself and one for platform configuration which has
all the platform enablement options, merging them to produce
defconfig.  We can then add another fragment enabling only options for
mach-virt and merge that with the base config to provide a new
virtconfig configuration.

The split of configurations is somewhat arbitrary, there will be some
room for discussion there, and it may be that splitting things up in
this manner is considered more trouble than it's worth.  If we're
going to start doing this then there may also be some desire for other
configurations. 

This is based on current -next since it's very late in the
release cycle.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      arm64: configs: Split defconfig into base and platform configs
      arm64: configs: Add virtconfig

 arch/arm64/Makefile                                |  10 ++
 arch/arm64/configs/base.config                     | 169 +++++++++++++++++++++
 arch/arm64/configs/{defconfig => platforms.config} | 169 ---------------------
 arch/arm64/configs/virt.config                     |  43 ++++++
 4 files changed, 222 insertions(+), 169 deletions(-)
---
base-commit: 4fafd96910add124586b549ad005dcd179de8a18
change-id: 20230203-arm64-defconfigs-c04cf5fa6288

Best regards,
-- 
Mark Brown <broonie@kernel.org>

