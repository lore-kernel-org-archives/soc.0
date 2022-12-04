Return-Path: <SRS0=WPFH=4C=schmorgal.com=doug@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FDBC4332F
	for <soc@archiver.kernel.org>; Sun,  4 Dec 2022 00:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE2BEC433D6; Sun,  4 Dec 2022 00:51:58 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D52C6C433D7
	for <soc@kernel.org>; Sun,  4 Dec 2022 00:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D52C6C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schmorgal.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=schmorgal.com
Received: by mail-pj1-f44.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so8284169pjo.3
        for <soc@kernel.org>; Sat, 03 Dec 2022 16:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kkp6H4X+fpDMPFBsB8sOoDo9ZeS/k8d6GtMAjtbvGiY=;
        b=mVAcfpH3dVqP7p/ORvMYN5pgMRXcaLiqslxX34EuUqBNNhn+QFxZB2qK7OesAPRlHa
         XNmgh+sDi1ydPwQV9oXILG49j4VmSmgNhHnBTyEsHk//o4EbjJkZrY8lKQUE3u3bX0wc
         vBEQsDthL3NmbTrAIAgz5tE08tBHGGkYMa+2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kkp6H4X+fpDMPFBsB8sOoDo9ZeS/k8d6GtMAjtbvGiY=;
        b=PFdnSq6EFQ34Bg6nvC3e+yfsm/u6xlsuntkc4ibpmpB6BLHZKxW304Pcpkcxj4fuhC
         6wRgvJSYaeYkTK05mQCUyfKYJdHdAKjOCtedFCzCCKh4kei2UpDV7Z2d/7P5rVTJCv1x
         VOWBufj2v5j7ReFYQxO7tIYCeaU+oz4OgVBc9MRVB9o4FJTA8GoP4VzzQgyIFrH+AGJ6
         i8o/IwToZlEPZ7OUPBTJ0jBkzqAQ50r6Ml3ELnR6hps269RZQMX9M7mxiyzpauHApwyS
         i7p8Q5hZBwC/rl5Mvtz3FqIEOWYz9R48UyRMtIuH02s8Igo+i32nnddLfXFC5pzwCkQf
         81Iw==
X-Gm-Message-State: ANoB5pkBvPbqOrktxiN0iNQIxjNW841rcICOB6G263af5PuZD4pujCmV
	TeZ2Wdd7wViDoBtsNzeDQR2VXw==
X-Google-Smtp-Source: AA0mqf5J72lgZlsrjE7EnY6shxwoidkz0ut9aVO2Zn7wbp/iIrqhDchnHtRBsf/3ccPViaK9XoheMA==
X-Received: by 2002:a17:90a:9a85:b0:219:1353:f66 with SMTP id e5-20020a17090a9a8500b0021913530f66mr43397648pjp.190.1670115117209;
        Sat, 03 Dec 2022 16:51:57 -0800 (PST)
Received: from doug-ryzen-5700G.. ([192.183.212.197])
        by smtp.gmail.com with ESMTPSA id 24-20020a631358000000b004393f60db36sm6058977pgt.32.2022.12.03.16.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 16:51:56 -0800 (PST)
From: Doug Brown <doug@schmorgal.com>
To: Russell King <linux@armlinux.org.uk>,
	Lubomir Rintel <lkundrak@v3.sk>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Doug Brown <doug@schmorgal.com>
Subject: [PATCH 1/2] ARM: dts: pxa168: add timer reset and clock
Date: Sat,  3 Dec 2022 16:51:16 -0800
Message-Id: <20221204005117.53452-2-doug@schmorgal.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204005117.53452-1-doug@schmorgal.com>
References: <20221204005117.53452-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The timer was missing the clock and reset like the other peripherals.
Add them to allow the timer to continue working after boot completes.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 arch/arm/boot/dts/pxa168.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/pxa168.dtsi b/arch/arm/boot/dts/pxa168.dtsi
index 4fe7735c7c58..16212b912b94 100644
--- a/arch/arm/boot/dts/pxa168.dtsi
+++ b/arch/arm/boot/dts/pxa168.dtsi
@@ -53,6 +53,8 @@ timer0: timer@d4014000 {
 				compatible = "mrvl,mmp-timer";
 				reg = <0xd4014000 0x100>;
 				interrupts = <13>;
+				clocks = <&soc_clocks PXA168_CLK_TIMER>;
+				resets = <&soc_clocks PXA168_CLK_TIMER>;
 			};
 
 			uart1: serial@d4017000 {
-- 
2.34.1

