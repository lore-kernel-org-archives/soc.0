Return-Path: <SRS0=xfH4=2U=bootlin.com=kory.maincent@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86417C43217
	for <soc@archiver.kernel.org>; Wed, 19 Oct 2022 13:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40DEEC433D7; Wed, 19 Oct 2022 13:32:20 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9086DC433C1;
	Wed, 19 Oct 2022 13:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9086DC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F0121E0004;
	Wed, 19 Oct 2022 13:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666186335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lhiCYLQFvv0VNmNRXtrzuQS+x+dk0THDr97Yf1PzbkM=;
	b=RTbIUUpviy3RBFy4C92Nl+g/4+7ZKXbm5bkEC2seFprdfYb8gvVvUp21ePX1ic6naKZaDf
	fLKiEUvJjZSqF8t1HbIeRqksG4CzSecbjvOhSTWYNM/IKa43kVateKGuDPT59pOvGrkqe9
	Z5Skfi8erhZpefeK2gHMRs6qSBuVRPQYP2kOapMbZKTJY4Y44dZ2qaPe247uvhRHmIFo5W
	XGEpbvorPY4gbgx2hbt4h6NY/KF8or3XbZg5Sb923YC69L7JIJnI1LZG86mlUzEb41OHkC
	EcYUO73S2e+07lxcopUDLwFalB6AHWljl7OEc+TuKsXLw4dZ6lgWN448ZNYawg==
From: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
To: Rajeev Kumar <rajeev-dlh.kumar@st.com>,
	Bhavna Yadav <bhavna.yadav@st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Deepak Sikri <deepak.sikri@st.com>,
	Vijay Kumar Mishra <vijay.kumar@st.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: thomas.petazzoni@bootlin.com,
	Kory Maincent <kory.maincent@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vipin Kumar <vipin.kumar@st.com>,
	Vipul Kumar Samar <vipulkumar.samar@st.com>
Subject: [PATCH 2/6] arm: dts: spear600: Fix clcd interrupt
Date: Wed, 19 Oct 2022 15:32:04 +0200
Message-Id: <20221019133208.319626-3-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019133208.319626-1-kory.maincent@bootlin.com>
References: <20221019133208.319626-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kory Maincent <kory.maincent@bootlin.com>

Interrupt 12 of the Interrupt controller belongs to the SMI controller,
the right one for the display controller is the interrupt 13.

Fixes: 8113ba917dfa ("ARM: SPEAr: DT: Update device nodes")
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
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

