Return-Path: <SRS0=P+pf=KD=yeah.net=shawnguo2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F66C54E4F
	for <soc@archiver.kernel.org>; Mon, 26 Feb 2024 03:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C46EC43609; Mon, 26 Feb 2024 03:42:47 +0000 (UTC)
Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.kernel.org (Postfix) with ESMTP id AFBA3C433C7;
	Mon, 26 Feb 2024 03:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AFBA3C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=WCVo5
	MuHl/wvlVWvwzWYEKtaMEK03ZJXtafReRrrmC0=; b=Py64c8fixS5Yq8WYIsJNQ
	g3Kb/Ox954oGeJSj3XIlNMzply37EVWxBrpUDYHNyYVMSgirwa4kpiwqlUTArxys
	BVB22cAKVNuZ2l9sp/OnMK6SQUFROlQsOArzABMMGBOWhFWglgOmMTrfHksSNPyV
	ZCZAOrR+EwkFi8MHubypB4=
Received: from localhost.localdomain (unknown [183.213.196.200])
	by smtp1 (Coremail) with SMTP id ClUQrACHSyCmCNxlT1hhBA--.22032S6;
	Mon, 26 Feb 2024 11:42:32 +0800 (CST)
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
Subject: [GIT PULL 5/5] i.MX defconfig for 6.9
Date: Mon, 26 Feb 2024 11:41:46 +0800
Message-Id: <20240226034147.233993-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226034147.233993-1-shawnguo2@yeah.net>
References: <20240226034147.233993-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ClUQrACHSyCmCNxlT1hhBA--.22032S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrKry8Ww4rur43uw1fXrb_yoWkuwb_AF
	y7G3WDWrWUurWxG3Wa93WfJrWUK3WxJ34UJr1UtrZxWw42qr1UJ3y8XFWrWr18X3W5Gr9F
	yrWDA3WDAr4jkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU09ID5UUUUU==
X-Originating-IP: [183.213.196.200]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBQiQZVsVCUT1-QAAsz

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.9

for you to fetch changes up to f1a9ff95971a879572f56bbc8b1e1ca0b1a812b8:

  arm64: defconfig: enable i.MX8MP ldb bridge (2024-02-06 18:34:58 +0800)

----------------------------------------------------------------
i.MX defconfig for 6.9:

- Enable VF610 GPIO driver for both arm64 and i.MX ARM defconfig.
- Enable i.MX8MP LDB bridge and i.MX8QXP support drivers in arm64
  defconfig.

----------------------------------------------------------------
Alexander Stein (1):
      arm64: defconfig: Enable i.MX8QXP device drivers

Martin Kaiser (2):
      ARM: imx_v6_v7_defconfig: enable the vf610 gpio driver
      arm64: defconfig: enable the vf610 gpio driver

Yannic Moog (1):
      arm64: defconfig: enable i.MX8MP ldb bridge

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 arch/arm64/configs/defconfig         | 8 ++++++++
 2 files changed, 9 insertions(+)

