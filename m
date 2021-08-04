Return-Path: <SRS0=2Com=M3=lists.freedesktop.org=dri-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64F9C4338F
	for <dri-devel@archiver.kernel.org>; Wed,  4 Aug 2021 04:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A18C160C3F
	for <dri-devel@archiver.kernel.org>; Wed,  4 Aug 2021 04:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A18C160C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F156E9B8;
	Wed,  4 Aug 2021 04:35:35 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C949C6E9B6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 04:34:58 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1mB8c6-0006Ou-SG; Wed, 04 Aug 2021 06:34:42 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1mB8c4-00034a-VY; Wed, 04 Aug 2021 06:34:40 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, soc@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v34 0/3] Mainline imx6 based SKOV boards
Date: Wed,  4 Aug 2021 06:34:36 +0200
Message-ID: <20210804043439.11757-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Message-ID: <20210804043436.HhUxnqq8C2yyL_qQFPTUHYdqHGfYW5h5UszZqdBwnJI@z>

changes v4:
- add vref-supply to adc@0
- split gpio assignment for the mdio node

changes v3:
- drop panel bindings patches, it is already in drm-misc-next
- remove some new lines
- reorder compatibles at the start of the nodes
- use lowercase for hex value
- add enable-active-high to the regulator-vcc-mmc-io and fix MMC voltage
  configuration.

changes v2:
- remove unnecessary newlines.
- change linux,wakeup to wakeup-source
- change switch@3 unit-address to @0
- sort aliases alphabetically

Mainline imx6 based DTs for SKOV A/S boards

Oleksij Rempel (2):
  dt-bindings: vendor-prefixes: Add an entry for SKOV A/S
  dt-bindings: arm: fsl: add SKOV imx6q and imx6dl based boards

Sam Ravnborg (1):
  ARM: dts: add SKOV imx6q and imx6dl based boards

 .../devicetree/bindings/arm/fsl.yaml          |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   5 +
 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts    |  13 +
 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts    | 106 ++++
 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts     |  36 ++
 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts     | 128 +++++
 .../dts/imx6q-skov-reve-mi1010ait-1cp1.dts    | 127 +++++
 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi  |  54 ++
 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi       | 477 ++++++++++++++++++
 10 files changed, 953 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi

-- 
2.30.2

