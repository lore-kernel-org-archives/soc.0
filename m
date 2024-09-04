Return-Path: <SRS0=J1cx=QC=yeah.net=shawnguo2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568C7CD484E
	for <soc@archiver.kernel.org>; Wed,  4 Sep 2024 14:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47DE8C4AF0C; Wed,  4 Sep 2024 14:35:01 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.kernel.org (Postfix) with ESMTP id 3E948C4CEC2;
	Wed,  4 Sep 2024 14:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E948C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hDOXS
	cFcU0Sau6VzH8T3ZGln0E1JuqZRxY9ENQWOuu0=; b=dg8YdzT2lhNDpjva/t1c8
	I6K+RlfmPKIjN9eJ7OFZC/eFug3WFMYixxRzEImd6dmL9d4O590z+zwbaWpC9vfQ
	UTUBimK+HU2rEZ/G95ooywltDYMlxe00u+WQMfJeNAovCnC6vqyyW/eCYaQgxkKr
	/PjT6qCSWPnfCEI/cDxAkM=
Received: from localhost.localdomain (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHd9UEcNhmUkhrAA--.17423S3;
	Wed, 04 Sep 2024 22:34:46 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] i.MX SoC changes for 6.12
Date: Wed,  4 Sep 2024 22:34:35 +0800
Message-Id: <20240904143439.211552-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904143439.211552-1-shawnguo2@yeah.net>
References: <20240904143439.211552-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgCHd9UEcNhmUkhrAA--.17423S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxJF1xCrWrCrW5Zr1UWrg_yoWkKrc_ZF
	y3X3W8Jr4UGF1UA3WUKw10qr4Utr48JFy8Zryktw42vr1xJr1UA34ktr4xXw1UWa1SyrW5
	Ar4DJw1Yyw15GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8Tq2tUUUUU==
X-Originating-IP: [114.216.210.89]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAghQZWbYQht0KQAAsF

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.12

for you to fetch changes up to 1ec2362084a013df4d78cbfd3228e8c254a67cac:

  ARM: imx: Annotate imx7d_enet_init() as __init (2024-09-01 15:36:35 +0800)

----------------------------------------------------------------
i.MX SoC changes for 6.12:

- One cleanup from Fabio Estevam to remove Ethernet refclock setting
  from i.MX6SX machine code
- One change from Nathan Chancellor that annotates imx7d_enet_init() as
  __init to clears up a section mismatch seen with the recent LLVM

----------------------------------------------------------------
Fabio Estevam (1):
      ARM: mach-imx: imx6sx: Remove Ethernet refclock setting

Nathan Chancellor (1):
      ARM: imx: Annotate imx7d_enet_init() as __init

 arch/arm/mach-imx/mach-imx6sx.c | 22 ----------------------
 arch/arm/mach-imx/mach-imx7d.c  |  2 +-
 2 files changed, 1 insertion(+), 23 deletions(-)

