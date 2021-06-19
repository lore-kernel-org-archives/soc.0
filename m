Return-Path: <SRS0=QEH7=LN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9702C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jun 2021 15:57:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94F7D61154
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jun 2021 15:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94F7D61154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3NllU0ODBwj92d+cmHG2fyIo+FtCJ6q+i6vpJY/80m8=; b=rFtMa+OBc1SWOk
	iY/OcdAgk9LLNGYqHMoXuaj0yrwjKihWfxsy5KBbrxlmNH7qtHPgoRmjJD6nlXDP7LiODchgGHW25
	xKN7mxyUSEX5cIObm+mHHxXRcqXZMPD4GcfocDNghfotYH8Ed6RKf+IP/05bkupWg2tGtmozNOV3g
	ar9Fou2j4zFLVSmQ04kBoLmwcJ9CGDkGl3992DsymZ0B2WLXOCHegpUW+uU8V68yzphTlbMc6y1hM
	vq+3HHi7JK6dgseQ/qBjvfe0j7x5APaGneniWMy9d6ALE2MCFoiRwJzEIUvV1ck4EuFqZ1osq18r7
	zmv3O/AzhiSWsvT2BvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ludJu-00HEVv-AE; Sat, 19 Jun 2021 15:55:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ludJq-00HEVL-Oz
 for linux-arm-kernel@lists.infradead.org; Sat, 19 Jun 2021 15:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vittaj5sOJEfeo9ZvwVSPJoRPela2MzSdhI9sYKDpDw=; b=LOzY/HAZuDZ79V+3Y0FTbFTEvL
 ZAqsCDY+GGpM5uAMihmeg24GGspkgSKVu+9K4Khdb4KWFQ/BJ24+zSnTkUgWy8HEEio9VaQJBmT42
 De0RFYybhZg2fFYi28HHqyjKRsWFx8BniJiczrSDnqgSPfyEaTiIDWmPyKm3cbI6zJ7Mo8JnJoeXJ
 bh/TO4CsKnY4oBHlgFs0d56Fnzil1gouicQQPkJSb3+/XtFdjyr0Zfkzl/yhiyC01XziYwu3e1XvZ
 Mzu2waXFK9rRzzvv9ypLnknARwxDSz+w9kmeZsnLf65VJu8+dv4wyo/1Ijh9K1AUpWqJTMfLdL5Gy
 F4jgAvIw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56500 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1ludJe-0002ao-Kq; Sat, 19 Jun 2021 16:55:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1ludJe-0001rQ-8c; Sat, 19 Jun 2021 16:55:26 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add SolidSense boards
MIME-Version: 1.0
Content-Disposition: inline
Message-ID: <E1ludJe-0001rQ-8c@rmk-PC.armlinux.org.uk>
Date: Sat, 19 Jun 2021 16:55:26 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_085539_006083_9022AE3E 
X-CRM114-Status: UNSURE (   7.54  )
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
Message-ID: <20210619155526.tVud96K5Nc0-jb2yktP16dSzpgBnL9CAhODWlcz9xvY@z>

Add SolidRun SolidSense boards.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 297c87f45db8..24b6d75c11ad 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -223,6 +223,7 @@ title: Freescale i.MX Platforms Device Tree Bindings
               - solidrun,cubox-i/q        # SolidRun Cubox-i Dual/Quad
               - solidrun,hummingboard/q
               - solidrun,hummingboard2/q
+              - solidrun,solidsense/q     # SolidRun SolidSense Dual/Quad
               - tbs,imx6q-tbs2910         # TBS2910 Matrix ARM mini PC
               - technexion,imx6q-pico-dwarf   # TechNexion i.MX6Q Pico-Dwarf
               - technexion,imx6q-pico-hobbit  # TechNexion i.MX6Q Pico-Hobbit
@@ -379,6 +380,7 @@ title: Freescale i.MX Platforms Device Tree Bindings
               - solidrun,cubox-i/dl            # SolidRun Cubox-i Solo/DualLite
               - solidrun,hummingboard/dl
               - solidrun,hummingboard2/dl      # SolidRun HummingBoard2 Solo/DualLite
+              - solidrun,solidsense/dl         # SolidRun SolidSense Solo/DualLite
               - technexion,imx6dl-pico-dwarf   # TechNexion i.MX6DL Pico-Dwarf
               - technexion,imx6dl-pico-hobbit  # TechNexion i.MX6DL Pico-Hobbit
               - technexion,imx6dl-pico-nymph   # TechNexion i.MX6DL Pico-Nymph
-- 
2.20.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
