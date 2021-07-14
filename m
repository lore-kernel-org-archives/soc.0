Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D583C07E9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 04:56:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB75613B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 04:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB75613B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcpKyivexSPeSS/EXicNP0vryzqalFoXvX6WL6CvE5Y=; b=sQdm1oFg7835Ow
	ryrO67eNkE7qYTEdmY9PvxNI08ToQ8ekztWGq5wO97vNZwFH7mB8ZpsSJmJiEakV3oeq6tQfaH1F2
	nL9seuB2E7WOBOR6/50CZ2wm7ggwvvK64RYl4mDo8O5MCSJIjLmua2b/8UVOx7n1sISMnfzUUfYWa
	NFcU7ctdbP9FgeDggF2FE5dFAs4fCijZKHCu1TO93f8CJIbRRfAjZQrMnJC/zaG/FpigFn00zQfyF
	7+BiBz6pM8vcx98bYeD8DiFVjProQpgh3GW8SgIN18IqVRKJPZAlPIg1IK6OmL1KXiLM5VfJyAUCK
	WzSYKn7JWosxkLVcTLcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3WuK-00CJMO-WA; Wed, 14 Jul 2021 04:54:05 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3WuH-00CJLC-Ih
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 04:54:02 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1m3Wu8-0001DU-DG; Wed, 14 Jul 2021 06:53:52 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1m3Wu6-0002sE-KW; Wed, 14 Jul 2021 06:53:50 +0200
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
Subject: [PATCH v2 3/4] dt-bindings: arm: fsl: add SKOV imx6q and imx6dl based
 boards
Date: Wed, 14 Jul 2021 06:53:48 +0200
Message-ID: <20210714045349.10963-4-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714045349.10963-1-o.rempel@pengutronix.de>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_215401_658548_D2596558 
X-CRM114-Status: GOOD (  10.81  )
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
Message-ID: <20210714045348.QWSdIz3sRSdGbeKewnHjczm-kAUtdPlLEMMWW4oxA7Y@z>

Add SKOV imx6q/dl LT2, LT6 and mi1010ait-1cp1 boards.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1c827c1954dc..7520af510f06 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -221,6 +221,9 @@ properties:
               - prt,prti6q                # Protonic PRTI6Q board
               - prt,prtwd2                # Protonic WD2 board
               - rex,imx6q-rex-pro         # Rex Pro i.MX6 Quad Board
+              - skov,imx6q-skov-revc-lt2  # SKOV IMX6 CPU QuadCore lt2
+              - skov,imx6q-skov-revc-lt6  # SKOV IMX6 CPU QuadCore lt6
+              - skov,imx6q-skov-reve-mi1010ait-1cp1 # SKOV IMX6 CPU QuadCore mi1010ait-1cp1
               - solidrun,cubox-i/q        # SolidRun Cubox-i Dual/Quad
               - solidrun,hummingboard/q
               - solidrun,hummingboard2/q
@@ -377,6 +380,8 @@ properties:
               - prt,prtvt7                # Protonic VT7 board
               - rex,imx6dl-rex-basic      # Rex Basic i.MX6 Dual Lite Board
               - riot,imx6s-riotboard      # RIoTboard i.MX6S
+              - skov,imx6dl-skov-revc-lt2 # SKOV IMX6 CPU SoloCore lt2
+              - skov,imx6dl-skov-revc-lt6 # SKOV IMX6 CPU SoloCore lt6
               - solidrun,cubox-i/dl            # SolidRun Cubox-i Solo/DualLite
               - solidrun,hummingboard/dl
               - solidrun,hummingboard2/dl      # SolidRun HummingBoard2 Solo/DualLite
-- 
2.30.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
