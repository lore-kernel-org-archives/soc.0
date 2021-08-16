Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE795C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 06:48:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B88AA61A53
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 06:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B88AA61A53
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Q/EfemaCGnEoJJwaHpEe2fEWDholqp779RBeClytdQ=; b=D8Om+vBnhTL8Uy
	fBv4l1Oyt1tapr9KV/DSSXy6LA1h5oDhWENu7Ffzft9yE4wq1RtbZvVAdZUNUUP923clWrX5/fg7R
	tfxwn7o/ixZ5dxDpdLe4l5XfaMYBhjUPAY7rErOhsB1mleeoxCZD/SHrArMrbvxlR8DLygujNtKEO
	0zzwTcWi4eJ4Blp01E09MM+uc7ruot4CFiFzn/BAODVoRa2R1KGV2GGjpFYNfblWz4/Y2PolUaL2G
	v17IZ/NjIirZzBl8o6tmcz7IbCx23iKUhu1VUM7BRbYfrr0RALMQIDh4oljo6AQp4OsJvLHLNvtE7
	NwrAHBRYQ82F4+nG2bKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFWOQ-00GGOI-Ju; Mon, 16 Aug 2021 06:46:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFWOC-00GGMA-RE
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 06:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1629096388; x=1660632388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i7ddTF2RdMj7+wLTZPUG9yvpW6hfBDmQ4fUfE2MtAEg=;
 b=VSRY8tyeGY7oPTawnkM2LsfNv2+WFYKE+jwz/uj4cIRTiOaX9t+6N1kz
 VMjPnlRjUjD2gjT5UGPg44Uq9aUv/fy6+rjP/Acx6n3cuLYhDeKPJZsDU
 HJAPizT7UuHVUdL2Cc7lShdIBt02ubjQJNmzxOmnZ/g4XCY1LxkQDdH/3
 oc8deUjhkWvKAFsT8BrDFYnNU7rZQrioy5FjwBRvDSOsyI77XE3ys0eHD
 P7ME//eQJwwMeUotjMpHu+TavIlzEbYLBt82GnSNKaC6n1LkmzFVexXcF
 /q1X4d9N0ZFaPUsE8b3idrPGdUGlIroOyXXSUQxB3RLRHgPE5m8Q7OuLS w==;
IronPort-SDR: mCB471Qx/s7ExUNpJx2m1aQOMgeEoPmEEO0bfDzjbkC/nENIrU4djEEBjdmK2KWSX0V2MkiEVF
 emA7fQXf82aVXOIxqqHnmdNsNdn1PEJeR/mLbShRSbLfj7vehqj1LPfxMc50PvDmyvL31N9orW
 tyukO8weYwkStynrik8pX81XqIf+bhkUs0T/4HVNyR5zV1pzla1+tjgKL0ZYoh805hMdlDuRWk
 t8lqKDytG/X97/pFMVkuH6+uezUMz7VyPBIk+hVuWZG5thUcQhvQhIkf0CMm7/Iq4ytp5NpAH2
 x4POjgCnrxIOV7sRX0SskqOS
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="132362605"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Aug 2021 23:46:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 15 Aug 2021 23:46:27 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 15 Aug 2021 23:46:23 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 1/7] ARM: dts: at91: at91sam9260: add pinctrl label
Date: Mon, 16 Aug 2021 09:44:10 +0300
Message-ID: <20210816064416.1630674-2-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
References: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_234628_935874_5EFC3DE7 
X-CRM114-Status: UNSURE (   9.09  )
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
Message-ID: <20210816064410.drXrQX901TpY5j3QQGD0vFBB9YJs_q0UImM7HsLOmM8@z>

Add label for pinctrl node.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91sam9260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/at91sam9260.dtsi b/arch/arm/boot/dts/at91sam9260.dtsi
index 019f1c3d4d30..7368347c9357 100644
--- a/arch/arm/boot/dts/at91sam9260.dtsi
+++ b/arch/arm/boot/dts/at91sam9260.dtsi
@@ -166,7 +166,7 @@ tcb1: timer@fffdc000 {
 				clock-names = "t0_clk", "t1_clk", "t2_clk", "slow_clk";
 			};
 
-			pinctrl@fffff400 {
+			pinctrl: pinctrl@fffff400 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
