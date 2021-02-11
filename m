Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAD5C433E6
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 08:18:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 313B364E9C; Thu, 11 Feb 2021 08:18:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8A0164DFF;
	Thu, 11 Feb 2021 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613031517;
	bh=x2tofSDiu1JNQFJDEzL+ZgZZ3odjG4WGo5Sqkcgl4c8=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=hyufnu3xIA48smBP7PP1bKwDuxuam9UKCc7HX9+bjes2jZKjyvYTobgYy6QhXpLxr
	 G0lzKirBjtWM87FKaQ49/SdeOQ6wL5TlpQHHHktEvt7ZePc193cxs2QfBKHXEIztsE
	 w2pOvLq8svU5TFiASyou2+AX57qot4sTvlSiTl9K3n1XkZgRERhejHImrSghycNCzD
	 JvPWHP0v+3DnTeC3qUQNHMwCzRUXWfgY+B+IqFi6XwCZRaDibf//L3Ufq2xZ5+fAKo
	 dXuClyEPrqg63trrik1hVaN+e9wuFBrPFM6XiYs7BKyUbJUkjJ9ubfKutzEGleJaYQ
	 3MCCrF+xFlmXA==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] memory: drivers for v5.12, part two
Date: Thu, 11 Feb 2021 09:18:29 +0100
Message-Id: <20210211081829.7317-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Second (and late) pull request, on top of previous one.

Best regards,
Krzysztof


The following changes since commit 50fc8d9232cdc64b9e9d1b9488452f153de52b69:

  memory: mtk-smi: Allow building as module (2021-01-26 20:47:51 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.12-2

for you to fetch changes up to 321b36c79c431957c8c599a9f9640096c305cd03:

  memory: tegra186-emc: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE (2021-02-08 18:15:45 +0100)

----------------------------------------------------------------
Memory controller drivers for v5.12, part two

Two minor cleanups and one fix for compile testing (when !CONFIG_OF).

----------------------------------------------------------------
Jiapeng Chong (1):
      memory: tegra186-emc: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE

Krzysztof Kozlowski (2):
      memory: ti-emif-pm: Drop of_match_ptr from of_device_id table
      memory: samsung: exynos5422-dmc: Correct function names in kerneldoc

 drivers/memory/samsung/exynos5422-dmc.c |  4 ++--
 drivers/memory/tegra/tegra186-emc.c     | 12 ++++++------
 drivers/memory/ti-emif-pm.c             |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)
