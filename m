Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DB9C3DA7A
	for <soc@archiver.kernel.org>; Sun, 25 Dec 2022 16:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 451A0C433D2; Sun, 25 Dec 2022 16:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657EFC433EF;
	Sun, 25 Dec 2022 16:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671987052;
	bh=JCCOZnt3UbVX8+Pcl+PTdJ8ibNdt2Th19YuSTthkoF4=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=fxcd9IXN5udBdXWYBosUUfbgXTtNQXxO0DTjgmBYhH7wSbbQIyMOsddR1Qp5jm1rY
	 nfjKp1GQpy8sP28lfjWZazuw+Fhg4U+yvWMl7DhKRntYwUseeOnaECSrV4sIyIyH5Z
	 x1t2v7j6XGgXfzPMar/Tyzim3s8gw/oeZGFGVrXnUyBlyu2tJUQsEckG99m65Ms+3C
	 1DCJenB2oA+s3KoVuErdX82Or6Iir4DobJN1ZGEylgDDCtP+ZQuaqaQSHsscKU52gd
	 /V+sdJAbkTzmZkYUZMkpxXEKq3PAOTSvQJM/1+1geTboHdMJRVqFAV8uk4uz/IdC9m
	 pXXJUfS5My/1Q==
From: Sasha Levin <sashal@kernel.org>
To: stable-commits@vger.kernel.org,
	kory.maincent@bootlin.com
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Patch "arm: dts: spear600: Fix clcd interrupt" has been added to the 4.14-stable tree
Date: Sun, 25 Dec 2022 11:50:49 -0500
Message-Id: <20221225165049.746958-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

This is a note to let you know that I've just added the patch titled

    arm: dts: spear600: Fix clcd interrupt

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-dts-spear600-fix-clcd-interrupt.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.



commit 52a169376b5f7c505385e3b10717d5a0c2775006
Author: Kory Maincent <kory.maincent@bootlin.com>
Date:   Wed Nov 2 18:10:06 2022 +0100

    arm: dts: spear600: Fix clcd interrupt
    
    [ Upstream commit 0336e2ce34e7a89832b6c214f924eb7bc58940be ]
    
    Interrupt 12 of the Interrupt controller belongs to the SMI controller,
    the right one for the display controller is the interrupt 13.
    
    Fixes: 8113ba917dfa ("ARM: SPEAr: DT: Update device nodes")
    Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
    Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

diff --git a/arch/arm/boot/dts/spear600.dtsi b/arch/arm/boot/dts/spear600.dtsi
index 00166eb9be86..ca07e73e1f27 100644
--- a/arch/arm/boot/dts/spear600.dtsi
+++ b/arch/arm/boot/dts/spear600.dtsi
@@ -53,7 +53,7 @@ clcd: clcd@fc200000 {
 			compatible = "arm,pl110", "arm,primecell";
 			reg = <0xfc200000 0x1000>;
 			interrupt-parent = <&vic1>;
-			interrupts = <12>;
+			interrupts = <13>;
 			status = "disabled";
 		};
 
