Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22681C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:43:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B0A52389A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B0A52389A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bIllvdbdfuXmBa3j2I7hPTVA2lI5JUWwXtGFj4ahknA=; b=A5WNF5YSI2Ck7+Axy7wGaT/vK
	kTZkawXjdDSQJU+AH3auy71YXAfSU9gjCg2RgB8T/Gd51pLBceS+Duin490/xofY1Pe66fBRNwNGi
	HapXakaO/JjdGiItC2Khh2aBQlQHHvR1syenISHjl9R7sc2Fmv4A2nh3a9g5f3gdRqc3fFqTpSG10
	k/2oy3iGLVWPvooNeRMPNNqJRu4eZ118KX7rJ2dvVReKAhLqNENVJ+cliGL2zNllQFB+Pb2lj9XYo
	jAsxF2Mb/XOPm0vMDnTk5Q6ZMTah4f61BUKDwFjU/cNcWe0g3H/Ta2YCrFf7Dj91Iy4Vubxcr0zb+
	QOmjHb+hQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2QrL-0006Ex-A7; Thu, 21 Jan 2021 03:42:11 +0000
Received: from mail.v3.sk ([167.172.186.51] helo=shell.v3.sk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Qqq-000653-AA
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 03:41:44 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 18356DF8E6;
 Thu, 21 Jan 2021 03:37:40 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id amaDJJxjbDOG; Thu, 21 Jan 2021 03:37:39 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id A7817E0A82;
 Thu, 21 Jan 2021 03:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jSzjLEDEyX-9; Thu, 21 Jan 2021 03:37:39 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 579CBDF892;
 Thu, 21 Jan 2021 03:37:39 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Subject: [PATCH 02/12] media: dt-bindings: marvell,
 mmp2-ccic: Allow power-domains property
Date: Thu, 21 Jan 2021 04:41:20 +0100
Message-ID: <20210121034130.1381872-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_224140_525768_EE04C7D0 
X-CRM114-Status: GOOD (  10.02  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121034120.14DXsf1uKnvsB-W4Br11jC7OBfdqJlc6HRbwkXOvf0Y@z>

On MMP3 the camera interface is on a separate power island. This
property tells the driver to enable it when appropriate.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../devicetree/bindings/media/marvell,mmp2-ccic.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
index 49bff738aca54..52eab686a1774 100644
--- a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
+++ b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
@@ -23,6 +23,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   port:
     type: object
     additionalProperties: false
@@ -75,6 +78,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/marvell,mmp2.h>
+    #include <dt-bindings/power/marvell,mmp2.h>
 
     camera@d420a000 {
       compatible = "marvell,mmp2-ccic";
@@ -84,6 +88,7 @@ examples:
       clock-names = "axi";
       #clock-cells = <0>;
       clock-output-names = "mclk";
+      power-domains = <&soc_clocks MMP3_POWER_DOMAIN_CAMERA>;
 
       port {
         camera0_0: endpoint {
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
