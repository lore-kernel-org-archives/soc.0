Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AF9C433B4
	for <soc@archiver.kernel.org>; Mon,  5 Apr 2021 15:50:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5837761242; Mon,  5 Apr 2021 15:50:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBCDE613A3;
	Mon,  5 Apr 2021 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617637828;
	bh=plOVgI4LGVoBmO3BXhYn0AoleGWw5cqkeyjVMw4xDBw=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=q/5h57BL6Nk48FjTfbpv2CXHLiTes03XOI6hK5nlwO5rLPNAcT5h2kOj3qPdyA1Mp
	 jwy4ttLuoIWejs1l2L3hIuUDoKJedBk9/c7K/NopjCdj4pFlD52N7oJrQoouDPeAeB
	 SKVil21fR/cD/zEtKS2OCOkX0dYfkq32FtJiVfEVgjz2TxfHi0NKhDzOu8gUTQBIij
	 WvIJnrY/Du8KcSs1zSq+T3tEZHIya/udbKyafK+R3NLzvc8Rm8XJTOeKEHKUoPWGaL
	 Dqf+hileJmNgcP8HQ8EoahnWLFnLundzMPrbQswRq7qob7MtRXahpviNTq+EK03qNJ
	 jcltUJHRPOpOg==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] SoCFPGA firmware update for v5.13
Date: Mon,  5 Apr 2021 10:50:26 -0500
Message-Id: <20210405155026.86309-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd, Kevin, and Olof:

Please pull in this patch for v5.13.

Thanks,
Dinh

The following changes since commit 4483397b03536506535d611b0cb28a81a69e8edf:

  ARM: socfpga: drop ARCH_SOCFPGA (2021-03-23 11:03:36 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_update_for_v5.13_part2

for you to fetch changes up to 38ad957b04c5c2c9effc6336365187dae1301051:

  firmware: stratix10-svc: build only on 64-bit ARM (2021-04-04 07:41:43 -0500)

----------------------------------------------------------------
SoCFPGA updates for v5.13, part 2
- Only build Stratix10 Service Layer and RSU drivers on ARM64

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      firmware: stratix10-svc: build only on 64-bit ARM

 drivers/firmware/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
