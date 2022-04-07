Return-Path: <SRS0=ri78=UR=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13859C433EF
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 22:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EECEBC385A8; Thu,  7 Apr 2022 22:52:57 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35F7CC385A0;
	Thu,  7 Apr 2022 22:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35F7CC385A0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id v75so7205197oie.1;
        Thu, 07 Apr 2022 15:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wcjcXdrrKeTILsdee3EFxDpF+gt6sT7ltJDO5X75a7E=;
        b=cdE6VEH9146ZsuVP7La+LpgGxElrsVndlTbEkOTeQXlMx+LdKiKXWv7Ri8CPbhckME
         /KtxA6ufcAaBpOxEam5/2VW+xfq+HVO5SYH+VdJjiZP1kzFhFDUWweouVPCbhbKJwMFP
         ACkxhsGJavXRMBm9c7xELfjgAdH7cv4zRPp12kzbJNiRsSeJeD0F5K63ubxFlXz5ezMF
         gN4dmMe0sGTbCssCx0VWjvEp3uZshhRnZADmfNKimImGYDRfTsSfey0UL+AJnYM2D+Kd
         qqZS/6MBjs5p3kl8oZ59rr87bWsfnBd75GK2tos0+Hwozvkk1X8OrvHP1e/2hkTTGhY8
         y+Lg==
X-Gm-Message-State: AOAM5303SqKpr7noUvo2xDEiGZ+cPBv3KGIQ2S5oo4srtDxbS7AGuvsy
	s7OyNwt/KmcdtClmn4+w4J8mCAdlkQ==
X-Google-Smtp-Source: ABdhPJyDbvxVfMG2eRw3vUNka/aMqjhgJ4TqyIHAX9Xb+93TaO0KuYqphbYvkb0xvay1F0IAqmEjGQ==
X-Received: by 2002:a05:6808:e82:b0:2d9:a01a:48c1 with SMTP id k2-20020a0568080e8200b002d9a01a48c1mr6997148oil.268.1649371975502;
        Thu, 07 Apr 2022 15:52:55 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id y15-20020a056830208f00b005e6bf82e0b6sm421954otq.46.2022.04.07.15.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 15:52:55 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom/sdm845-shift-axolotl: Fix boolean properties with values
Date: Thu,  7 Apr 2022 17:52:54 -0500
Message-Id: <20220407225254.2178644-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Boolean properties in DT are present or not present and don't take a value.
A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
matter.

It may have been intended that 0 values are false, but there is no change
in behavior with this patch.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please apply for v5.18.

 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 8553c8bf79bd..103cc40816fd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -563,7 +563,7 @@ mux {
 		config {
 			pins = "gpio6", "gpio11";
 			drive-strength = <8>;
-			bias-disable = <0>;
+			bias-disable;
 		};
 	};
 
-- 
2.32.0

