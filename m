Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAF6C433DB
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 17:19:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C5C7064EE3; Wed, 10 Feb 2021 17:19:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 251E964EE6;
	Wed, 10 Feb 2021 17:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612977567;
	bh=lUobpB2+foAOvaqKEW2gF9nAkNBxrYowZDqmODWTi1g=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bNyp/aE9Uq1MI4ITfsbc9wdBqJSOfZzgEe7G65BqZx7Q5Oih5fP+ykKuIA5zgHZco
	 jIdDk40VeP4cuzZQzI+s/Jd8U+8loAlMpt0/fRDgjQNhhcmxuCa+Nl1VDb8Obf9S1g
	 qA+hPt7RTVUZ/vStbLfAxr+y1hWcbmNQGxjZTS6OL8Epbautogd4DrnBD9gKZaZDBf
	 FuR1u+0qLyAg15FcAJEHldHtWx8E6P2okRqTU5ag+vVHV6xGnqqUlErDaKDvsB64x6
	 mUB6Rao+ssxBXIbZhL1WOG4PsQuTJs04hU70DKzFThPfISSqHViiF+dztRmriIEPK5
	 +s3ktZ4n0cQ9w==
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
Subject: [RFT 11/11] arm64: dts: intel: socfpga_agilex_socdk_nand: align LED node names with dtschema
Date: Wed, 10 Feb 2021 18:18:23 +0100
Message-Id: <20210210171823.333802-11-krzk@kernel.org>
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

