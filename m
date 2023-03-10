Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70BAC6FA99
	for <soc@archiver.kernel.org>; Fri, 10 Mar 2023 11:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CA280C4339B; Fri, 10 Mar 2023 11:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1126FC433EF;
	Fri, 10 Mar 2023 11:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678446297;
	bh=PiJF++ZezsVAOXByMygqOm4/Co+2kEB1E1dUVgELBKA=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=U9gNYGsOFrWRCin/FJsxae2kF70PTHAAK6ymrhCb90P+lvXeQaE4e8azj7v9Bz/00
	 kXf/hCjLaSxRnBaWuycYJj8jD9kjpltNxxFWujQXn46vOGj0cWvK8EeVeC3lXxQ9QI
	 Era0IY4qZpDY5vM0sczH3spCbpYjVt9ceJ3ARUins7vJb8j2Br5enDZdXL3BhqAeem
	 lUDUtSKbTaAQGXncEvIWwa1gBdDMVpv/AF2pBWj91xZ5bpTDZWWbR2meupdgkXA/mX
	 inMuV5tQzgrq+jhaQYTU+PApDm830XTTpCDdacZ7oa+glXlb/h09PKUCh6LK8VzUMI
	 a/zWSlSFzOU3w==
From: Sasha Levin <sashal@kernel.org>
To: stable-commits@vger.kernel.org,
	krzysztof.kozlowski@linaro.org
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Patch "ARM: dts: spear320-hmi: correct STMPE GPIO compatible" has been added to the 4.14-stable tree
Date: Fri, 10 Mar 2023 06:04:55 -0500
Message-Id: <20230310110455.3097264-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

This is a note to let you know that I've just added the patch titled

    ARM: dts: spear320-hmi: correct STMPE GPIO compatible

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-dts-spear320-hmi-correct-stmpe-gpio-compatible.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.



commit ac2fe12e98a00cebb5429850a3f71962148ea38f
Author: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date:   Sat Feb 25 17:22:37 2023 +0100

    ARM: dts: spear320-hmi: correct STMPE GPIO compatible
    
    [ Upstream commit 33a0c1b850c8c85f400531dab3a0b022cdb164b1 ]
    
    The compatible is st,stmpe-gpio.
    
    Fixes: e2eb69183ec4 ("ARM: SPEAr320: DT: Add SPEAr 320 HMI board support")
    Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
    Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
    Link: https://lore.kernel.org/r/20230225162237.40242-1-krzysztof.kozlowski@linaro.org
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

diff --git a/arch/arm/boot/dts/spear320-hmi.dts b/arch/arm/boot/dts/spear320-hmi.dts
index 0d0da1f65f0e6..1e54748799a6b 100644
--- a/arch/arm/boot/dts/spear320-hmi.dts
+++ b/arch/arm/boot/dts/spear320-hmi.dts
@@ -248,7 +248,7 @@ stmpe811@41 {
 					irq-trigger = <0x1>;
 
 					stmpegpio: stmpe-gpio {
-						compatible = "stmpe,gpio";
+						compatible = "st,stmpe-gpio";
 						reg = <0>;
 						gpio-controller;
 						#gpio-cells = <2>;
