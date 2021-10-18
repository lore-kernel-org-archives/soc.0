Return-Path: <SRS0=UpmX=PG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978F9C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 00:11:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6366560FF2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 00:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6366560FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BWGcl1vYiLz+vVTUe4wrCtls/rjsdXkQm5Hc7IUTyzE=; b=P5zXo19S6Qu2pN
	FCtKtXq3bf5d2biHtc2OvQqekWqyLd26jqDJaWqG24gygovIbg26ubxaAnCz/gxrzFO/TDYC6YWJB
	n6dXdeYFmPgvk4mkLy7BkfBNItDjX8ZOzlMKYj4xTJ/qF/Zou+wZ599rYwanGAXpjRuWrwDrPwfxa
	mtIthej2Gxm3MqBHv1AHTzOOeTSMkqzszPDnZP8LREXnLK6JbFzabCZc9NcLUbFcxxBn7VGAXdAf0
	JFKw2Q20j1J1NCtMkRQDsmusP4j1JEZTUlGLmNZ63RJfioBwktNl5J9aywrYn3e00ObuRRV4UwVb+
	riPi4tsQFjmfBcZ9mdEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcGEI-00DWj5-1x; Mon, 18 Oct 2021 00:10:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcGEE-00DWiT-HB
 for linux-arm-kernel@lists.infradead.org; Mon, 18 Oct 2021 00:10:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 086F060F9E;
 Mon, 18 Oct 2021 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634515809;
 bh=DWiEhkbm5/S9y24lWBiHqjrvXC61zA6uoExWq6A74Ug=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=cSFNGRDV6d4oIlVI0e5nOZdDCMay1M+HjKGpnUMKiWLu9rZCUiy7pQvWZzE0oxZZU
 1fRCMlnYSJUwk9uZ7DEp/urY/wvqu6xhZ+ZLqCN6AD9JfzcFiaNfQuM1od8QLZLQM/
 3yjsmFu5nOPazwRVA5wiVz5BHf5DvFkDE69xYKgrmOiF5FMlMb77gMtsHNrbHoowm8
 Vt9O6GGArVipB6GFHvNeb5Cq3uAC9ORv2l499Oxvn053yQaQezCc3ZB7RKoFdnRZ75
 hgxtgaYWR8GcSehrJDGpH0aSkoqJgm46w+M6t3jYZh0P0orLCLi96tczSXe1j//t/Y
 BfJ5n3b2jDksA==
Date: Mon, 18 Oct 2021 08:10:02 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
 linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.15, round 4
Message-ID: <20211018000958.GC25810@dragon>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_171010_621108_23757B5A 
X-CRM114-Status: UNSURE (   7.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211018001002.X27lXzXLaG1mQ4V2cSIi_0G7hW091YBqEMzg0Xtb6dA@z>

The following changes since commit a1467faa10414ab3d91be7ef6d2b11272ec00e95:

  ARM: imx: register reset controller from a platform driver (2021-10-15 09:38:06 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.15-4

for you to fetch changes up to 0b28c41e3c951ea3d4f012cfa9da5ebd6512cf6e:

  arm64: dts: imx8mm-kontron: Fix connection type for VSC8531 RGMII PHY (2021-10-16 15:30:00 +0800)

----------------------------------------------------------------
i.MX fixes for 5.15, round 4:

- A series from Frieder Schrempf to fix i.MX8MM Kontron N801x board on
  various aspects, voltage settings, GPIO polarity, SPI clock frequency
  and Ethernet PHY type.

----------------------------------------------------------------
Frieder Schrempf (5):
      arm64: dts: imx8mm-kontron: Make sure SOC and DRAM supply voltages are correct
      arm64: dts: imx8mm-kontron: Set lower limit of VDD_SNVS to 800 mV
      arm64: dts: imx8mm-kontron: Fix polarity of reg_rst_eth2
      arm64: dts: imx8mm-kontron: Fix CAN SPI clock frequency
      arm64: dts: imx8mm-kontron: Fix connection type for VSC8531 RGMII PHY

 arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dts    | 8 +++++---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-som.dtsi | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
