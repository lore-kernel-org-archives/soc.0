Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB40C433C1
	for <soc@archiver.kernel.org>; Wed, 31 Mar 2021 04:10:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 04BCB619E3; Wed, 31 Mar 2021 04:10:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36DB8619DE;
	Wed, 31 Mar 2021 04:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617163840;
	bh=cfDWLfWZyaUvinkgMTUFtNENs54GRQ6bKrqYv61Q6ug=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=chqu+d6qkRUHvYuNn+73GQ6RNVEf1xCDjkC/fbAfVrU0GNx1Zf1d/z5W3KVrbWeea
	 GpSsnbsE8SfA/gELmFTq8ri9wNTLFrD7GivkKQP/8I48pPdNc/+IsU09oMVc8UjcXX
	 StWciQn6LDed2uYB/p9kXhs+yAYELDzLz3wZeTg9vTSi19cb1MrSUEkpkcKGK7bTGF
	 zlWZDRwP6plcVcbklv+vxwrKE/ap/Ki9m4m6utJYXLLAarhfDxzsp4EscGOjkwQVpk
	 8RNJINVCY9LGQWTKqQ6MdbR5SjNAPvlSzLqP5Di99mo5yZDWvo6ZNUBXnB+J0kNucy
	 T1HhiWr9+7eOQ==
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
Subject: [GIT PULL 2/6] i.MX SoC update for 5.13
Date: Wed, 31 Mar 2021 12:10:15 +0800
Message-Id: <20210331041019.31345-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331041019.31345-1-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.13

for you to fetch changes up to f21a468832f43fdc896e29d1ed8488ba45eeb630:

  ARM: imx: Kconfig: Fix typo in help (2021-03-15 12:21:59 +0800)

----------------------------------------------------------------
i.MX SoC update for 5.13:

- A couple of typo fixes on help text and comment.

----------------------------------------------------------------
Bhaskar Chowdhury (1):
      ARM: mach-imx: Fix a spelling in the file pm-imx5.c

Nobuhiro Iwamatsu (1):
      ARM: imx: Kconfig: Fix typo in help

 arch/arm/mach-imx/Kconfig   | 2 +-
 arch/arm/mach-imx/pm-imx5.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
