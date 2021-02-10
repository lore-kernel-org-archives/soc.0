Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA02C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:21:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C1D564E9C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C1D564E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4k5V3RMKJ2kXzKWZJHU0UA+Qf+MbcsakNJtpUiKVOA4=; b=LmxUl/rsjF2iSOaXCZ9M4tEN3
	PiogyTwo7hUIkNKF/oo/uMC2KLPS0GiVdAT4NFDquDT/Iw5cGJPpRYnlq5/xYZLhIfUPaNx22LBVn
	l9WEeKXvqOQxEoz4biGBOK+Dz61gBg+D7Ga9zTZ7JpvDiQcxOXuXCocwzpHTvRFXzvNx6Oz2P7VZj
	2v+WURJeGEVERY3GVX8Ervsj2WU1I2qfOBbmhLDf3MW8be8s7NDwc5Zojn+n20gRq4Tf37NZAgFqx
	xfFGURDXQOkCoWlq5Ryn8ipYmTv66S8L1/v/8W0+u43iIvaFowy41eTyNDZvAYXzkinIwLk3qBbq/
	XTu3S4NIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9t9d-0008Lo-2x; Wed, 10 Feb 2021 17:19:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9t9B-0008AI-E7
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 17:19:26 +0000
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: [RFT 10/11] arm64: dts: intel: socfpga_agilex_socdk: align LED node
 names with dtschema
Date: Wed, 10 Feb 2021 18:18:22 +0100
Message-ID: <20210210171823.333802-10-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_121925_647095_4D0C22D1 
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
Message-ID: <20210210171822.nI7_nMUwMLa5fnKUt3iMVG7rmZaYupceqfrMCNbvPzc@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
