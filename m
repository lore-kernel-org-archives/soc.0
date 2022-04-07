Return-Path: <SRS0=LCsd=UR=microchip.com=Kavyasree.Kotagiri@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ADBC433EF
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 10:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8908AC385A0; Thu,  7 Apr 2022 10:59:19 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F36EC385B6;
	Thu,  7 Apr 2022 10:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1F36EC385B6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649329158; x=1680865158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=U1ExlaQ0xLgzrMqOMAXenCfNzoFHQXdgfyOJjDemSpc=;
  b=WgRXazan30IUPnbGlb1+HQBeQiS7AtB0UA5w4LYpvAcpqukZQpyzVfyo
   HBPbRzVTDFwV52057/3dAC+YAq8JCkrndA6z+UKURdvFcTzenw0zuxRcF
   Ai/eLiBWAd4FcbtpcY4RrpfJh8HMyAyxS935rtMbrJcpBTjj14qCQ9z5+
   x91FPNW9S9L81l1Sa+c93GiKm4I12/wgezoeg86EzPGkxjIucXN2i6pQr
   e4vpSX/A8uYSKBUplhPWxru8YBfjNYMI/DoN843gGX3/rO396I4TG+u3L
   mkK/G1oizaJbF6nCUfyO0lOZbIIcNsqr7ZHOaMMMq1AFFoedbh4L7Csng
   A==;
X-IronPort-AV: E=Sophos;i="5.90,241,1643698800"; 
   d="scan'208";a="91613510"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Apr 2022 03:59:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 7 Apr 2022 03:59:16 -0700
Received: from kavya-HP-Compaq-6000-Pro-SFF-PC.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 7 Apr 2022 03:59:12 -0700
From: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
	<alexandre.belloni@bootlin.com>, <olof@lixom.net>, <soc@kernel.org>,
	<nicolas.ferre@microchip.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
	<tudor.ambarus@microchip.com>, <Kavyasree.Kotagiri@microchip.com>,
	<Manohar.Puri@microchip.com>
Subject: [PATCH 2/2] ARM: dts: lan966x-pcb8291: Add QSPI0 and SPI NOR memory nodes
Date: Thu, 7 Apr 2022 16:28:35 +0530
Message-ID: <20220407105835.10962-3-kavyasree.kotagiri@microchip.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220407105835.10962-1-kavyasree.kotagiri@microchip.com>
References: <20220407105835.10962-1-kavyasree.kotagiri@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain

Enable QSPI0 controller and sst26vf016b SPI-NOR flash present on it.

Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
---
 arch/arm/boot/dts/lan966x-pcb8291.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/lan966x-pcb8291.dts b/arch/arm/boot/dts/lan966x-pcb8291.dts
index 3281af90ac6d..99d96d46661d 100644
--- a/arch/arm/boot/dts/lan966x-pcb8291.dts
+++ b/arch/arm/boot/dts/lan966x-pcb8291.dts
@@ -62,3 +62,18 @@
 &watchdog {
 	status = "okay";
 };
+
+&qspi0 {
+	status = "okay";
+
+	spi-flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		m25p,fast-read;
+	};
+};
-- 
2.17.1

