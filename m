Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EB9C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:45:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8550C2389B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8550C2389B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1HgoGvvt4a0kqPg/9VfXy9bmV72GE1bvcTPAUYvbfmQ=; b=YjQneS0kfc+br2DL4Hzv8q8ig
	Z/g3E10IQ55liE9Q8w8l5jk2nzmaHZ0pu5/dB7Zvp5GfJyAtbUejg33CcWI90N2+2g5nVtD37ul0p
	FtaZQHyNwPaYWAOvX40qoWZgvyDTkbHxfIk6Arc2v6uvwJWAsy/22F8kN3OjczhJkhiE9xjsn2XKK
	ZK40T9IXDZFa6uz3QiMNLXMgOBT+bvdvC/GQjglO/C/eodvmU4Z1rmdmAXtuv5KPAYJJ8AnDEHZkF
	YeI8+dMV67IB4xbnRGbdA1k50iHxKAxc/IwMXa2Olz7T7WW+zy+OJYAaViq5stPmlsAvmSLB8+/+2
	9+0kFiiMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Qsc-0006de-3i; Thu, 21 Jan 2021 03:43:30 +0000
Received: from mail.v3.sk ([167.172.186.51] helo=shell.v3.sk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Qqt-00068d-0t
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 03:41:49 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 8290FE0AAE;
 Thu, 21 Jan 2021 03:37:45 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id LcSkUZQy2OKO; Thu, 21 Jan 2021 03:37:45 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 025ECE0AA6;
 Thu, 21 Jan 2021 03:37:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id pXgSsFwuFnmt; Thu, 21 Jan 2021 03:37:44 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id C10F2E0AA9;
 Thu, 21 Jan 2021 03:37:44 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Subject: [PATCH 10/12] ARM: dts: mmp3-dell-ariel: Add the power button node
Date: Thu, 21 Jan 2021 04:41:28 +0100
Message-ID: <20210121034130.1381872-11-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_224143_308793_79BD30E7 
X-CRM114-Status: GOOD (  11.26  )
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
Message-ID: <20210121034128.6aEHajHi_PKj-iLfNX6cb4GwxzjUT2fuZ-Lj-Wklq6c@z>

This adds support for the power button attached to the Embedded Controller
on a Dell Wyse 3020 "Ariel" board.

However, while the EC itself is controlled via I2C, the input capability
for the power button acts as a separate device attached to the SPI, hence
it has a separate device node.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp3-dell-ariel.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mmp3-dell-ariel.dts b/arch/arm/boot/dts/mmp3-dell-ariel.dts
index 565cd0fadf3d3..c4a6bd876d849 100644
--- a/arch/arm/boot/dts/mmp3-dell-ariel.dts
+++ b/arch/arm/boot/dts/mmp3-dell-ariel.dts
@@ -119,8 +119,16 @@ firmware-flash@0 {
 };
 
 &ssp2 {
-	cs-gpios = <&gpio 56 GPIO_ACTIVE_LOW>;
 	status = "okay";
+	cs-gpios = <&gpio 56 GPIO_ACTIVE_LOW>;
+
+	power-button@0 {
+		reg = <0>;
+		interrupt-parent = <&gpio>;
+		interrupts = <60 IRQ_TYPE_EDGE_RISING>;
+		compatible = "dell,wyse-ariel-ec-input", "ene,kb3930-input";
+		spi-max-frequency = <33000000>;
+	};
 };
 
 &gpu_2d {
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
