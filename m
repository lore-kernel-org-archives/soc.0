Return-Path: <matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6360C43460
	for <soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:39:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C352E6115B; Fri, 16 Apr 2021 14:39:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F938613B4;
	Fri, 16 Apr 2021 14:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618583978;
	bh=iR54IzMf1S6kuxyIla+yy1tc43W+FXsmvIuG/2BQeqI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cwQBpC5q+qTkUAqpGv3l8e+mkhSp4zH53rc/2YUp+yJEVYyKZ0Hrba2IxG3MYG5Kn
	 +apVvMR/cv/jJgSZz8zbOhlRLk+s/ZffuyPjYB+PK1TmN15x1YurjgSIdDlWggWS9+
	 hf+mMipckFclqk9qukrS76JV9JSQAblGLcSON/27Tu3nAr6haJHr4jT+HeKUhi0CVO
	 bbf/FGEiwCFXe8wUfkXFOilG0aaozsMj+Z9l/uf//vD5exQlGKkK7j3767cyjfYWi/
	 dDGxr8rB59rHPww3r1Gat0VpAVCl/h7BjI/+VxiCDZjKZGgJUWHY1UFY/sWvznImlG
	 cigyZCJGLojmw==
From: matthias.bgg@kernel.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mt8183: fix dtbs_check warning
Date: Fri, 16 Apr 2021 16:39:23 +0200
Message-Id: <20210416143923.23406-3-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210416143923.23406-1-matthias.bgg@kernel.org>
References: <20210416143923.23406-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Brugger <matthias.bgg@gmail.com>

Fix unit names to make dtbs_check happy.

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Link: https://lore.kernel.org/r/20210414144643.17435-2-matthias.bgg@kernel.org
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

---

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 0ff7b67a6806..c5e822b6b77a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -681,13 +681,13 @@ cpu_thermal: cpu_thermal {
 				sustainable-power = <5000>;
 
 				trips {
-					threshold: trip-point@0 {
+					threshold: trip-point0 {
 						temperature = <68000>;
 						hysteresis = <2000>;
 						type = "passive";
 					};
 
-					target: trip-point@1 {
+					target: trip-point1 {
 						temperature = <80000>;
 						hysteresis = <2000>;
 						type = "passive";
@@ -1103,7 +1103,7 @@ u2port0: usb-phy@0 {
 				status = "okay";
 			};
 
-			u3port0: usb-phy@0700 {
+			u3port0: usb-phy@700 {
 				reg = <0x0700 0x900>;
 				clocks = <&clk26m>;
 				clock-names = "ref";
-- 
2.30.2

