Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590B6C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 16:22:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 391E165227; Mon,  8 Mar 2021 16:22:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5849E6521F;
	Mon,  8 Mar 2021 16:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615220579;
	bh=lUobpB2+foAOvaqKEW2gF9nAkNBxrYowZDqmODWTi1g=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mpC/a122aVQ92lRNCATZs4/PbQsBJomB3g1D3D5tzoMFuY2Lw1MR3Or99y0poOw/s
	 NNTPVgTmAj/Ycfs75URlndCax4FfjTvcW9IpmLcXQIo26pNW1tXr+2kkEa1ebLkWzp
	 fcLhIMybTGDsDurZqNSpUbpvPzlWf6AER7EdyshECd8tkxHznoYPZpj8LZ+LOfmqCB
	 w0a416/OHYqNbGI4CbUt1AJq1rwcuS/YYzm16E2kefjfCDJLHwKQPyin+VF3oWlyi2
	 0pPNpi1/Q4BluA9N5o5wPryel71usmyopBA3NkdK0d65OCDm6v6roS1RtKER56/7Fe
	 /BfT9P59F/1NA==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH 10/10] arm64: dts: intel: socfpga_agilex_socdk_nand: align LED node names with dtschema
Date: Mon,  8 Mar 2021 17:22:28 +0100
Message-Id: <20210308162228.62614-11-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308162228.62614-1-krzk@kernel.org>
References: <20210308162228.62614-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the LED node names with dtschema to silence dtbs_check warnings
like:

    leds: 'hps0', 'hps1', 'hps2' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
index 58a827a5e83f..cc2dcabf34e3 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
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

