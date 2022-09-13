Return-Path: <SRS0=xV2k=ZQ=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E38C6FA90
	for <soc@archiver.kernel.org>; Tue, 13 Sep 2022 04:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4EAF9C433C1; Tue, 13 Sep 2022 04:22:59 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 0201EC43470;
	Tue, 13 Sep 2022 04:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0201EC43470
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 13 Sep 2022 13:22:54 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 2670E20584CE;
	Tue, 13 Sep 2022 13:22:54 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 13 Sep 2022 13:22:54 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id A8DF0B62A4;
	Tue, 13 Sep 2022 13:22:53 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v3 8/9] ARM: dts: uniphier: Move interrupt-parent property to each child node in uniphier-support-card
Date: Tue, 13 Sep 2022 13:22:48 +0900
Message-Id: <20220913042249.4708-9-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913042249.4708-1-hayashi.kunihiko@socionext.com>
References: <20220913042249.4708-1-hayashi.kunihiko@socionext.com>

The dtschema warning:
  uniphier-ld11-ref.dt.yaml: system-bus@58c00000: 'interrupt-parent' does not
  match any of the regexes: '^.*@[1-5],[1-9a-f][0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/uniphier-support-card.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/uniphier-support-card.dtsi b/arch/arm/boot/dts/uniphier-support-card.dtsi
index 444802fee9fb..97e7d5db8eb8 100644
--- a/arch/arm/boot/dts/uniphier-support-card.dtsi
+++ b/arch/arm/boot/dts/uniphier-support-card.dtsi
@@ -8,13 +8,13 @@
 &system_bus {
 	status = "okay";
 	ranges = <1 0x00000000 0x42000000 0x02000000>;
-	interrupt-parent = <&gpio>;
 
 	ethsc: ethernet@1,1f00000 {
 		compatible = "smsc,lan9118", "smsc,lan9115";
 		reg = <1 0x01f00000 0x1000>;
 		phy-mode = "mii";
 		reg-io-width = <4>;
+		interrupt-parent = <&gpio>;
 	};
 
 	serialsc: serial@1,1fb0000 {
@@ -22,5 +22,6 @@ serialsc: serial@1,1fb0000 {
 		reg = <1 0x01fb0000 0x20>;
 		clock-frequency = <12288000>;
 		reg-shift = <1>;
+		interrupt-parent = <&gpio>;
 	};
 };
-- 
2.25.1

