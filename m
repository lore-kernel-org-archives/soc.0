Return-Path: <SRS0=OCyK=3C=bootlin.com=kory.maincent@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AAFC4332F
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 17:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F4ADC4347C; Wed,  2 Nov 2022 17:10:39 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB9FAC433D6;
	Wed,  2 Nov 2022 17:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB9FAC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E8A9610000B;
	Wed,  2 Nov 2022 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667409034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KYBK5k2s8EG/YP+dGH+hD0jM9bq3cBqVP2T7Rex7x7Y=;
	b=jgmnROX/jjYlKksIviewePdP+mRJJwCfsGZCr+BaSDRMVENY1TedvNF/hE4yeBMqwaIyY/
	DMMC6szGy8gWvrglPkJ14/EkcKxgGI0jyxnVxdkS4iaWTTTwVdoTkYnTIZ47sn3utn8982
	z/ertK095Cc9xbqDatSlFnR9NuYZTMmU9+UiWQkHYt1QYu9qKu5DHzjDjIjH8uQjZ8Vx0k
	IrrYObdUTgGcaprMaByz9U5AUkooYFx14G2qO9AUoA6uX/PiyghntfG5bdw730cMG39U6d
	klb3cOP5nL3u+QSHxhS5PXRk7AGUicBRKU0JB99UwA0FxN0q2b5Kc7CMNGjpMw==
From: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
To: viresh.kumar@linaro.org,
	Rajeev Kumar <rajeev-dlh.kumar@st.com>,
	Deepak Sikri <deepak.sikri@st.com>,
	Vipul Kumar Samar <vipulkumar.samar@st.com>,
	Bhavna Yadav <bhavna.yadav@st.com>,
	Vipin Kumar <vipin.kumar@st.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Vijay Kumar Mishra <vijay.kumar@st.com>
Subject: [PATCH v2 2/6] arm: dts: spear600: Fix clcd interrupt
Date: Wed,  2 Nov 2022 18:10:06 +0100
Message-Id: <20221102171012.49150-3-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102171012.49150-1-kory.maincent@bootlin.com>
References: <20221102171012.49150-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kory Maincent <kory.maincent@bootlin.com>

Interrupt 12 of the Interrupt controller belongs to the SMI controller,
the right one for the display controller is the interrupt 13.

Fixes: 8113ba917dfa ("ARM: SPEAr: DT: Update device nodes")
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/boot/dts/spear600.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/spear600.dtsi b/arch/arm/boot/dts/spear600.dtsi
index fd41243a0b2c..9d5a04a46b14 100644
--- a/arch/arm/boot/dts/spear600.dtsi
+++ b/arch/arm/boot/dts/spear600.dtsi
@@ -47,7 +47,7 @@ clcd: clcd@fc200000 {
 			compatible = "arm,pl110", "arm,primecell";
 			reg = <0xfc200000 0x1000>;
 			interrupt-parent = <&vic1>;
-			interrupts = <12>;
+			interrupts = <13>;
 			status = "disabled";
 		};
 
-- 
2.25.1

