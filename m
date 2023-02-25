Return-Path: <SRS0=WHcG=6V=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983FFC6FA8E
	for <soc@archiver.kernel.org>; Sat, 25 Feb 2023 16:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 519FFC4339E; Sat, 25 Feb 2023 16:22:46 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4AAD7C433EF
	for <soc@kernel.org>; Sat, 25 Feb 2023 16:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4AAD7C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id p26so1669431wmc.4
        for <soc@kernel.org>; Sat, 25 Feb 2023 08:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4UzpVaZytKcLsXqShGzDCNEbw1p9sY2b5QAjio7ekeY=;
        b=ZPaVxQdfCRmnackJCVG2l50d8ypO+7nluWrSD/sL3W4gqsJo/rG0w6rFL8aFzWRkHO
         esuWfA+T+NmFuIXvgHH0TaJyMQVHdEjTx7bbENjK5OUxBctniG7DHPmlPUBocMY9Gt2W
         lxgfKdqoh91SEd+haH0Yb/sQvsGP2gKPt4cASb6vaVbXPk66t/BDbTohC7LIB/uI3BVe
         1IisnOMBvABLqG+PId07TyCVLBwyclJjR0wUE20N+LcF+eUs7Vdv7s5oQ+NVeSKlslDc
         EGqxbsOdPXxmCyjR1K/8BeNrn/zkmStAhxL7VYE0oYExMX9rj0uMGKZJWY1KRs0BgXT/
         qb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UzpVaZytKcLsXqShGzDCNEbw1p9sY2b5QAjio7ekeY=;
        b=S95BndtkiNEEEO+K3PhgKgjFuqkVJrDl3jYCWvHKXY1BG2xjeewYE3DWHV2gQRQvo5
         irOd+V/fU5SvSUBl7+43hbxNS2x3hfEbt9+d0/tKAc+4OigBPztxBNsfKFY6zqA66BXE
         KvI3QDUwzjs5CVUA/Es+Bm370jkPM5KBvMQs4R4nF8XdW38exQN5aDiKy3G+jcg7/54k
         /Cx4TdUld0/2Kqgi9mwUSBb+2cpL5bHIT76+gvLbzr5njggGFr5kXi/Sqy7xEtH5RmfC
         Khzhyow2iREXMz0YTkkW1ZYkNxieHXspX0+r0zJdPWn/AV1CX5FE3mexro2sMYx/VX+F
         IHMw==
X-Gm-Message-State: AO0yUKXfFEuqswtucmSn34m6BxBllEptEJuyBauCnwj+Ug9y4HbkgCj5
	kuAhcoi13fx1IbkvRPCR8K5wog==
X-Google-Smtp-Source: AK7set/Nod/Xia4rV9jLSmmGp54Zu4nS6/zzzbVWrPbcoZ/Om2gUpFAkQ6vS1IW1nmQJoiyZR6NZMQ==
X-Received: by 2002:a05:600c:2e94:b0:3e2:201a:5bcc with SMTP id p20-20020a05600c2e9400b003e2201a5bccmr10927795wmn.33.1677342162501;
        Sat, 25 Feb 2023 08:22:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i20-20020a5d5234000000b002c5493a17efsm2193087wra.25.2023.02.25.08.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 08:22:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: spear320-hmi: correct STMPE GPIO compatible
Date: Sat, 25 Feb 2023 17:22:37 +0100
Message-Id: <20230225162237.40242-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compatible is st,stmpe-gpio.

Fixes: e2eb69183ec4 ("ARM: SPEAr320: DT: Add SPEAr 320 HMI board support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/spear320-hmi.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/spear320-hmi.dts b/arch/arm/boot/dts/spear320-hmi.dts
index 34503ac9c51c..721e5ee7b680 100644
--- a/arch/arm/boot/dts/spear320-hmi.dts
+++ b/arch/arm/boot/dts/spear320-hmi.dts
@@ -241,7 +241,7 @@ stmpe811@41 {
 					irq-trigger = <0x1>;
 
 					stmpegpio: stmpe-gpio {
-						compatible = "stmpe,gpio";
+						compatible = "st,stmpe-gpio";
 						reg = <0>;
 						gpio-controller;
 						#gpio-cells = <2>;
-- 
2.34.1

