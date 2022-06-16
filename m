Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65A6CCA473
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9CFBAC341C8; Thu, 16 Jun 2022 00:53:52 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8A79C3411E
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8A79C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id bo5so111044pfb.4
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9qwwQJJVg91/nnmcAMwyXvHYok0DyJzSkywxG0QwUEU=;
        b=xaURczxPMBttLVmTmtGaORZcEYgKETRyblkz+ZCrDhSyDx2Tunc/S2v8DC6VVYxdqK
         sRYGcjKJkLZD2qlzFfenHjs4qBn6hPw5b4IK7kPrM9ujAYOCNJATsV5dBU/o215GwiWs
         Y4mVuoaR/mKo2TTBKc4n+bFkeF3Z+V77bUy6so1KRprO3lBj5ovtvXtmyk1rWLtmw0Tw
         uVcOPE0LvTostMvW0hrjQfH7aRN1s9fJ/m8qN8u3k1UgWCk53kA03nG4zENG4/WdKUU0
         v8/TRoGNfK638qSEbnBztIgwoL343SvYPGytjPwWSOlFI/Bnx+hHLBRQQJjMcekGRxNC
         bYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9qwwQJJVg91/nnmcAMwyXvHYok0DyJzSkywxG0QwUEU=;
        b=cEgw9kR1L554/UBmhlNClMS5r6OgVbJpH4/xGvFg7oVzL6PQZOUafhAhoDYLTjCwJJ
         LD2nub2/xgvKw1xDZHfHAMK1Itzzf2PW52hTIfR84Hsh7heUuZpwBqihOJrRy1ejzbVl
         Y59AXQlQLGKuOZL9F9mrm8N+hpXVTmfWSL3JlsLSwkI5/ltYxCTZlcsPMGjDb6mhAM3F
         YoqFlr/sV8P5HI8rZH9NpzJbQdyycAaGngXrvtwIUI1B9jezQhDc9VEAEn8yc4ULdgYS
         jp5qcK5gL3vyZ4OTjLGZWbw5DZqJWjK5qXMbsUBk+m4dwaNMyZLmnzAEGR1aZ3FViEAP
         36jg==
X-Gm-Message-State: AJIora8sZmdjeUcJO6XJTlMgeEfZldswfSYpSk70F0Zts1UwHXRhS53h
	WfYKq8luq2NVbXSef6xwV9s1eg==
X-Google-Smtp-Source: AGRyM1tlL6hO/EWZAR4S1GVC5e2TtQKXy+/+OmKG6Mf2UDs62lOXQ/aqvgoOhUOd/krZOVlMkKPPHQ==
X-Received: by 2002:a63:4e62:0:b0:398:cb40:19b0 with SMTP id o34-20020a634e62000000b00398cb4019b0mr2136424pgl.445.1655340831593;
        Wed, 15 Jun 2022 17:53:51 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:53:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 03/40] dt-bindings: input: gpio-keys: accept also interrupt-extended
Date: Wed, 15 Jun 2022 17:52:56 -0700
Message-Id: <20220616005333.18491-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each key device node might have interrupts-extended instead of
interrupts property:

  fsl-ls1028a-kontron-sl28-var1.dtb: buttons0: power-button: 'anyOf' conditional failed, one must be fixed:
    'interrupts' is a required property
    'gpios' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/gpio-keys.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
index e722e681d237..17ac9dff7972 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -92,6 +92,8 @@ patternProperties:
     anyOf:
       - required:
           - interrupts
+      - required:
+          - interrupts-extended
       - required:
           - gpios
 
-- 
2.34.1

