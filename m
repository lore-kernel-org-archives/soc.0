Return-Path: <SRS0=J1cx=QC=yeah.net=shawnguo2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AB3CD4850
	for <soc@archiver.kernel.org>; Wed,  4 Sep 2024 14:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D34B0C4AF09; Wed,  4 Sep 2024 14:35:01 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.kernel.org (Postfix) with ESMTP id 3DB08C4CECC;
	Wed,  4 Sep 2024 14:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3DB08C4CECC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4bEuN
	S8X3brko8E5DQEV29rm5qF2XnQcrm45sbKPKRA=; b=GjKi2/KycJ29hXXDM0cH4
	ehDEIvbTBEgEXtHjb2eW7I3f50RPy7iXAJb8tADoZ0zB7coss5P4xY0anNAt0Ta4
	gsrwoouGF8/vP9oS0Jt7V7sh6pIEelQqojrQJwtyfBQokY+ef2ZAdeHvxLfs4SR/
	wtNsmKYIdV8pMDpxDxXENU=
Received: from localhost.localdomain (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHd9UEcNhmUkhrAA--.17423S7;
	Wed, 04 Sep 2024 22:34:48 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] i.MX defconfig changes for 6.12
Date: Wed,  4 Sep 2024 22:34:39 +0800
Message-Id: <20240904143439.211552-6-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904143439.211552-1-shawnguo2@yeah.net>
References: <20240904143439.211552-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgCHd9UEcNhmUkhrAA--.17423S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxJF1xCrWrCrW5Zr1UWrg_yoWfCFg_GF
	y8J3WxJr4UJr1xG3W5Xw1xArWUK3WUGa4UXry8tF47uF13tr13tw1UXr45Wr18X3WUCr4q
	yr4UAw1kJr1UJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8SJPtUUUUU==
X-Originating-IP: [114.216.210.89]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERlQZWbYQmJzlQAAsF

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.12

for you to fetch changes up to 7f66e5271706484b0ef127f070af737b0ce67585:

  arm64: defconfig: Enable ADP5585 GPIO and PWM drivers (2024-09-01 17:11:11 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.12:

- Enable ADP5585 GPIO and PWM drivers in arm64 defconfig, which are
  needed by i.MX93 11x11 EVK board.

----------------------------------------------------------------
Liu Ying (1):
      arm64: defconfig: Enable ADP5585 GPIO and PWM drivers

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

