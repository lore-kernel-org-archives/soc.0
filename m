Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C89C4167B
	for <soc@archiver.kernel.org>; Sat, 16 Dec 2023 06:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A8B7C433C9; Sat, 16 Dec 2023 06:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F61C433C7;
	Sat, 16 Dec 2023 06:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702709185;
	bh=2ulIbgkglISl2oHcUgdj9S6CEaiySIEl93/T9g4O7w4=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=TZ/3z1EAaiR/efzebdyFvY+EzEyrUuL2pBp+vd/5v2kcmiqD7WuwUu6jlzweNFlYy
	 r3/9A1xOLR/2zFsloEHB3oZLZrJWmMP9umcOlfjlMAcxNkDRnBuIFJIwWptxzuzGzN
	 kz2UlvDO2pFqE4zt4EtC4ZL3YLxHPGMBMbufz/P5ZEUjdeaouiiq9ZH3kIx31E8cfh
	 hynMqCO86EqJo8Sz9Z3/5qAThwl6OUKtSBjz/hKh9jZl6vJb4ENn8c2feYBLUWc+Xj
	 3sg4eh8ArixM/skj7CW67EHoKYCwQZjNfTxxHzUjodV6qSZ10QCrTxCrYumVuaOziK
	 TVYxHkg3EmUQQ==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers change for 6.8
Date: Sat, 16 Dec 2023 14:46:01 +0800
Message-Id: <20231216064605.876196-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.8

for you to fetch changes up to fcefbb49ebb7ad9f06ecee33ae87e4d7075728ff:

  bus: imx-weim: Use device_get_match_data() (2023-11-27 11:05:30 +0800)

----------------------------------------------------------------
i.MX drivers change for 6.8:

- Change imx-weim bus driver to use device_get_match_data()

----------------------------------------------------------------
Rob Herring (1):
      bus: imx-weim: Use device_get_match_data()

 drivers/bus/imx-weim.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
