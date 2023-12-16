Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68152C4167B
	for <soc@archiver.kernel.org>; Sat, 16 Dec 2023 06:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 289FBC433CA; Sat, 16 Dec 2023 06:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758C5C433C7;
	Sat, 16 Dec 2023 06:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702709189;
	bh=LLxgoJG18VDR07HUv24HGkgRl3LPp1P62gXn0F9pe84=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rK1JxJPQJc+stxDxUp7qMC2TS5MKoRC5j7G74gMqbeTdMqyfqINoc3bY8FIsSMEGl
	 9JvJmv652hzzcUgYru+0torY1egIc1hQYm4BsywTZckbulDFoUrHy5Q+UeDIn/0WTg
	 gruNMJQC0divZqOIpNFEv5CuO+MTx0EjB7FDzTtnSWDHbD17tVH1KqLnlZBMstz5N4
	 Shq7gG0pWO5PajEhQCM1BUBuxylVj9s39inNvHyWcGElC3pIvgmPZDXcwaHHGxKJ1u
	 UcBF4nOjWuMV3VjX65/13MmqtNLJWfn31SwZiaPoYVZkdlxQgC/KKhmIDGApDhVV8c
	 XyvwJWFptmMiQ==
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
Subject: [GIT PULL 3/5] i.MX DT bindings for 6.8
Date: Sat, 16 Dec 2023 14:46:03 +0800
Message-Id: <20231216064605.876196-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231216064605.876196-1-shawnguo@kernel.org>
References: <20231216064605.876196-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindgins-6.8

for you to fetch changes up to 6cbac23b309cc6454779703a741392df4e80455f:

  dt-bindings: arm: fsl: add Dimonoff gateway EVK board (2023-12-14 10:49:21 +0800)

----------------------------------------------------------------
i.MX DT bindings for 6.8:

- New vendor prefix for Dimonoff and echarge Véhicule Électrique (RVE).
- New board compatible for TQ-Systems LX2160A, RVE gateway, Dimonoff
  gateway EVK, i.MX8M Mallow and SKOV i.MX8MP RevB board.

----------------------------------------------------------------
Gregor Herburger (1):
      dt-bindings: arm: fsl: Add TQ-Systems LX2160A based boards

Hugo Villeneuve (4):
      dt-bindings: vendor-prefixes: add rve
      dt-bindings: arm: fsl: add RVE gateway board
      dt-bindings: vendor-prefixes: add dimonoff
      dt-bindings: arm: fsl: add Dimonoff gateway EVK board

Joao Paulo Goncalves (2):
      dt-bindings: arm: fsl: add verdin imx8mm mallow board
      dt-bindings: arm: fsl: add verdin imx8mp mallow board

Oleksij Rempel (1):
      dt-bindings: arm: Add compatible for SKOV i.MX8MP RevB board

 Documentation/devicetree/bindings/arm/fsl.yaml     | 22 +++++++++++++++++++++-
 .../devicetree/bindings/vendor-prefixes.yaml       |  4 ++++
 2 files changed, 25 insertions(+), 1 deletion(-)
