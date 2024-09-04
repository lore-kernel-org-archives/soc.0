Return-Path: <SRS0=J1cx=QC=yeah.net=shawnguo2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139E2CD37B4
	for <soc@archiver.kernel.org>; Wed,  4 Sep 2024 14:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8204C4AF09; Wed,  4 Sep 2024 14:34:59 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.kernel.org (Postfix) with ESMTP id CB0F1C4CEC9;
	Wed,  4 Sep 2024 14:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB0F1C4CEC9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=9Shld
	YABk7P9h7k+h/BdEml5vDW3mZPuaLgYSHkG1LQ=; b=CPIvN9ERusO+2WE0TU33B
	o5nPJ2QVSDsf2AO1OPc/u5q5FolKP5KRDQhdeSn+nC1ZgekjQ2Ssm/6LGZooYX4E
	u3jE6JomgTufOuZynI/csqnCXOu3NG1YvTVDwWo37ckycKDI/EiaGhh+ZQw+l0ik
	vDdy5lLzmx4UWeCXHj0hV0=
Received: from localhost.localdomain (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHd9UEcNhmUkhrAA--.17423S2;
	Wed, 04 Sep 2024 22:34:45 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] i.MX drivers changes for 6.12
Date: Wed,  4 Sep 2024 22:34:34 +0800
Message-Id: <20240904143439.211552-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgCHd9UEcNhmUkhrAA--.17423S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxJF1xCrWrCrW5Zr1UWrg_yoWDZFg_CF
	9aqF1DWr4UWw18J3WjqF18ZryUKw1UGryxXr18trW3Jr17Jr15Jw4vqrWSvr1UWa1akrWk
	Ar4DJr1kJr18JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8Ta0PUUUUU==
X-Originating-IP: [114.216.210.89]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQxQZWbYQmJWcgABsT

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.12

for you to fetch changes up to 2ea2113b3dacf9cf616488f875f32584dad53ff8:

  bus: imx-weim: change to use devm_clk_get_enabled() helper (2024-09-01 17:06:33 +0800)

----------------------------------------------------------------
i.MX drivers changes for 6.12:

- A couple of imx-weim bus driver changes from Wu Bo to support compile
  test and use devm_clk_get_enabled() helper to clean up code a bit

----------------------------------------------------------------
Wu Bo (2):
      bus: imx-weim: support compile test
      bus: imx-weim: change to use devm_clk_get_enabled() helper

 drivers/bus/Kconfig    |  2 +-
 drivers/bus/imx-weim.c | 14 +++++---------
 2 files changed, 6 insertions(+), 10 deletions(-)

