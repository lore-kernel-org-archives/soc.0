Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448A4C433F5
	for <soc@archiver.kernel.org>; Fri,  3 Dec 2021 18:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6E3CC53FD2; Fri,  3 Dec 2021 18:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9B5C53FCE;
	Fri,  3 Dec 2021 18:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638555008;
	bh=3On54W2+JFXLZ+J6p7j+O73Dwm5Pbd7iUFUCyODnVrE=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=EPcrmHuzM1TKwSdR++r9kf5ocn7gIcZpu/+45i3vDW/hsEt95732wq1Ze2Dnoxbbo
	 N7QdFe1y+C1XNcxUXIjesvR3y/DnTK55KWdyX3JUgvx0JgLW8Lzq1Tzf5zEY/RSyKG
	 583NWtiQkxxYUQEGtRcKH9WUCDl+CXZYxBw3VboD/hoAfAZlASHNUvVRI7Vl0bgfzE
	 fmIaW58sbzW3Gh4exmOJCKLeOPdZeBGLt2wdVRIncplFNK77T0aJDi7sBJSvZsXDyS
	 XXZpSxQlPsIDHI4yK7adRDJNHXy9VP++6BcNd0eq4H12YF6cM8Bg/7SqNX+kfXv0ai
	 9g2tfa64omURA==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] ARM: socfpga: fix for v5.16, part 2
Date: Fri,  3 Dec 2021 12:10:07 -0600
Message-Id: <20211203181007.3138381-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd/Olof,

please pull in this DTS QSPI fix for v5.16.

Thanks,
Dinh


The following changes since commit d58071a8a76d779eedab38033ae4c821c30295a5:

  Linux 5.16-rc3 (2021-11-28 14:09:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_fix_for_v5.16_part_2

for you to fetch changes up to cb25b11943cbcc5a34531129952870420f8be858:

  ARM: socfpga: dts: fix qspi node compatible (2021-12-03 11:44:36 -0600)

----------------------------------------------------------------
SoCFPGA fix for v5.16, part 2
- Fix QSPI dts entry to include "jedec,spi-nor"

----------------------------------------------------------------
Dinh Nguyen (1):
      ARM: socfpga: dts: fix qspi node compatible

 arch/arm/boot/dts/socfpga_arria10_socdk_qspi.dts   | 2 +-
 arch/arm/boot/dts/socfpga_arria5_socdk.dts         | 2 +-
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts       | 2 +-
 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts      | 2 +-
 arch/arm/boot/dts/socfpga_cyclone5_socrates.dts    | 2 +-
 arch/arm/boot/dts/socfpga_cyclone5_sodia.dts       | 2 +-
 arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts | 4 ++--
 7 files changed, 8 insertions(+), 8 deletions(-)
