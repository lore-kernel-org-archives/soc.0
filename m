Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AE9C43334
	for <soc@archiver.kernel.org>; Sat,  9 Jul 2022 08:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8CBD2C3411C; Sat,  9 Jul 2022 08:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B55C341CE;
	Sat,  9 Jul 2022 08:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657355416;
	bh=4VXNpZ+1c0HYLqUy66CY+WX1n+S60Ih+iZzQnEwO4t8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=StFkLJycBOKxnPQnu2UwCsiKpTry9ZkHGT4nrXPLyUTiL+RQV2uuFf3Byhlxd/20+
	 Y2B2rsNjGjlWOMK/yN0bLMf1JJMFz0zG4pc0iFQgQ1u4do9g+/C7oBr8E/8zm41rS3
	 sXllZqEgk2qQOjcZXtnUYcQVZK+PJv/hpuEiUz6xDf+c9wJi/684pz3dqn5jjKlwCv
	 YDnQIvyzX8i68auL8eJlhTTEFCFWKygACHd2xpXgbOBZ8wLE0JfT7rUitW13CLkZyx
	 Z4LUOn3YRJfCvYmAIT2P7zlZKHP2rzdurnAuWdMrp+pR1BQWwFZW4vynpNpZxAUffC
	 2kuDrrT2niEGQ==
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
Subject: [GIT PULL 2/6] i.MX SoC update for 5.20
Date: Sat,  9 Jul 2022 16:29:47 +0800
Message-Id: <20220709082951.15123-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220709082951.15123-1-shawnguo@kernel.org>
References: <20220709082951.15123-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.20

for you to fetch changes up to 9fc792e596f17a1440dfeffb52e6786d6e53d90b:

  ARM: imx25: support silicon revision 1.2 (2022-06-19 11:40:00 +0800)

----------------------------------------------------------------
i.MX SoC update for 5.20:

- Update the mx25_read_cpu_rev() function to support silicon revision 1.2
  for i.MX25 SoC.
- A minor indentation fix in Kconfig file.

----------------------------------------------------------------
Juerg Haefliger (1):
      ARM: imx: Kconfig: Fix indentation

Martin Kaiser (1):
      ARM: imx25: support silicon revision 1.2

 arch/arm/mach-imx/Kconfig     | 6 +++---
 arch/arm/mach-imx/cpu-imx25.c | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)
