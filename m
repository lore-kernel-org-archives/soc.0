Return-Path: <SRS0=P+pf=KD=yeah.net=shawnguo2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BED5C54E49
	for <soc@archiver.kernel.org>; Mon, 26 Feb 2024 03:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3BE0C43399; Mon, 26 Feb 2024 03:42:46 +0000 (UTC)
Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.kernel.org (Postfix) with ESMTP id BB54BC433F1;
	Mon, 26 Feb 2024 03:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BB54BC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=cqF81
	qDD4N3PeSvI3Q4uAzxaYk9df0aRoAWAWMBdASo=; b=WCHeIwUBQv+Y8qZ6uEos/
	MlrHfoCvnRnHZVhjR5muNsuH7Llxi7k95mElPkmj3y1ONqCtfrIaR2oXgiRZ3l70
	8+Lf7QYHxGPkzEG/quFRP/SGwNum6cSnD2k+ZHX7ViqSKpMBemrdnrwlyqpvKa28
	rNNQ6T430/4ThB2j0DMHUA=
Received: from localhost.localdomain (unknown [183.213.196.200])
	by smtp1 (Coremail) with SMTP id ClUQrACHSyCmCNxlT1hhBA--.22032S2;
	Mon, 26 Feb 2024 11:42:31 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX SoC changes for 6.9
Date: Mon, 26 Feb 2024 11:41:42 +0800
Message-Id: <20240226034147.233993-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ClUQrACHSyCmCNxlT1hhBA--.22032S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrKry8Ww4rur43uw1fXrb_yoWfCrb_CF
	yUXa18JrWUXr1Yy345KF1rZr17tw17Jr1UGr9FgFW7Ar1xJF4DJr1kJrWFvr1DXF1fAryU
	Jr4UJw1rJF12kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU84lk7UUUUU==
X-Originating-IP: [183.213.196.200]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGAiQZV6Nnjbw4QAAsP

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.9

for you to fetch changes up to 0d04e84db74d94732821ec515365109d12a9491c:

  ARM: imx: Remove usage of the deprecated ida_simple_xx() API (2024-02-05 17:23:28 +0800)

----------------------------------------------------------------
i.MX SoC changes for 6.9:

- Remove usage of the deprecated ida_simple_xx() API from MMDC code.

----------------------------------------------------------------
Christophe JAILLET (1):
      ARM: imx: Remove usage of the deprecated ida_simple_xx() API

 arch/arm/mach-imx/mmdc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

