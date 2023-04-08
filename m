Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166D3C77B61
	for <soc@archiver.kernel.org>; Sat,  8 Apr 2023 10:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6A86C433D2; Sat,  8 Apr 2023 10:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB81C433EF;
	Sat,  8 Apr 2023 10:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680949204;
	bh=SKZgt/L7ZEU/qJCGp4F/kRHpD0xgaGiBJ3y8qkzmiuw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cMYb87bw/SZeIsrDtTv+upMFK1MHMzQR6j1O63MqGtQiPUcw3yRyYQn7XxdGu04Mp
	 ZbU/YfqCx2x8L8W+Ll+R1/BDVvB4RF+AXYuon/kVQVRufKrIJ2piBJK87l4Bt1UgTy
	 z0keli2lxqvXsGnz2D1/MNhjoE7bGniVsz/P6LgVrdLw9HN4Pf8RKAJo+8fplHHHOS
	 MVR55xIh4Hthpq9ikHPYHn0LkH+uTwGTKXqAImLxJPzftNrZB9R2E6e6gIWndHKzS/
	 kFxIYhwbIVHEi3ixb0qnzl8oAjDkPMdMgDnJaWoxt44P7XETpMidVFS2F8PQI9WFPB
	 Xvdxyie8ZxHmA==
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
Subject: [GIT PULL 2/6] i.MX SoC changes for 6.4
Date: Sat,  8 Apr 2023 18:19:24 +0800
Message-Id: <20230408101928.280271-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230408101928.280271-1-shawnguo@kernel.org>
References: <20230408101928.280271-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.4

for you to fetch changes up to 614bef7e2727f35ff7edb7f41354e4e5c655590c:

  ARM: imx: Use of_property_read_bool() for boolean properties (2023-03-14 15:06:00 +0800)

----------------------------------------------------------------
i.MX SoC changes for 6.4:

- A couple of changes from Oleksij Rempel which make it possible
  to configure Ethernet refclock from device tree.
- Use common DT helpers to test DT property presence and read boolean
  properties.

----------------------------------------------------------------
Oleksij Rempel (2):
      ARM: imx6q: skip ethernet refclock reconfiguration if enet_clk_ref is present
      ARM: mach-imx: imx6ul: remove not optional ethernet refclock overwrite

Rob Herring (2):
      ARM: mxs: Use of_property_present() for testing DT property presence
      ARM: imx: Use of_property_read_bool() for boolean properties

 arch/arm/mach-imx/gpc.c         |  2 +-
 arch/arm/mach-imx/mach-imx6q.c  | 10 +++++++++-
 arch/arm/mach-imx/mach-imx6ul.c | 20 --------------------
 arch/arm/mach-mxs/mach-mxs.c    |  2 +-
 4 files changed, 11 insertions(+), 23 deletions(-)
