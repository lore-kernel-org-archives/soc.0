Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F706C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:45:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAD4F2389A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAD4F2389A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XufbqCSx2ko6uqGAQ0cDQ9zrHjQ+EnNt/ZxF4GFkqOA=; b=UaAI9x6iZsFf1mSM0lg2Qp53O
	YP3O+hTs4KMJoOiWvgCuGvNNN1RcGfJlybZokTDv6PLr5m8DVvMzBl26p3khm8cO8F3wGMtCYwLuy
	rNwpiVUSc/r6kh0snqq3B7qWsvnIyWkKtc5SBoMsiVA1Cn0q9OjNIB77DbVV25Xcaf3Z5vY+HlTnb
	HTQWzAEqbDxZualJHDMaFk4ixTeDT17+4x7iA61DglF5C9hIKpx9/Ol82ClhGe1FQpPCd1lAwYHgO
	NZ5eX23Vrl6/hEAPayIjFFB6UKqdSkkvhbfJHV3PvOW3JKe+dRwDzR7rJDdCgGK0ET19Hyn4NOIoX
	6D8SGXIGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Qsg-0006g0-HU; Thu, 21 Jan 2021 03:43:34 +0000
Received: from mail.v3.sk ([167.172.186.51] helo=shell.v3.sk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Qqt-00068m-A9
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 03:41:51 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 82B7EE0738;
 Thu, 21 Jan 2021 03:37:46 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rqpuAFeEUP4K; Thu, 21 Jan 2021 03:37:46 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 1F68CE0AA9;
 Thu, 21 Jan 2021 03:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id YoQcdNrIrArX; Thu, 21 Jan 2021 03:37:45 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id D76FCE0738;
 Thu, 21 Jan 2021 03:37:45 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Subject: [PATCH 12/12] ARM: dts: mmp3: Fix the CCIC interrupts
Date: Thu, 21 Jan 2021 04:41:30 +0100
Message-ID: <20210121034130.1381872-13-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_224143_515261_9CC9CDC0 
X-CRM114-Status: GOOD (  10.24  )
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
Message-ID: <20210121034130.GfRGJL8sOZbUa3QUca9egrTe2ztyuUBkSU-NXut7_l4@z>

A copy & paste oversight from MMP2; camera interrupts are handled
via a multiplexer on MMP3.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp3.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/mmp3.dtsi b/arch/arm/boot/dts/mmp3.dtsi
index 9f2b059f0900b..a4fb9203ec1fb 100644
--- a/arch/arm/boot/dts/mmp3.dtsi
+++ b/arch/arm/boot/dts/mmp3.dtsi
@@ -293,7 +293,8 @@ mmc5: mmc@d4217000 {
 			camera0: camera@d420a000 {
 				compatible = "marvell,mmp2-ccic";
 				reg = <0xd420a000 0x800>;
-				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <1>;
+				interrupt-parent = <&ci_mux>;
 				clocks = <&soc_clocks MMP2_CLK_CCIC0>;
 				clock-names = "axi";
 				power-domains = <&soc_clocks MMP3_POWER_DOMAIN_CAMERA>;
@@ -305,7 +306,8 @@ camera0: camera@d420a000 {
 			camera1: camera@d420a800 {
 				compatible = "marvell,mmp2-ccic";
 				reg = <0xd420a800 0x800>;
-				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <2>;
+				interrupt-parent = <&ci_mux>;
 				clocks = <&soc_clocks MMP2_CLK_CCIC1>;
 				clock-names = "axi";
 				power-domains = <&soc_clocks MMP3_POWER_DOMAIN_CAMERA>;
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
