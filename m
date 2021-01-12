Return-Path: <SRS0=gmZ6=GP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C05DC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 13:14:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CECE023104
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 13:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CECE023104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wIhFlAa1C5dz74KO2Fw9iWHh9LWdx3mcAPJ6oFqrhFM=; b=dInfv0BUk3XuPcjVQ1Hk5c0YDS
	wvudoKyvP2xDIsk//Rz44/gseNOA0iKwQ3wPTw+SUxNSZm4h6bV17hkQ56ieYjnXdnE7d+K8cfTvA
	dBpcQN0qHx4n/SImv4MZVVZpolDLbwUkdss+Ab8k0x50Ze5EYoKxKNSgWQxbcAH5tHWK3fP3BsWPd
	TMy5NLp7UkARLmf8eWmhJJZ9o1hbDk9r1uWRnC4pISccGagosZ0sZPpu2F7Y2xjNIgnUd7eMemFSr
	oKq9/3k4o2t1FU+VHLdNhWOAfChQ8ICk1kZIThL9qXxIdsdzBHPva1QycptbzMvJHRtONXJrPJRAh
	gXwclxmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzJTT-0007mA-4G; Tue, 12 Jan 2021 13:12:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzJTM-0007kN-Iv
 for linux-arm-kernel@lists.infradead.org; Tue, 12 Jan 2021 13:12:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43AEE23104;
 Tue, 12 Jan 2021 13:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610457150;
 bh=JKQ4LQEsDxZgCXNYQifwAHKLlxIN++/SKJ6lh19Xi60=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=H+wpJbxdHoIHMegONJ/JiJ+mx7CWn4TYX0DPO4PXBjFZ/wNo0/VvdexpHiGvJi4Wz
 KDXR+i/KhVsHUrluhAkE3D230wj0f7tZpHf+Ogx3B8sRVQNQ3SWysf+7aNwvDcla/f
 tR9bieMtIm4HBBi+Re+SV49NdQu4fRX7n6w+La7OPBL1CzkcIg3DEUT+Y7rWPo8ZE9
 zN4HA1tPMvNIu2l8837J4XlqTouTia73WP941XKamroP5obssQs7y8f4J4of6Z5OS+
 SFBuwJwBR4sx7TUsEGjZ1N3h6qqIltZMrA3knZ0B3zHhHebSaoFPXUnVIU1RxqHf4+
 fPwczaGYhYA1A==
Date: Tue, 12 Jan 2021 21:12:25 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] i.MX fixes for 5.11
Message-ID: <20210112131224.GI28365@dragon>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_081232_759182_D6ACA9A6 
X-CRM114-Status: GOOD (  10.05  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210112131225.JS3j5pXuIDMw8QZ9dwh61u4O0M-wwDqGacD7LNMdbD8@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.11

for you to fetch changes up to 5a22747b76ca2384057d8e783265404439d31d7f:

  ARM: dts: imx6qdl-gw52xx: fix duplicate regulator naming (2021-01-11 11:41:17 +0800)

----------------------------------------------------------------
i.MX fixes for 5.11:

- Fix backlight pwm on imx6qdl-kontron-samx6i which is lost from
  #pwm-cells conversion.
- Fix duplicated bus node name for i.MX8MN SoC.
- Fix reset register offset on LS1028A SoC.
- Rename MMC node aliases for imx6q-tbs2910 to keep the MMC device
  index consistent with previous kernel version.
- Selecting ARM_GIC_V3 on non-CP15 processors to fix one build failure
  with i.MX8M SoC driver.
- Fix typos with status property on imx6qdl-kontron-samx6i board.
- Fix duplicated regulator-name on imx6qdl-gw52xx board.

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: imx: fix imx8m dependencies

Koen Vandeputte (1):
      ARM: dts: imx6qdl-gw52xx: fix duplicate regulator naming

Marco Felsch (2):
      ARM: dts: imx6qdl-kontron-samx6i: fix pwms for lcd-backlight
      ARM: dts: imx6qdl-kontron-samx6i: fix i2c_lcd/cam default status

Michael Walle (1):
      arm64: dts: ls1028a: fix the offset of the reset register

Shengjiu Wang (1):
      arm64: dts: imx8mn: Fix duplicate node name

Soeren Moch (1):
      ARM: dts: tbs2910: rename MMC node aliases

 arch/arm/boot/dts/imx6q-tbs2910.dts            | 7 +++++++
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi          | 2 +-
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi  | 6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi      | 2 +-
 drivers/soc/imx/Kconfig                        | 2 +-
 6 files changed, 14 insertions(+), 7 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
