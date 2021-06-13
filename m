Return-Path: <SRS0=VOD1=LH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E8FC48BE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 08:27:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C1BC6108D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 08:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C1BC6108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZtUTiFiOF4FqIujicDFe1zzZ9jmLUyo0RtZDYrqfZ24=; b=2Vi1VThGitIa48
	xEO2u+3rX4BYySgmkAhqyWnMAcDoBDs6D8Mn9odnODXUz5bl6+aK+s1Zi0C/ta952csLiRKoOMlGZ
	y7b38Te9NUXs07yTthnzTyTAsgMGjv/NuhyrU4B4tKCmqWlGVn16xNFVAaG8RKqTXezJQgQzrFknL
	v0Evl8XjowEn1HP7AAVeB9AKQypcfUC5MjDRiTvITV8ntJ5WhkdOzRAPUsWsv0fYkhqXmEG2qYhvk
	KlEBaQ1Hd435lTDFrugEmuUkkJ1iagza0N5EbOHNBbtWNIdfSzQi1eYOFcGQhNEhzUEH7F/1xp/te
	CiXjbn3M/VyJ6vqIbccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsLRS-009wOy-VG; Sun, 13 Jun 2021 08:26:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsLRO-009wOC-UY
 for linux-arm-kernel@lists.infradead.org; Sun, 13 Jun 2021 08:26:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 268136120E;
 Sun, 13 Jun 2021 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623572757;
 bh=S22NKWmIySv0C1XXeyvBtUZxb6Y71pYcQkpVQR4QzpE=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=m51NhEC31jb+X43u/ZvdjFrGQVSymt/aiUbl8/K9gAWEGJGCvDWvU0hsSBQGMpCj+
 u4N9w7/ZAt6t4w+CvnUop1lb1JM34+yST9tVpggU2NEsBEClOR+fhI38A+VkPvmC/i
 CclUlsSAorbFjASCDcVXDrSQF9YMAk/sX03K8Im9UY42YeIgcCHZJlVwHbjXWTHHf9
 xbB9NWNyj+2ZPschG90PR1UIRua8cSj2xahbjrC3mTCwhOnBdHenFdFXKZ4OJsWnkZ
 K4M0dFEfd1fGksh0SYntNFjbk2VSc2vwjt/m9Rvlxoqps397t/j7wMKy0EKTUg1UT7
 Wr+398JAX6gnQ==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] i.MX drivers update for 5.14
Date: Sun, 13 Jun 2021 16:25:39 +0800
Message-ID: <20210613082544.16067-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_012559_026902_7200E47D 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210613082539.-dDTOk_ceOoC_ZQHOqGzO87sh8GvytFpcXXYW-lZ14w@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.14

for you to fetch changes up to 2a53b9d47b13ae8816ce5a7e5adeb77009d2ca4d:

  soc: imx: gpcv2: add support for i.MX8MN power domains (2021-06-12 11:51:28 +0800)

----------------------------------------------------------------
i.MX drivers update for 5.14:

- A patch series from Lucas Stach and Peng Fan adding i.MX8MM power
  domains support into i.MX GPCv2 driver.
- A couple of patches from Adam Ford adding i.MX8MN power domains on top
  of i.MX8MM power domain support.

----------------------------------------------------------------
Adam Ford (2):
      dt-bindings: add defines for i.MX8MN power domains
      soc: imx: gpcv2: add support for i.MX8MN power domains

Lucas Stach (11):
      soc: imx: gpcv2: move to more ideomatic error handling in probe
      soc: imx: gpcv2: move domain mapping to domain driver probe
      soc: imx: gpcv2: switch to clk_bulk_* API
      soc: imx: gpcv2: split power up and power down sequence control
      soc: imx: gpcv2: wait for ADB400 handshake
      soc: imx: gpcv2: add runtime PM support for power-domains
      soc: imx: gpcv2: allow domains without power-sequence control
      soc: imx: gpcv2: add support for optional resets
      dt-bindings: power: add defines for i.MX8MM power domains
      soc: imx: gpcv2: add support for i.MX8MM power domains
      soc: imx: gpcv2: Add support for missing i.MX8MM VPU/DISPMIX power domains

Peng Fan (1):
      soc: imx: gpcv2: move reset assert after requesting domain power up

 .../devicetree/bindings/power/fsl,imx-gpcv2.yaml   |   3 +
 drivers/soc/imx/gpcv2.c                            | 634 +++++++++++++++++----
 include/dt-bindings/power/imx8mm-power.h           |  22 +
 include/dt-bindings/power/imx8mn-power.h           |  15 +
 4 files changed, 559 insertions(+), 115 deletions(-)
 create mode 100644 include/dt-bindings/power/imx8mm-power.h
 create mode 100644 include/dt-bindings/power/imx8mn-power.h

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
