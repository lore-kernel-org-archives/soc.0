Return-Path: <SRS0=glJB=FH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79437C4361A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Dec 2020 23:12:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 194BF224B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Dec 2020 23:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 194BF224B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M4Cq9lmVXNzDI0WeRIJ3YvKwYZNS1hfQmcT33SkJSBI=; b=O393k12BsDWeNDksT1GoKruz85
	j1qBcFfm/xWaXfO8VU82y3PF/mn2TGJekbtmfnFU9gA6Hk9tM+ScWKrM3wsOweUD1bx48a7Ui7cKD
	AdvYhM8JawAU5yqfp4NScfGok5BnOfTO3eTFIbBscRcbplJhgnYY6VGk3/nq1ydeHbeg8yia6xGfy
	FzslxougbsVVD71aqh/9agPHY3eg6IIiJaK9sVhtIKXBK8FHEFkRQWn+XZrhMrF2or1OjL/CyfCEw
	Xp7/EQtn0OZNqTo5wd0351OOTyQc+SaBbHIem0oYIN5AG4OrR20/8jaKVUeHCNOxa9FkR4OMp2rsT
	Y648o1yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkxkY-0000Sp-EP; Thu, 03 Dec 2020 23:10:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkxkV-0000SO-VJ
 for linux-arm-kernel@lists.infradead.org; Thu, 03 Dec 2020 23:10:56 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] ARM: dts: mmp2-olpc-xo-1-75: add back #address-cells
Date: Fri,  4 Dec 2020 00:10:43 +0100
Message-ID: <20201203231050.1482419-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_181056_099738_90AFDEB3 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201203231043.gCB1ozW0WZgG6DWdjsgDm4BbTQBA9tZH3fPN6m9iKZg@z>

From: Arnd Bergmann <arnd@arndb.de>

A previous fix tried to address a dtc warning, but added a different
one in the process:

arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
  also defined at arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts:225.7-237.3
arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
  also defined at arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts:225.7-237.3
arch/arm/boot/dts/mmp2-olpc-xo-1-75.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'

Add back the two properties, but use the correct value <0> for
an spi slave node.

Fixes: f45200b67ea3 ("ARM: dts: mmp2-olpc-xo-1-75: Delete #address-cells from ssp3")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts b/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
index adde62d6fce7..342304f5653a 100644
--- a/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
+++ b/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
@@ -223,8 +223,7 @@ accelerometer@1d {
 };
 
 &ssp3 {
-	/delete-property/ #address-cells;
-	/delete-property/ #size-cells;
+	#address-cells = <0>;
 	spi-slave;
 	status = "okay";
 	ready-gpios = <&gpio 125 GPIO_ACTIVE_HIGH>;
-- 
2.27.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
