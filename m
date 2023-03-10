Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75936C64EC4
	for <soc@archiver.kernel.org>; Fri, 10 Mar 2023 10:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A875C4339B; Fri, 10 Mar 2023 10:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962D9C433D2;
	Fri, 10 Mar 2023 10:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678445525;
	bh=sUG9RtqNfi0VgbpM+axsNbVnoD+hWXLV3PLqsWazkvE=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=W0U+X81wrSJkO4+pvFBSq5OQjZo5wfnR7FMvspSmpJvntmh95qNTw3VB1kHF7eJTn
	 9nwIxIyrYBmDzfR18FrGuP5F4WPQw4Y2EUaBXqGL5eReBxgJ8o4A+sdJtmibf+NiUf
	 /ioYWX6lr5itIGiQGH3u73AlEFPcaUf41Fn93CNRpsDXsTRfRQPQVjaiT3fUGfeEo3
	 aogeNi2bvO/edlexXwabnulrxxiZ3SSs4Q4cXyvzQK4+GyNiW6PQ7pplEnXANGSXRx
	 E9xxt6u2cTU/UH20j7XQxnMinnt0bjbZ+yiL/JvKQOxEGvbAA/HSKQlZmVNw8+U6HX
	 1t9HZar/FnYDw==
From: Sasha Levin <sashal@kernel.org>
To: stable-commits@vger.kernel.org,
	krzysztof.kozlowski@linaro.org
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Patch "ARM: dts: spear320-hmi: correct STMPE GPIO compatible" has been added to the 5.15-stable tree
Date: Fri, 10 Mar 2023 05:52:02 -0500
Message-Id: <20230310105202.3085996-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

This is a note to let you know that I've just added the patch titled

    ARM: dts: spear320-hmi: correct STMPE GPIO compatible

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-dts-spear320-hmi-correct-stmpe-gpio-compatible.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.



commit c289c90a769d8a28711d9714dc8864ad64ad2d5b
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
index 367ba48aac3e5..5c562fb4886f4 100644
--- a/arch/arm/boot/dts/spear320-hmi.dts
+++ b/arch/arm/boot/dts/spear320-hmi.dts
@@ -242,7 +242,7 @@ stmpe811@41 {
 					irq-trigger = <0x1>;
 
 					stmpegpio: stmpe-gpio {
-						compatible = "stmpe,gpio";
+						compatible = "st,stmpe-gpio";
 						reg = <0>;
 						gpio-controller;
 						#gpio-cells = <2>;
