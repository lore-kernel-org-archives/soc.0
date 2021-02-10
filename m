Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7447EC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:20:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AB7564E7E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AB7564E7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z4RjtWGXNQpN88MvkRea6EkDSGHzGLVCXRMRccXJT2U=; b=m3UhC/QV2iu/2ftXW8IsMioKy
	tJIAubWBp+uICtIovJxSzdtmVT1/1pvGHBB3ryIzSSEukeWFsuYXA30BCFXiVOW3A6889LDxMVW00
	mBPoiUgEqAjgv4f6xxNEAyPKCgtXhe84e8hEdvtEGT6m2TAlYGDWQI22PPO6uGn2No9tmsckNzyn8
	AFeKcXJVVKcUBF1WMCt3E4s8CR50XITABTIms2cukyvFn7bDB5StlfKEtQnXnA1otDSxvRHMo0j85
	JwrR9RAEi9rp7gjWsqaXsuA/Np5EkyHa4suiyqbXhmkDXIbbEe8qm6najMFsKgRDK3NGLXobcC3tm
	vZezNhLeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9t9I-0008CV-Es; Wed, 10 Feb 2021 17:19:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9t92-00086y-Ef
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 17:19:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A55364ED0;
 Wed, 10 Feb 2021 17:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612977555;
 bh=VaP/gtqxTTgKJgXiF8fsfowksuSdaGGB0215tutRTlA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YQteUaEp2fuhlCLYNQZPq+920j5n+JbTYuyUB1U6azDKxC29A8thXyGcuBK7X1k3v
 eKzOQJo71jtTs5KflUPiCtTSou1XjuRGdqf4UCA+itqBUn17KDUAl0y07g/0Fc38pT
 h+W8HYncDawA0E53rQ57Jgpjq/aoZg/7wu8EuMhSYU+YadpgGrX18snfigjhpoKcIl
 LVjFHKRn9HKSHX4biuLaOdbQDqaJk8Hk61DRe5R6TFtaCko1IuacWLN38lRKTc9lNA
 sSjCMIBrRwXV2l8XvA8DfehSyNvfiN0jSH6RR0v7KtLHT2wOLm9mGekO0A6xNK1o+4
 Uq2XS4KpnKAnQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: [RFT 07/11] arm64: dts: intel: socfpga_agilex: move usbphy out of soc
 node
Date: Wed, 10 Feb 2021 18:18:19 +0100
Message-ID: <20210210171823.333802-7-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_121916_974859_DDEBE463 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210171819.rzTEdnMwfKzSbpi0Hn6RCauLfcQOQsEn7HdjTuPkOwY@z>

The usual usb-nop-xceiv USB phy node should be under root node, to fix
dtc warning:

    arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:472.21-476.5:
        Warning (simple_bus_reg): /soc/usbphy@0: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 750237b9c5c1..20ae9f80febd 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -124,6 +124,11 @@ timer {
 			     <1 10 0xf08>;
 	};
 
+	usbphy0: usbphy {
+		#phy-cells = <0>;
+		compatible = "usb-nop-xceiv";
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -469,11 +474,6 @@ uart1: serial1@ffc02100 {
 			status = "disabled";
 		};
 
-		usbphy0: usbphy@0 {
-			#phy-cells = <0>;
-			compatible = "usb-nop-xceiv";
-		};
-
 		usb0: usb@ffb00000 {
 			compatible = "snps,dwc2";
 			reg = <0xffb00000 0x40000>;
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
