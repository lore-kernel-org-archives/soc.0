Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DD6C433E0
	for <soc@archiver.kernel.org>; Wed, 20 Jan 2021 01:23:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BB01423119; Wed, 20 Jan 2021 01:23:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36A2F23109;
	Wed, 20 Jan 2021 01:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611105816;
	bh=3XMp7r3uwsQPIvU9HuZsSm6jBJjP8EZw7eroKIDWj5s=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=mzhYw11IeJeEErqAzmELFc+xdO4K+MdeCeUhkvqpY24RHsQhoTl79B632iKGYnxKM
	 kv6/AQlx77HCot49laifnxenF1x+SuO398ANUdPML6o7bfZH7IdkhpinlzHLK5WRC+
	 t+w4VyWa7GRAZsHMAdLQJEdN0O+TlDyiCOaHioHf3ruXs6Vf0TjqyfS+h6C9A18dBv
	 X+W1JQypPcS6UPK+NnTV7oCRvlugrR81vOoGf+5edP06CkOmWCzYaTvWjL4ltCXI35
	 Aawyimt42fzhtai6G5RT9XJ9kp5DEn4l+wTJjaQFcXMdC1Gxoug69wM/LeopDyNyN6
	 02h21nYqC54iw==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] SoCFPGA DTS updates for v5.12
Date: Tue, 19 Jan 2021 19:23:34 -0600
Message-Id: <20210120012334.25730-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd, Kevin, and Olof:

Please pull in this SoCFPGA DTS fix for v5.122.

Thanks,
Dinh

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.12

for you to fetch changes up to b82a27075a0402386ba61c0404b47b69e7dc7911:

  ARM: dts: arria10: add PMU node (2021-01-07 12:30:00 -0600)

----------------------------------------------------------------
SoCFPGA DTS updates for v5.12
- Add DTS file for eASIC N5X platform
- Use generic ngpios in GPIO entries
- Add PMU node for Arria10

----------------------------------------------------------------
Dinh Nguyen (2):
      arm64: dts: n5x: Add support for Intel's eASIC N5X platform
      ARM: dts: arria10: add PMU node

Jisheng Zhang (1):
      arm64: dts: socfpga: Use generic "ngpios" rather than "snps,nr-gpios"

 arch/arm/boot/dts/socfpga_arria10.dtsi            | 13 +++++-
 arch/arm64/Kconfig.platforms                      |  5 +++
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi |  4 +-
 arch/arm64/boot/dts/intel/Makefile                |  1 +
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts   | 53 +++++++++++++++++++++++
 5 files changed, 72 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
