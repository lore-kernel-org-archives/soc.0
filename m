Return-Path: <SRS0=hiWS=LD=lists.freedesktop.org=dri-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118CDC48BCD
	for <dri-devel@archiver.kernel.org>; Wed,  9 Jun 2021 12:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6DDF613B8
	for <dri-devel@archiver.kernel.org>; Wed,  9 Jun 2021 12:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6DDF613B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=dri-devel-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0F06E929;
	Wed,  9 Jun 2021 12:11:10 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADFA6E929
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 12:11:07 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1lqx2q-0007WL-60; Wed, 09 Jun 2021 14:10:52 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1lqx2o-0004sn-Rb; Wed, 09 Jun 2021 14:10:50 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, soc@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 0/4] Mainline imx6 based SKOV boards
Date: Wed,  9 Jun 2021 14:10:46 +0200
Message-ID: <20210609121050.18715-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Message-ID: <20210609121046.6Ni5KX6dIi6LdFYCLonSPkzY460xfeNyXeIb4tbw_1A@z>

Mainline imx6 based DTs for SKOV A/S boards

Oleksij Rempel (3):
  dt-bindings: display: simple: add some Logic Technologies and
    Multi-Inno panels
  dt-bindings: vendor-prefixes: Add an entry for SKOV A/S
  dt-bindings: arm: fsl: add SKOV imx6q and imx6dl based boards

Sam Ravnborg (1):
  ARM: dts: add SKOV imx6q and imx6dl based boards

 .../devicetree/bindings/arm/fsl.yaml          |   5 +
 .../bindings/display/panel/panel-simple.yaml  |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   5 +
 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts    |  13 +
 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts    | 108 ++++
 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts     |  36 ++
 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts     | 128 +++++
 .../dts/imx6q-skov-reve-mi1010ait-1cp1.dts    | 127 +++++
 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi  |  58 +++
 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi       | 476 ++++++++++++++++++
 11 files changed, 964 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi

-- 
2.29.2

