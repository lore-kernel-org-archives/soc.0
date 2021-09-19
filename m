Return-Path: <SRS0=fR60=OJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FED9C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Sep 2021 13:00:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B33B610A3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Sep 2021 13:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B33B610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziswiler.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SEnQYC4uxUWy5o52xu7h2sZZCeAFEir/PChhlFPx4zU=; b=haN3xVaJuszFyn
	sdWZkaP7Shn2XkU63at1heSrsA37xI0wbXrL9jIPtD9YvcXOG/8LKfhVaBcfNa51nPc4KEAIRd/N8
	Jy9ha8bHEIgHOya8aj+xwt/jDLSemJHH4oWpaHxi1e4iA4LAnP6+yKjQvFLWqg2xUotgyouzLlPiI
	B0DQoPJYkixzkEN/tRXrq2kGmXdXsx4Xy8VMi8m6l7K5S/EbLZqDSG7WFk7OSXNVmVwxmfL86zOPh
	upknP7NO+qQ0JChl4UEbBmeoUKmQoSW0F9G1z86VVtdjjlm87dUNkDtE7BQOkWqUXPs2afffvKCH6
	kjLiD8VnL1K4Ax/JK25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRwPD-00HHmg-TE; Sun, 19 Sep 2021 12:58:52 +0000
Received: from mout.perfora.net ([74.208.4.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRwN4-00HGsm-P3
 for linux-arm-kernel@lists.infradead.org; Sun, 19 Sep 2021 12:56:40 +0000
Received: from localhost.localdomain ([81.221.236.183]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id
 1Mk0iC-1nCFXq27NA-00kNtD; Sun, 19 Sep 2021 14:55:51 +0200
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
Subject: [PATCH v3 0/9] ARM: prepare and add colibri imx6ull 1gb (emmc) support
Date: Sun, 19 Sep 2021 14:55:27 +0200
Message-ID: <20210919125536.117743-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:yuHgL3suxeZmdwsdlRvLWnSFvJn72p/B2Q+ZQMEX0ze4w1sIYue
 y5CCiA2Zjt4hqEwc22z/ciodKapEGTsgjSZShBuM/nYLBbNnaXur+tYDPaHdgJvqz8WYdZx
 HRtEiZYYcRkwUx+8TzP8GU0gXZmwORQYNE4dom17cic0jOMbzX+lEu3b9EqtdIeg5a3ap2p
 U+nLna7CUpHhSTMhHZiLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4pLuSYrx7r0=:D+0o56dgmtQTlUwxMTBXpY
 ej4Vj3DrdFy5Bhcy4iFBN7UFMLXF9p1ZktceuqBkqPU19t5/ppDxw9gyEH6QLAEYREb98lxUa
 cyDFqVcrrDDyaMOEOEfX0a1BaRY/Dvif7lLLC1YjDCGVkmcbf/gblePOSIrZRxufHz2L2evAu
 JflJaNUyw0cdADJQIW972jMipMhMsk64sb+VWu6ixoqrL7detfBONhFMumoDD8FAb4NdksdIg
 V2zRLtd+Zhy+pzIqjNbmqOAFy0Qn6Vq7bcJ1fE9m6ChhfLIIYjB7WPCHc659wZfI8pSNHIKaj
 XPL97aaQ5Pp/9Zdxeg6yjtVYD/ydii98KQcTrexBTRG3/Qx1MkfJFI9oEgHKRzAtl5mH56TiN
 E0JHZ0PpwGuX4NEgVFtPkrPpVGR58o61rWrNkDFG7DQz4Q3kJ5v5a2ASsKrCGvbHebz9FEZ7K
 Ynxh0oxZUaS1Dg9edMivS/pbpQeQAw1RBmIrFfAmUXyJZaKCcrBfWsUiqMnRWwaBE6xXydv4p
 Na/W/W1k2c2zKsqAD+6N6a2EurymF55/h1qcC5c6HJzGKR/jY53vwnN7q9bZ2lGp/IvIV8jOD
 j5nYHpcMmhSSecsD65++pwq+rcehlTMi+jpQTh6wMPu9Wn5TynHXzDDL8nQY0s/7oh53/AI8i
 Fs4wcOjae1pFtdWUXTLtInwlRKrBM+72kCU/1VovrGBb1asGARcsapPh6z9Gv9XIx5epPbwmg
 PNPt8pT4f8FEOVkKeA/Hq235+0pNcsbo+2OqGg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210919_055639_020304_1B8D40CC 
X-CRM114-Status: GOOD (  10.99  )
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
Message-ID: <20210919125527.WHzTuSP6GgFWt9XYLMGw5K41_5LYx5w5rwMfgYnDnng@z>

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>


Clean-up imx_v6_v7_defconfig and then add support for the new Colibri
iMX6ULL 1GB (eMMC) which builds on the success of the existing Colibri
iMX6ULL SKUs using raw NAND but replaces this with more RAM (1 GB) and
an eMMC (4 GB).

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
