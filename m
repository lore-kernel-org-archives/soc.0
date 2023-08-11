Return-Path: <SRS0=Jrji=D4=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2486FEB64DD
	for <soc@archiver.kernel.org>; Fri, 11 Aug 2023 07:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE457C433C7; Fri, 11 Aug 2023 07:00:13 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CDA73C433C8
	for <soc@kernel.org>; Fri, 11 Aug 2023 07:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CDA73C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fe45da0a89so3244313e87.1
        for <soc@kernel.org>; Fri, 11 Aug 2023 00:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691737210; x=1692342010;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZO+0t0pyCEILeWF9yOM0xEMb/3t8jNC2CHSy3xR9ZNo=;
        b=k213CQ0AdKd3A0ljiBUC9tNyrWo9vEYG/IWew7Gnux21rG8xC+JddPm5FESpiDar3d
         B/nUU7K4ldKuDYgGAnbK128kwozH7aBil+0ccmI7Kjc1YLSQcUJjte0PQ8LdLkEZujSK
         pTAScrsTnC7SelelxKPs6KoM7UHsXU+x20lW/d0cPme+QwDyT6uyj33Wby4Y7WFo83NS
         1S5t3Ezs9ahLy5Fxo1uo+r/jtFRD45l9ktweGmDohzdtZTncnMMDDFmZE8fqI9m99yPw
         Hnr+V9sbez0WhuWFeS9XLOu3swF0Q+JhN/qTvbnQY1YnMomvYjzskbRaMspSBHgWvjod
         rf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691737210; x=1692342010;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZO+0t0pyCEILeWF9yOM0xEMb/3t8jNC2CHSy3xR9ZNo=;
        b=gmnszwp7cdR0GBTK34U8bUsBxBusAUS0AeGVldlqGXU/bgR4yEx04F03/Uf+j8Slix
         lDK/85eVrk5CsUBGQzDe93dpaaJf3fxQ95JCX+D4+2o/tgCv1jYvMJPGGx3DAIxbnKo3
         34LMcJkXQ+ja9B/vZZ/3e+We/gnYYNHGtT6tTxTeRb9rglAS6YJrjSD8Xn3XjjMVkH9I
         JZBvWGTU0t5M2stdYRG6hwFf5ZDNyZusWnnlUrhAYhJwgRX7faIltUJPHd+K0knz7bIz
         H1+0Jnikdb/9ANRH83gbUi0iSOnfW9uROuZ6UapL0H+8xOncFUifz2gXs5hCvOvU6XR/
         tWPQ==
X-Gm-Message-State: AOJu0Yyzow9WB8f7CGDP43aj0Tn1CAyd7sWgCJinImVC+1DlFSJhQDpW
	r/RHq5oxN0RVQ6nU2IFew9qcNg==
X-Google-Smtp-Source: AGHT+IHL7DVVZChwcnoi9LN1Ihztgw830qsj9gy9QaJ8sihKBISU2+VNNcGWnfTCtaBezwfbYbVH3Q==
X-Received: by 2002:a05:6512:3111:b0:4fb:8938:48ab with SMTP id n17-20020a056512311100b004fb893848abmr379814lfb.16.1691737210600;
        Fri, 11 Aug 2023 00:00:10 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id c27-20020ac244bb000000b004fb85ffc82csm606425lfm.10.2023.08.11.00.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 00:00:09 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Aug 2023 09:00:06 +0200
Subject: [PATCH] ARM: dts: integrator: fix PCI bus dtc warnings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-versatile-dts-v6-6-v1-1-d8cb9d1947ed@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHXc1WQC/x3MQQqAIBBA0avErBvQoqyuEi0sxxqICkckiO6et
 HyL/x8QCkwCQ/FAoMTC55GhywKWzR4rIbtsqFRVq05rTBTERt4JXRRMLbborFlmr2zfOAM5vAJ
 5vv/pOL3vBy7XghBkAAAA
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Lin Yujun <linyujun809@huawei.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3

From: Lin Yujun <linyujun809@huawei.com>

An warning is reported when allmodconfig is used to compile the kernel of the ARM architecture:

arch/arm/boot/dts/arm/integratorap.dts:161.22-206.4: Warning (pci_bridge): /pciv3@62000000: node name is not "pci" or "pcie"

Change the node name to pci to clear the build warning.

Signed-off-by: Lin Yujun <linyujun809@huawei.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/arm/integratorap.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/arm/integratorap.dts b/arch/arm/boot/dts/arm/integratorap.dts
index 5b52d75bc6be..d9927d3181dc 100644
--- a/arch/arm/boot/dts/arm/integratorap.dts
+++ b/arch/arm/boot/dts/arm/integratorap.dts
@@ -158,7 +158,7 @@ pic: pic@14000000 {
 		valid-mask = <0x003fffff>;
 	};
 
-	pci: pciv3@62000000 {
+	pci: pci@62000000 {
 		compatible = "arm,integrator-ap-pci", "v3,v360epc-pci";
 		device_type = "pci";
 		#interrupt-cells = <1>;

---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230811-versatile-dts-v6-6-da7cbf0a95d7

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

