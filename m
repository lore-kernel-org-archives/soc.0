Return-Path: <SRS0=soWq=NK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FC3C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 14:08:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62D4E6113B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 14:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62D4E6113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziswiler.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ma5DvHPITSWKSebXVm9Mif/JxWlxKgikpCM/YpMHs9Q=; b=3PT+n8viTgvOni
	IGX/xKQ1Xi8cfZW3cu2Yepu2RZvFcvjsYX8S8AEc1lBvT2iMKRYmdHwATF4mRzAQytFF4KIh7sRMu
	GxnM3w5EHnzKtnVkatP5G87TfgX6cLuOzUsyriGooI0/oUCw442ewoeyCdan0aJcIbWp9clvzIJgA
	Fut9hc9OP8RJZxMX8xySQ98Xc/RLon2HO6GH1PYj0p9eaq5axsRTUFNzGydjrudPKN/IT8PAucGEX
	lfFjRudoD6d1OGzgLuBimDCZfcPOvtaUrCcO8rJqzf27vrEjAl4+GN4bvp295158Y/EDE1Tw6WoG1
	SKaxIjjle2l4xF0YgDfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGigL-008YUm-0Y; Thu, 19 Aug 2021 14:06:09 +0000
Received: from mout.perfora.net ([74.208.4.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGif8-008Y4T-N8
 for linux-arm-kernel@lists.infradead.org; Thu, 19 Aug 2021 14:04:56 +0000
Received: from toolbox.cardiotech.int ([81.221.236.183]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id
 0M7ZR3-1n1pE204ut-00xMEi; Thu, 19 Aug 2021 16:03:57 +0200
From: Marcel Ziswiler <marcel@ziswiler.com>
To: linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Andreas Kemnade <andreas@kemnade.info>,
 Andrii Nakryiko <andrii@kernel.org>, Anson Huang <Anson.Huang@nxp.com>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Fabio Estevam <festevam@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Marek Vasut <marex@denx.de>, Martin KaFai Lau <kafai@fb.com>,
 NXP Linux Team <linux-imx@nxp.com>, Olof Johansson <olof@lixom.net>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, soc@kernel.org
Subject: [PATCH v1 0/7] ARM: prepare and add colibri imx6ull 1gb (emmc) support
Date: Thu, 19 Aug 2021 16:03:38 +0200
Message-Id: <20210819140345.357167-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:lx5GBGXPRAQ1C2RGAY9/BxYJ6AKfNJ32vg25PpQG17n/6Pk2u7J
 j0IrCvlaDcncp28bcdtMZIR/DwKQVvCWFr7vbql1AglQzGyZwh9oLK0G32II0gQxXr+KoEO
 YlarmDCsgoaZn3VKxmD9TDVL/XOw4pV+gxmsZRPGcCYDGOQ0+6A7pOHxAyDkALGxGqTawBq
 oh5ehsLsIEqorCggir/4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zxIafc4BlW8=:MZu7xopxkSoQxDPOR+f7ht
 X9CwQW4Hm7a7K7DvQN6oet+kwt0AeAKewsW7Rds20sxGXu4Lt2Ni/mpc+vuIGIweWyCLrFMsP
 ES3GnD4tj73pR0zyHAosxbRb27GyIyBrWsDJjB3Xgt9TEc2VQqiMXJp02yJOJOPJRXQ5MPBwm
 oA5Bf9/qqyRwGFLY7PK4k+G0ROjgUMbMpU2l2vRumTgqtdrvMSx06fAUZRaL7jTjKPDva/LD+
 2MlI3vC/uRhE2TIBudmDhdFv/sTAz3K996wnMNvOsKkZBhPu9vflXHu1ZryQhyl8uuCjFh/f9
 KzJG3dCtNXws6+e9D1P68Qj/gBQSwS7Gr+eM7hEFtE80x2TR6m4uwva6bmN0CnQdLpEPwnX++
 qBDKtHUZGbeqkbLzrSQOTHBURORvZX2JbxvVpmgwYe+XsecYvAFznTbQr0yeFdTLVG5vUCQWV
 2zEBKeff2X8cUfHZzKnFqz2bWPLhG7NIm0Ko81JKQsNK0Aav+J4k0CN5A+uikExGXaUFs7QpT
 fNygYQ1qj2iEwUdkmsNmZz51ldfiaiuiMOwnIqji4kJX2vFR5IkQerQQLLs7+mWJlaZCQhhGC
 DLTpYU2Nnh29rEQO7u+h8tih3ew22F5fl/fGL2ZrnuFEiad3Rmh1/GiC2Zd1Z1umZipT6+vLR
 pQeW6vL9QjjTOYSLBLgyB/lyF6QFr8y4OghuyLR1lFj9wqRr/w6QNyOOknsSsuCG8E9DmAX7r
 /Tzdpn3On/QY7m1WSBr/ZWsSAV8/1CCGaF2XcmvHPbZfbf7EYycgXegoVz72SlFmNmC4U3rYR
 Nzp0ITSYRJHjX2Vk3xqvsics0vUo1DuTZYHuKxZd/GNxqLC3ehNA2el2Z+9RcP40rC17BG/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_070454_931419_5242375B 
X-CRM114-Status: UNSURE (   8.10  )
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

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>


Clean-up imx_v6_v7_defconfig and then add support for the new Colibri
iMX6ULL 1GB (eMMC) which builds on the success of the existing Colibri
iMX6ULL SKUs using raw NAND but replaces this by more RAM (1 GB) and an
eMMC (4 GB).


Marcel Ziswiler (6):
  ARM: imx_v6_v7_defconfig: enable mtd physmap
  ARM: imx_v6_v7_defconfig: enable fb
  ARM: imx_v6_v7_defconfig: change snd soc tlv320aic3x to i2c variant
  ARM: imx_v6_v7_defconfig: rebuild default configuration
  ARM: imx_v6_v7_defconfig: build imx sdma driver as module
  ARM: imx_v6_v7_defconfig: enable bpf syscall and cgroup bpf

Max Krummenacher (1):
  ARM: dts: colibri-imx6ull-emmc: add device trees

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/imx6ull-colibri-emmc-eval-v3.dts |  17 ++
 .../dts/imx6ull-colibri-emmc-nonwifi.dtsi     | 185 ++++++++++++++++++
 arch/arm/boot/dts/imx6ull-colibri.dtsi        |  30 ++-
 arch/arm/configs/imx_v6_v7_defconfig          |  46 ++---
 5 files changed, 249 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi

-- 
2.26.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
