Return-Path: <SRS0=DM4H=MZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51519C4320A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 10:38:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2140160F70
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 10:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2140160F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/0RkXCWUwOFhIqmrZzPsf6l0xaBfGh7Irn6ctl1g/lU=; b=aEWymkSjA58rj3
	wYksYO40AOI50u2fowXD7hfT9D/Yym7FNdB7SHx9kAtIrU+hVQcxhOEBTX2/FocamH7p+PLYSusKU
	GE4Qaj5U1bk+TosefZQk0dYMFbmZ/dJJDwFgVDT3JcUWsrpZYhqHrDf+bcl2e0JxUORdHxthZPzdL
	vhUtqgjMm40TyIoBBZd6yNOd3Pu7sG/c978S2/ypk1B8XkPodMvU2Bd3Ea2fKe+837mKxLTN63mcW
	nC/xBBTNTzmIetEODiIM/lJEX9S/x6fOxniKTQeHeHy6Evc33yMY1fPRCr2XbXjwzIZMAjwasxQOI
	ZBNHoSOOKlc2+WQ7qing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAVJe-00Flrz-9p; Mon, 02 Aug 2021 10:37:02 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAVJ5-00Flc9-IN
 for linux-arm-kernel@lists.infradead.org; Mon, 02 Aug 2021 10:36:28 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1mAVIk-000238-KJ; Mon, 02 Aug 2021 12:36:06 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1mAVIj-0007TR-0i; Mon, 02 Aug 2021 12:36:05 +0200
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
Subject: [PATCH v3 0/3] Mainline imx6 based SKOV boards
Date: Mon,  2 Aug 2021 12:36:00 +0200
Message-ID: <20210802103603.28607-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_033627_651438_1960711D 
X-CRM114-Status: GOOD (  12.80  )
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
Message-ID: <20210802103600.PoLj5KoI0IWeFjnGAemn3ZwOpT5XTi_6DqiqoBBEziU@z>

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
 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi       | 476 ++++++++++++++++++
 10 files changed, 952 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi

-- 
2.30.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
