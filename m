Return-Path: <SRS0=c65O=G7=me.com=avolmat@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC14C433DB
	for <soc@archiver.kernel.org>; Thu, 28 Jan 2021 08:07:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5583564DDA; Thu, 28 Jan 2021 08:07:00 +0000 (UTC)
X-Greylist: delayed 526 seconds by postgrey-1.34 at mail.kernel.org; Thu, 28 Jan 2021 08:07:00 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23ECB64DDB
Authentication-Results: mail.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=avolmat@me.com
Received: from st43p00im-ztbu10073701.me.com (st43p00im-ztbu10073701.me.com [17.58.63.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23ECB64DDB
	for <soc@kernel.org>; Thu, 28 Jan 2021 08:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	t=1611820691; bh=LIfpvi/CeAZsNwLDcOcpd47eJbyY1m6zbqe5JJoe9sU=;
	h=From:To:Subject:Date:Message-Id;
	b=z4xoQzQmFfGosBgPnU500zNFp04pgs2MRBqSp392pK3Mh7eOMXSUyMKge7Zg3wAUu
	 CcBSTGTR2HdL37kn7WQfocE4zTaPKkMDuojeOVFUebRuAC8wr3LNODbE2GK08xLt2R
	 Auy2T09DIXINGBmcORvY/39RkwsFt5FJo5sZJNuVJi77Mh+XromKE2YvAq/Yam5zhM
	 oF0y5BGP6UAKFZYjNtL4nnvMghCpcJrsUAaCKrQU5xMJea9QZWby+5tOUIPcYxAF0z
	 BWCL5SmjZXvrUjHhz507pu1f5NQXYNd+ljFE3DQA7Od/gS7mq99YXXXzEvhznfzqFl
	 Vh+CRO7tLuRFw==
Received: from localhost (101.220.150.77.rev.sfr.net [77.150.220.101])
	by st43p00im-ztbu10073701.me.com (Postfix) with ESMTPSA id 8477F4C040A;
	Thu, 28 Jan 2021 07:58:09 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Patrice Chotard <patrice.chotard@st.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: avolmat@me.com
Subject: [PATCH 1/2] ARM: dts: sti: add the spinor controller node within stih407-family
Date: Thu, 28 Jan 2021 08:58:06 +0100
Message-ID: <20210128075806.10318-1-avolmat@me.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-28_02:2021-01-27,2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2101280039
Message-ID: <20210128075806.iCVay289_zJrALFiUNiI6K35YiRkHf4FbZb3kN2_Wjg@z>

add the spinor controller node within stih407-family.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 arch/arm/boot/dts/stih407-family.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 23a1746f3baa..21f3347a91d6 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -616,6 +616,21 @@
 			st,lpc-mode = <ST_LPC_MODE_CLKSRC>;
 		};
 
+		spifsm: spifsm@9022000{
+			compatible = "st,spi-fsm";
+			reg = <0x9022000 0x1000>;
+			reg-names = "spi-fsm";
+			clocks = <&clk_s_c0_flexgen CLK_FLASH_PROMIP>;
+			clock-names = "emi_clk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_fsm>;
+			st,syscfg = <&syscfg_core>;
+			st,boot-device-reg = <0x8c4>;
+			st,boot-device-spi = <0x68>;
+
+			status = "disabled";
+		};
+
 		sata0: sata@9b20000 {
 			compatible = "st,ahci";
 			reg = <0x9b20000 0x1000>;
-- 
2.17.1

