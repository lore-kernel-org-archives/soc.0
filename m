Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E06C433DB
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 17:19:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CDC3264EDE; Wed, 10 Feb 2021 17:19:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3797164EE0;
	Wed, 10 Feb 2021 17:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612977564;
	bh=9KKk5ehnWrA7UtNnP6QtrHqBtIqhTlf0+HSb9xqWDLA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lq3WLnscCy7gzzE/yXhENBoPzIqqeBP3kJAzS3XJKDGW0P/Jru+BYkyBhNWvwGoO4
	 c6vbweRlhLJ/NHhCvlhl6nqvgsjGzxlYdoA71XG8m/N+ncah+wR+gQF6hZ1RFGiBUo
	 teZZERvviZWMFT5q5hZD+Kx32h2Ot4e9bSzFsWqcjlrSL9vvnVVxpWL3Bk6vkuc+2V
	 gqCgOoAsfh7+wd3Bg+9eETbh9zYe4DWumJ3XfdfFMO9oJZHv5wYSTG2NW9xGM4vgAj
	 sw0xjDmJbsOopcsAeCAXtxudaCDvFWfv+Mm3dSpFDiOGY3VA9q84InEMqooNBfW8kj
	 KmZ+xQ4n0eVEA==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 10/11] arm64: dts: intel: socfpga_agilex_socdk: align LED node names with dtschema
Date: Wed, 10 Feb 2021 18:18:22 +0100
Message-Id: <20210210171823.333802-10-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the LED node names with dtschema to silence dtbs_check warnings
like:

    leds: 'hps0', 'hps1', 'hps2' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
index f14a89ca8784..13718ab5ed91 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
@@ -20,17 +20,17 @@ chosen {
 
 	leds {
 		compatible = "gpio-leds";
-		hps0 {
+		led0 {
 			label = "hps_led0";
 			gpios = <&portb 20 GPIO_ACTIVE_HIGH>;
 		};
 
-		hps1 {
+		led1 {
 			label = "hps_led1";
 			gpios = <&portb 19 GPIO_ACTIVE_HIGH>;
 		};
 
-		hps2 {
+		led2 {
 			label = "hps_led2";
 			gpios = <&portb 21 GPIO_ACTIVE_HIGH>;
 		};
-- 
2.25.1

