Return-Path: <SRS0=0B9I=OK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E9BC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Sep 2021 14:58:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7860061077
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Sep 2021 14:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7860061077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziswiler.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LCaAity2nztNj8gq6sAVx6ozR30NtLAPYkIbt/j/E6w=; b=zVHa98gfRHCEN5
	PkLe7oacXSgIvdiwNkVoYAcnewNpMKnuLdPhjTrXwdkGc4riYJ9M6CrKhF86IPLb2lRyfVfZ7JTCR
	kh/61G0N9PS311/vCw5zPTuyHppaubOLSZLYvFiok0fAdMp9wFuDp9+6PYcv16lhxhE3N7e5RtSTK
	qkPhvALqsoiEV+BEviIBV0TL6AO/aJWpMQ4Ic4FQuVV1MUUXXfbAbs2HYQOtJvQoEYGBw3pJJp98x
	jAUEkWhQ6VDaDsMsblXUQAJIz1JgFqcy8h671HziteOEcCbtO/0DcEmk5wrtkxUXTb+keCI38pUqo
	ChEaJFI9cGEDPwMaEBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKiK-002577-2X; Mon, 20 Sep 2021 14:56:12 +0000
Received: from mout.perfora.net ([74.208.4.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKd1-0022oS-5z
 for linux-arm-kernel@lists.infradead.org; Mon, 20 Sep 2021 14:50:44 +0000
Received: from toolbox.cardiotech.int ([81.221.236.183]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id
 1Mlebm-1nAlzH1HYg-00iiwu; Mon, 20 Sep 2021 16:49:53 +0200
From: Marcel Ziswiler <marcel@ziswiler.com>
To: linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Andreas Kemnade <andreas@kemnade.info>,
 Andrii Nakryiko <andrii@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Fabio Estevam <festevam@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Kees Cook <keescook@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Marek Vasut <marex@denx.de>,
 Martin KaFai Lau <kafai@fb.com>, NXP Linux Team <linux-imx@nxp.com>,
 Oleksij Rempel <linux@rempel-privat.de>, Olof Johansson <olof@lixom.net>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Song Liu <songliubraving@fb.com>,
 Stefan Riedmueller <s.riedmueller@phytec.de>,
 Tim Harvey <tharvey@gateworks.com>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, soc@kernel.org
Subject: [PATCH v4 0/9] ARM: prepare and add colibri imx6ull 1gb (emmc) support
Date: Mon, 20 Sep 2021 16:49:29 +0200
Message-ID: <20210920144938.314588-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:W6WlD/PhwB5NKuiFUpbq9zYXddxkmRhEsbCoDh36Mxeat1DlEON
 baYPgNMQaaOYRUD+sjfJeTz3qWJ01lWwfhmedyQgI81Cc9YzB8yAvWb8UxLBabvhAcu0Mkh
 6meI6GczvELssYAKhp0LPVMZ63JDbHWphKK8GMUEb4nYy6D/+Uiu3wv7ubFJQkwgXZB72L4
 qHcmClI6P8P2DPy7I9raA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0npW3v9eBkk=:KYQSawvhWHVPhlqfYWAzeX
 zOK7+7ySLA9b0HdYea0hY+vHNh2EH5t5HAf1MJu/1luyhmjsFjmA4xAq7W1zpGSr7spPmyL57
 HQEMrZVjI2pbEGKad6Z4kCr9OQdJ7X0WMUIva9GcogKlEcnCaEg1JSRJ2rCHfwRTN7unBbXW6
 oK8M+z06biE7Lm0mfO2E/gBl8P8cU00HOLjN71NPhkndUW5avCXaAgnYzRqi1ovBr2Iqgbfkc
 Tg9+aY2vlvt9eqbflEKgz8yvPo+dLkMp519Mm9eNLWFT9pw2EQTKorK0njhy8za/lxXEgp9EJ
 8BiwRdxscZnGPWRCbxk8395r7s1bsr5PU6bLl2wT9Xat3DGPPl3iIDiZhNYlk4K3hiMvxVPcR
 X5Fpnx8qwtQZnj7UaOs8NFTcmGYsujamupIzkDRM6Q6MwivKVHNMAHbP86EbiNmrbPNmyn/pI
 UIjHlASeWULAcRAuAUp14PUI53qHJ1A+qL5s7SUsfTUdP+lLzwvewTeYLbnLLIIgx1TjKSaDY
 o9t8SHTUN44B49oBPo14yg/Qlzn7EzdnJrGCsU99Bjb5xkX5XkydumMuozCrRMYR3d6xM0rpF
 Pr80aH4hPaqKVauv892c/i4zrAs/BWmjH92wL2JqFWACLrn2p7cyTUmstlwvSHVhZLo+0d13J
 Oldr9nLrIGuGYakMSmIucmD7LGakCZshBNhj12D191do5ou0zQ9qBCs9mZdwPxpMuP+DM4Fd5
 gTdElzTYNgYxaMJgPn+d8OgpgiawbszJbKIkVA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_075043_384909_E7F33139 
X-CRM114-Status: UNSURE (   9.78  )
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
Message-ID: <20210920144929.nMkFrWfv-Z6gLh_RPtJq_5khOoO4CQ669VtXjGYfPbY@z>

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>


Clean-up imx_v6_v7_defconfig and then add support for the new Colibri
iMX6ULL 1GB (eMMC) which builds on the success of the existing Colibri
iMX6ULL SKUs using raw NAND but replaces this with more RAM (1 GB) and
an eMMC (4 GB).

Changes in v4:
- Fix dt_binding_check line too long warnings as pointed out by Rob.

Changes in v3:
- Add Fabio's reviewed-by. Thanks!
- Added fixes tag as pointed out by Stefan and Fabio. Thanks!
- Add Rob's ack. Thanks!

Changes in v2:
- New patch cleaning-up dt-bindings documentation.
- Fix indentation.
- Use latest agreed upon SPDX-License-Identifier GPL-2.0+ OR MIT.
- Drop AG in our copyright statement as recommended by our legal.
- New patch documenting dt-bindings.

Marcel Ziswiler (8):
  ARM: imx_v6_v7_defconfig: enable mtd physmap
  ARM: imx_v6_v7_defconfig: enable fb
  ARM: imx_v6_v7_defconfig: change snd soc tlv320aic3x to i2c variant
  ARM: imx_v6_v7_defconfig: rebuild default configuration
  ARM: imx_v6_v7_defconfig: build imx sdma driver as module
  ARM: imx_v6_v7_defconfig: enable bpf syscall and cgroup bpf
  dt-bindings: arm: fsl: clean-up all toradex boards/modules
  dt-bindings: arm: fsl: add toradex,colibri-imx6ull-emmc

Max Krummenacher (1):
  ARM: dts: colibri-imx6ull-emmc: add device tree

 .../devicetree/bindings/arm/fsl.yaml          |  87 ++++----
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/imx6ull-colibri-emmc-eval-v3.dts |  17 ++
 .../dts/imx6ull-colibri-emmc-nonwifi.dtsi     | 185 ++++++++++++++++++
 arch/arm/boot/dts/imx6ull-colibri.dtsi        |  32 ++-
 arch/arm/configs/imx_v6_v7_defconfig          |  46 ++---
 6 files changed, 299 insertions(+), 69 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi

-- 
2.26.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
