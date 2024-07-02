Return-Path: <SRS0=Dzy4=OC=yeah.net=shawnguo2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E91EC3065C
	for <soc@archiver.kernel.org>; Tue,  2 Jul 2024 14:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BA22C2BD10; Tue,  2 Jul 2024 14:22:26 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.kernel.org (Postfix) with ESMTP id 95E22C4AF0C;
	Tue,  2 Jul 2024 14:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95E22C4AF0C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=fJGOS
	gdVp0Hn/2898k6m+f1wBA96bh0G9Zwp20Yi6ho=; b=EUNwOHyUIBEi1i5xCFb8P
	zw5QUIUlxIrtQg2OXZvHashbCj8xYAhyCNBuvYsTh4yslzF/28pFNc62p8vbxrxl
	i/nIzpj65VZmy4n6OEqk5BpmVJk5/4YWNfKXvzj+1xaEpd94x626OHZtn9SLstVW
	jMludpC3PXldNrDD4zVjcM=
Received: from localhost.localdomain (unknown [114.218.218.47])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3H+0TDYRm7sMJAA--.947S2;
	Tue, 02 Jul 2024 22:22:12 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX SoC change for 6.11
Date: Tue,  2 Jul 2024 22:21:49 +0800
Message-Id: <20240702142153.413061-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgC3H+0TDYRm7sMJAA--.947S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry7Zr4DAFyrurW7KrykKrg_yoWfXwc_Ga
	4xJa18Jr4UJFyUAw15WrykAF1UtF1UJFy7Jw1Dtr4UJwnrtw1UA3sxXr4UXw1qq3WxGryD
	Ar4UJr1UCw15AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8Tq2tUUUUU==
X-Originating-IP: [114.218.218.47]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBQQZWZqrzOkwAAAsR

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.11

for you to fetch changes up to e2106e6ad20e495ce59e552748330d2749070ee6:

  arm64: layerscape: remove redundant EDAC_SUPPORT selection (2024-06-03 09:58:30 +0800)

----------------------------------------------------------------
i.MX SoC change for 6.11:

- Remove redundant EDAC_SUPPORT selection from ARCH_LAYERSCAPE

----------------------------------------------------------------
Baruch Siach (1):
      arm64: layerscape: remove redundant EDAC_SUPPORT selection

 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

