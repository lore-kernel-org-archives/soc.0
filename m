Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C344C433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 817F1C34116; Thu, 26 May 2022 20:43:45 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4714C34113
	for <soc@kernel.org>; Thu, 26 May 2022 20:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4714C34113
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id o28so3175095edi.1
        for <soc@kernel.org>; Thu, 26 May 2022 13:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kszyFo4EB09RE8Bso76US2qsMXSYLT6NOSolpKWxpEc=;
        b=nG3cA1barxnVxFUhlt87IM3G+wHT6ZfcrTyFAZsJU8xsoZylJP1A0gltk1XDGO5u4B
         7OUZojhtmRRwlBjEls1VpYg29PlEiZmteApR+Lxz62sU1Niw7Q8rcaIYh47jt/dcK/zL
         hzvmDfdLu8sjNs6txDEugyHI0edyFwZb7lBYJdbYHccVACvqiPIk0OB0eRmiW0UcpqCL
         IIQ2XXrPDqPCbDq74RnV5Z174QSfjMHJUgQ/s9F9hZoxp8Y7Jd4LsGLxla40pfEBvaaJ
         e2/Pgp3KWO2lv1q2y6NLn5yuf2n6G8GkTBEna551xIfsyX3vK2AlURwsEl5rj2jSYc6p
         XWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kszyFo4EB09RE8Bso76US2qsMXSYLT6NOSolpKWxpEc=;
        b=hRBDTu0ecVURXgxe7N//IqQD9mNMzzkAecdvvTKO9O+83Z8tVgNQPqIPEaz0+erTpi
         5QGiWFBKt+R+C+ELgOWWK/ZC5xPzlC5I6TkBiqeyVX4YS9pqiUjqipaBzCP4orKcqpsj
         /xUBy0rk2rg5EJT2+s5XGaHXb3kV0EqEh3+rjZHrbFQK/FKaOnqyMm1oduefEIU72uc/
         uJH1ZE8f1SK3Ss89vx/AMTjdCHb3Sc2/1NRXnzVskJ+RXzMwQNbcOs1/nA3nRnOZv/V6
         dJut/Cb9ygbec2afyBgGrZvl37c0be747cRcImzmWhiKBxrhRvdytOTleHFzjn7M2U9T
         UJUw==
X-Gm-Message-State: AOAM530ZRn6Klg3zXez5rXwFN2bwVasw8K4Jww4m09z+uILZnESNCu6W
	WTaZnFpAOueMywbLGkyYhr+n6Q==
X-Google-Smtp-Source: ABdhPJw5GC65gWJ6TIdXxmfyuCi/FcX5QMBEBpnmEzWM9qJmahZ3QmBLR/RJVUw9kLFMFBIH9bU0Bg==
X-Received: by 2002:a05:6402:370c:b0:42a:adfa:9150 with SMTP id ek12-20020a056402370c00b0042aadfa9150mr41749552edb.57.1653597823124;
        Thu, 26 May 2022 13:43:43 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id qw39-20020a1709066a2700b006f3ef214e59sm788041ejc.191.2022.05.26.13.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:43:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: broadcom: adjust whitespace around '='
Date: Thu, 26 May 2022 22:43:38 +0200
Message-Id: <20220526204339.832296-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index 09d4aa8ae1d6..8f8c25e51194 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -567,7 +567,7 @@ enet: ethernet@340000{
 			reg-names = "amac_base";
 			dma-coherent;
 			interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>;
-			status= "disabled";
+			status = "disabled";
 		};
 
 		nand: nand@360000 {
-- 
2.34.1

