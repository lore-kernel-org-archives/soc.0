Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687C4C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 20:37:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 07BEC64DAE; Mon,  8 Feb 2021 20:37:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AA8164E54;
	Mon,  8 Feb 2021 20:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612816626;
	bh=TyeD4K1P5vUntgNfyF2TCOemZLb/fT9iSjguOChf9ZI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=ctXqYScIlRy9apfRcxXFkUl+R6uLEWLQt8k2A4pm0gk14xHDkpKFHeZBiZ08hMQlD
	 SjZNtVLD+JHAxoWL87ZvN0NFNF+nauyt2VU91HGdYQf7dHzjnVUqUHKJ9NUwm33qR6
	 MXKWDiVDJjmjaDf9Hjd7decFs/0X31J3wRQWhjNKayugMWHCHCNgZEyiQgdFKGv04h
	 JNoM1bi+K+jLpVpJU7DFCiVcUilgum/LZrTwEX5LHJDVU950555+ENLm9ml4l6GnaH
	 r3kkZt7Aof77GtfrEBmwaQlQCLxfQQN/870y5wJ3eCyVgSwUigz4LkgFbTYP4ARKOq
	 yd4VOU2ZJTXQg==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] SoCFPGA DTS fix for v5.12
Date: Mon,  8 Feb 2021 14:37:03 -0600
Message-Id: <20210208203703.36109-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd, Kevin, and Olof:

Please pull in this SoCFPGA DTS fix for v5.12.

Thanks,
Dinh


The following changes since commit 1048ba83fb1c00cd24172e23e8263972f6b5d9ac:

  Linux 5.11-rc6 (2021-01-31 13:50:09 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_fix_for_v5.12

for you to fetch changes up to b7ff3a447d100c999d9848353ef8a4046831d893:

  arm64: dts: agilex: fix phy interface bit shift for gmac1 and gmac2 (2021-02-04 22:29:00 -0600)

----------------------------------------------------------------
SoCFPGA Agilex fix for v5.12
- Fix PHY interface register offset for GMACs

----------------------------------------------------------------
Dinh Nguyen (1):
      arm64: dts: agilex: fix phy interface bit shift for gmac1 and gmac2

 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
