Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459DFC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:42:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A8760ED4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15A8760ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dMw+eKgC48C+T3eItYpihFsSNt/S0bDxaXWyKcMt+JA=; b=pYPOJ1PHWgTXyS
	gpDd/4s8WeIg+Z+BSEUCO5tOR6lxgby6/+8lh2L0lBwzriIcrnljqNdmQt0/zmpcpP46+l0pJBtb7
	uImky8IZNqa9T1ZnrGrlnenxD+ST0ovTj/Cn3iuRCMq2cqQ+eIvVL/YgXABlXaB/NzTu52LJhZdYG
	cxMsLlImibG3PfmlPKq3dO6xQtzbKDUCQiy+Kgtj9RMnvVEWu5WKW9oRFg2t/IYQSkU9/mNJhlK4v
	CY0Zd+Aenj3yNs4p5zlpEIMr8ZUPsqRBZv8mLaV0XttiGo4yw9x5lnKIKme0HWixLoIMVRi2iDMR3
	1vufLQYV9koPYX9Re6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mefbw-00ECPj-NM; Sun, 24 Oct 2021 15:40:36 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mefbt-00ECOS-7T
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 15:40:34 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id d10so1268773qvl.13
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 08:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LV+Kgtvh7+La2ITtz0O2xUdXeTpFbYkBF1tkOGmeqvo=;
 b=W8sl0oty4LeSR/wD4twzLfVyyTY9S3Ml1JSOgTX1o8FBFMPDEzNMEbBGerE9WlXQ/+
 Vjw6h+ZFPZn8ivalJy7pppYq7YWG5czHuAsuVi76+baVObp20qqawXV6NR6YxZRCGE0r
 1NIzvWlXWaze7PK+kDq9J3yJfqC4H19jda0oKMKDauhnR2gBJ0txw9brYJg3PMuYpiB5
 sQ9j7b+mr2FKFCp8wDODpJ8ibvy0acsuanHLDqD7zVKYknWbM06zb5xeBft7o+/Gjj2S
 6fHMxbyR/dF1CYC9znrHTeE7rBr7ykQyUc32B4bHtn99qzj2bIXXFUW1lDoab8vAbPaB
 VU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LV+Kgtvh7+La2ITtz0O2xUdXeTpFbYkBF1tkOGmeqvo=;
 b=U3uvVu5oNSueopKRlX/ozbh61FX8L82oiKT9FqpBclC/8umVEkcwCxZlCndaQAaHj/
 jU71B/TzHm7Gbcw3HNaZ3KWWwmd32TmGpFkjQmCo8ZakJTtlZ3VM+fvhx1FecnCbcveL
 /nUt9yzFr+e9GzJv07+ke0NbOcDvziOAmp//s4c8mpdJzmeGGnR1Kb808asad+5017eR
 gHgzE4H1FmMwU3qZelzMVAsRbBRahoGqcWRK5ya8dCmA/4utt3cDDw3qe8x1JTYFGGWy
 G0j4Kc6/UuN/Mxtr7mZkbuNz3yz7HdSfNcTl1wWTF5GX6gtxOFskHrRa7rKzm7862W7M
 cTxg==
X-Gm-Message-State: AOAM532n/SFpAjjd9xmRFfaJW2jrRwdPsGfVVhUqSzk3hfJgbNITqffP
 q9s5A2Vx3OTgFYEU0BrLvgo=
X-Google-Smtp-Source: ABdhPJxrfcYCPfz68n11err6efPvJC+z85O2b06D7iuXsggzwGZIZGXiSuLoNWvtuBAH76Yljnt2Ww==
X-Received: by 2002:a0c:cdd0:: with SMTP id a16mr11304302qvn.40.1635090029708; 
 Sun, 24 Oct 2021 08:40:29 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 08:40:29 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org,
 giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 leonard.crestez@nxp.com, b20788@freescale.com, Mr.Bossman075@gmail.com,
 fugang.duan@nxp.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: [PATCH 00/13] This patchset aims to add initial support for the
 i.MXRT10xx family
Date: Sun, 24 Oct 2021 11:40:14 -0400
Message-ID: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_084033_299411_00A66936 
X-CRM114-Status: GOOD (  11.61  )
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
Message-ID: <20211024154014.i0Lg3d-IoQ_cd_vdKwC_ZyQ8BXO5hOXC0WCmDYB3jao@z>

Add initial support for the i.MXRT10xx SoC family
starting with the i.IMXRT1050 SoC.
This patchset contains:
- i.MXRT10xx family infrastructure
- i.MXRT1050 pinctrl driver adaption
- i.MXRT1050 clock driver adaption
- i.MXRT1050 sd-card driver adaption
- i.MXRT1050 uart driver adaption
- i.MXRT1050-evk basic support

Giulio Benetti (6):
  ARM: imx: add initial support for i.MXRT10xx family
  dt-bindings: imx: Add pinctrl binding doc for i.MXRT1050
  pinctrl: freescale: Add i.MXRT1050 pinctrl driver support
  dt-bindings: imx: Add clock binding for i.MXRT1050
  ARM: dts: imx: add i.MXRT1050-EVK support
  ARM: imxrt_defconfig: add i.MXRT family defconfig

Jesse Taube (7):
  dt-bindings: pinctrl: add i.MXRT1050 pinctrl binding doc
  dt-bindings: clock: imx: Add documentation for i.MXRT clock
  clk: imx: Add initial support for i.MXRT clock driver
  dt-bindings: serial: fsl-lpuart: add i.MXRT compatible
  tty: serial: fsl_lpuart: add i.MXRT support
  dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT compatible string
  mmc: sdhci-esdhc-imx: Add sdhc support for i.MXRT series

 .../bindings/clock/imxrt-clock.yaml           |  57 +
 .../bindings/mmc/fsl-imx-esdhc.yaml           |   1 +
 .../bindings/pinctrl/fsl,imxrt1050.yaml       |  85 ++
 .../bindings/serial/fsl-lpuart.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/imxrt1050-evk.dts           | 164 +++
 arch/arm/boot/dts/imxrt1050.dtsi              | 179 ++++
 arch/arm/configs/imxrt_defconfig              | 157 +++
 arch/arm/mach-imx/Kconfig                     |   9 +
 arch/arm/mach-imx/Makefile                    |   2 +
 arch/arm/mach-imx/mach-imxrt.c                |  19 +
 drivers/clk/imx/Kconfig                       |   3 +
 drivers/clk/imx/Makefile                      |   1 +
 drivers/clk/imx/clk-imxrt.c                   | 156 +++
 drivers/mmc/host/sdhci-esdhc-imx.c            |   7 +
 drivers/pinctrl/freescale/Kconfig             |   7 +
 drivers/pinctrl/freescale/Makefile            |   1 +
 drivers/pinctrl/freescale/pinctrl-imxrt1050.c | 349 ++++++
 drivers/tty/serial/fsl_lpuart.c               |   8 +
 include/dt-bindings/clock/imxrt1050-clock.h   |  72 ++
 include/dt-bindings/pinctrl/pins-imxrt1050.h  | 993 ++++++++++++++++++
 21 files changed, 2273 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
 create mode 100644 arch/arm/boot/dts/imxrt1050-evk.dts
 create mode 100644 arch/arm/boot/dts/imxrt1050.dtsi
 create mode 100644 arch/arm/configs/imxrt_defconfig
 create mode 100644 arch/arm/mach-imx/mach-imxrt.c
 create mode 100644 drivers/clk/imx/clk-imxrt.c
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imxrt1050.c
 create mode 100644 include/dt-bindings/clock/imxrt1050-clock.h
 create mode 100644 include/dt-bindings/pinctrl/pins-imxrt1050.h

-- 
2.33.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
