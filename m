Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E297EE49A5
	for <soc@archiver.kernel.org>; Wed, 23 Aug 2023 02:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4AC1BC433C9; Wed, 23 Aug 2023 02:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9295C433C8;
	Wed, 23 Aug 2023 02:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692757092;
	bh=clAHOIUUeAdVvLq+JT5tAbfDXbpy6PiZpBYvwLQ2dy8=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=FlgQrYxsoUdd47KdijymI4sEVQs+XTMLg8OBfJZ5XjwCpe+WbbeR2XFXrEXApfLBE
	 18vrY3UjlGV8c80BkmVPIES+OvtxVv9d0/xLV/6s0tnQHJornli8mH5D72EWpzOCGy
	 Oem4RnPwdgIgjIqvanSuWl5CIE1viltJxBr7AWG4sC67apkCA31w6D1haGDOn3o+h3
	 9G43+5oSTDhBe1IHlFRsrpKxZLEAoKsthn1q6/mQvSlbxEuJTFamdsoZsJpbzkPRgG
	 40nONA4Ey0khqrz8dAvTsxY7WpRRXv07h/TwT/t6hCeDYvtzhV+3URwOeIX4ZitnBx
	 Iyu+Jfi3tF1ig==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] ARM: socfpga: update for v6.6
Date: Tue, 22 Aug 2023 21:18:10 -0500
Message-ID: <20230823021810.958072-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_update_for_v6.6

for you to fetch changes up to 37e2d7d23765c3948e21cb361100f1baeb65f4f3:

  ARM: socfpga: Explicitly include correct DT includes (2023-07-20 14:38:38 -0500)

----------------------------------------------------------------
SoCFPGA mach update for v6.6
- Clean up DT includes in mach-socfpga

----------------------------------------------------------------
Rob Herring (1):
      ARM: socfpga: Explicitly include correct DT includes

 arch/arm/mach-socfpga/l2_cache.c | 2 +-
 arch/arm/mach-socfpga/ocram.c    | 4 +---
 arch/arm/mach-socfpga/pm.c       | 2 ++
 arch/arm/mach-socfpga/socfpga.c  | 4 +---
 4 files changed, 5 insertions(+), 7 deletions(-)
