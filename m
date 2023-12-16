Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB60C38147
	for <soc@archiver.kernel.org>; Sat, 16 Dec 2023 06:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23832C433C8; Sat, 16 Dec 2023 06:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DA2C433CC;
	Sat, 16 Dec 2023 06:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702709187;
	bh=+qao/yERtxq3fikc9dlJaJbTJRFg3+DhPk8hj5VFXTw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZIaZ5QYU3haBn/lkbeeMHbuFmZcCBYVX5y4SFtH84hCMZo+DJhRzPSLUqTjylt07S
	 d+39WMUoymYfV5TQxslWx2lhHyirDpw0nYff/G3iL5kfmtL8LhWTbwMLOH5VtzGSzw
	 F8bV3dUbXDNo0thRIrnVVeiH9I94MexvmZUEO52mB7xvssAdVKXEcWv4FzdewEpV+S
	 GKgsYB6FiNEXAgaRrYhkY5jUKHj3OZXprPWYbKdqWrasG8lUPUxsBG2hqg1rSYXkeH
	 lFgQM16irnWsYW9/mgh4kqo4/aXUzSUyoLnHFWywWFSREf78blSGWYa99etjxTn2hr
	 CGaHKlv/mJiBg==
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
Subject: [GIT PULL 2/5] i.MX SoC change for 6.8
Date: Sat, 16 Dec 2023 14:46:02 +0800
Message-Id: <20231216064605.876196-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231216064605.876196-1-shawnguo@kernel.org>
References: <20231216064605.876196-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.8

for you to fetch changes up to c8705471b94d0d869e2e3ac80c0d960f0215474f:

  ARM: mxs: Do not search for "fsl,clkctrl" (2023-12-06 11:21:43 +0800)

----------------------------------------------------------------
i.MX SoC change for 6.8:

- Update mach-imx MMDC driver to use device_get_match_data().
- Drop the use of "fsl,clkctrl" from mach-mxs platform code, as it's
  an undocumented compatible.

----------------------------------------------------------------
Fabio Estevam (1):
      ARM: mxs: Do not search for "fsl,clkctrl"

Rob Herring (1):
      ARM: imx: Use device_get_match_data()

 arch/arm/mach-imx/mmdc.c     | 9 ++++-----
 arch/arm/mach-mxs/mach-mxs.c | 4 +++-
 2 files changed, 7 insertions(+), 6 deletions(-)
