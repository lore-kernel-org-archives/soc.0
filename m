Return-Path: <SRS0=zXmn=M4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6034BC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 15:58:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2930D6112F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 15:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2930D6112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Q/EfemaCGnEoJJwaHpEe2fEWDholqp779RBeClytdQ=; b=O/uYu+yUjcc3zA
	MlPQBb4Ts7GcQNm2hhDSAV6W3s/7nxgE+Z82FF/CdHFZKx03afJlv5Y1PWft9RbjGyjealQbY/K24
	eDyam5q6kMUFoTD/QB596UxzHdbo1AD9EReRuyozlnbLvq+34i08tTK8QgJr3BhDOz3Wc8xW+7MR3
	5Ir1XggjDuKrn/oHuOs9r+botcS710e7XitN+bLsINeHW30I4+f9vBbb5GztnzQqW8fzKPVFb27hv
	ohSkZNcpbmVIFTzcj1e0QLvOS0rv5TbAQCrYBmFgleNoAg8BYCD0ekDAvpEDr6iipqsQgfhVtsxas
	chb7MaZzOg24B+yONvHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBfjS-00A8hh-7z; Thu, 05 Aug 2021 15:56:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBfjO-00A8hF-Gy
 for linux-arm-kernel@lists.infradead.org; Thu, 05 Aug 2021 15:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628178986; x=1659714986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i7ddTF2RdMj7+wLTZPUG9yvpW6hfBDmQ4fUfE2MtAEg=;
 b=M2KrAJY+SAD6zmCZ4gqiesAMIWilT9FQVwupyh7oWddvREad6xoEoLJn
 SHwbiOdmxaMr6JLZSYuEhahh7PuZcQrJ9jzG7YU4cPQPyG/UWVFboP4w7
 XpNpJo8PMvTfkxj1baqnKXhIjcH/oQjW1uG3PwuGr+Mag7VtSpM9PKoIP
 9UVEGYEpu/F94sabF5ozticS1CRLUu8AXkdART6w4CBb/CwLIBiH6M6g3
 VdQVPrPnYpkGz1Qr/lrIznTikQ+BXKBljq8cORPp9VwSRBdkgvl1AMbAG
 ftSpU2MTX5Yl2kaSmO4CfF3eQ3ZWGKp9w9kFTMBJZckYma7clXx9hvhSl w==;
IronPort-SDR: aSmE3qlrt4zX8Wis+1tVwG/pyG8WEO5samKbI5pWfxy0KftQrzbH8y52bkobJdTFiRIJ1xBNcr
 5+9BD0i73vmA5K7UDEUo2u1ZGGJuziklw64cwL+1UYemL1NkpdMiUiSYimvmRo7/B44Lafk+Tw
 wQRdefZZAgMpq273IEZyGTXU/m+Ab80fJiyOK+oQE5TzoNtXfS3RrGCrkyFuytHrI4723T0uyS
 g7AhvG6uXTu1966W2kj+nP3tk1VrP0GCQMS5C7DGxUtsL0tujmnC4nOiYb6s9ObgVsOW1ot4cF
 piP5OdhpGFh5lc8BB72Av1X4
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="64834729"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Aug 2021 08:56:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 08:56:25 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 08:56:06 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 1/7] ARM: dts: at91: at91sam9260: add pinctrl label
Date: Thu, 5 Aug 2021 18:53:51 +0300
Message-ID: <20210805155357.594414-2-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805155357.594414-1-claudiu.beznea@microchip.com>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_085626_670891_7E9AC909 
X-CRM114-Status: UNSURE (   9.43  )
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
Message-ID: <20210805155351.wdLDRfvTwBjyRN8mthcUbiCI_Ckp5GPAlf19BD9mfcw@z>

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
