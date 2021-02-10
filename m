Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFB8C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:21:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A88264DE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A88264DE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HbAqAyWqfntEho6bCW7xu6XkqYUwBpe+zk6AsNxNc9c=; b=BkEI3pr2hBLQBuXamBHgSUwt+
	h/fAcS02TXEEznjOqITP1LZossZPgS+H/erh9xdhYq2L3Sux7RZXu9Ep6ue1UWaFurrk/ckN0kIyw
	C4ObGd2ZdBU112FY43mapwgUGdsczrFnzRs7XZ/GzXdYjjpwcgMEmd6yCfK1Gtw7pSYpkj8BmBX4p
	FjSHyDyzcJ269YDz2SqSD8/mh6fzBwJyUocY6kktdiUd3JXpGXRMAdQw9CL+5CNo7vf8HZg/lnFkT
	+tf/bNVg/jHJB1Yeg7+wfleMSR2nKpCzDtp7jr5uuTRkUlUUlAc7my/P474KghSEKclyYiW6qkr5F
	08B2QqQwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9t9j-0008PB-PY; Wed, 10 Feb 2021 17:19:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9t9E-0008BV-Fd
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 17:19:29 +0000
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: [RFT 11/11] arm64: dts: intel: socfpga_agilex_socdk_nand: align LED
 node names with dtschema
Date: Wed, 10 Feb 2021 18:18:23 +0100
Message-ID: <20210210171823.333802-11-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_121928_643384_38B13B18 
X-CRM114-Status: GOOD (  10.99  )
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
Message-ID: <20210210171823.naZix9E8WfCZb3SJdkBgPTkybmB1QKwBBLZ17IWrTe0@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
