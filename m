Return-Path: <SRS0=zUad=FY=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0635DCD98C0
	for <soc@archiver.kernel.org>; Tue, 10 Oct 2023 22:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5512C433B6; Tue, 10 Oct 2023 22:49:58 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E73DC433AB
	for <soc@kernel.org>; Tue, 10 Oct 2023 22:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E73DC433AB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3248ac76acbso5508510f8f.1
        for <soc@kernel.org>; Tue, 10 Oct 2023 15:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978194; x=1697582994; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zurLR0/e73s9qaXsNiBj25J3OO2Gwg9apCX41yzLfwU=;
        b=JSbtoSZcWRmMxhO9GKbRrv+K9I25FMHju9gn5NAhriX1PMAy+xi4C9L+jxL6xVAK/q
         zMGJEKrtdtmaA3SE5+uYHTL0n6fGHMBFcH5Occ99apoOaRon9B+xs7Ig0Pr9TXu47EEh
         Z9ybPqoNOoJ+REO5blL7jF3H7GAYY1hIU+UvVHLssquxQqLbJNTxo8O/xCDMB5+Jw2H/
         f9sXtieKauiMj7G3aM4NswCJnZMaufIKjB4dDQ7z4+mmzzOZEGETMPOLtj5DOtnHBP+p
         7IgG+rK0XI7hLPv1fMAOsXITKeN1FA/l49exUVaEZJblLU+9soMSoiuH9x+5uu+2j4Qp
         tHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978194; x=1697582994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zurLR0/e73s9qaXsNiBj25J3OO2Gwg9apCX41yzLfwU=;
        b=O0jE/NPzuE93WlJoriv9nl6bMThC08wIJljR/MogUskA+AC94PR3G7FZjwgyuaOKKM
         RXziFCSDViLg8NCLB6yYryBLrz/x8uBecv9NoPejslgITfdxpejtIsvcmRhslkii+zwR
         ilHaoQYIOEtW1bQnd5OAJMyzq7CwFypL2R5eSBs+K5qf3Og362vkcgCCJXZdDuoEndUP
         MuYRweplyPVPetXhHWs5M+YfTEI3nFURcMDT0TyjxVnxuqLEoRq+902J0qmA31D2bSEI
         VWiArB702GfgyljgLcgWrrCKXZfgyPcDz3N6+UE427lVShfuux+SL8+Scoh2JYoRWTMJ
         WT+Q==
X-Gm-Message-State: AOJu0Yxqrograb9wjXYRMrmFAugV62u9xFmplPRq8Zy3vPc8+/Gtbswg
	jLCzqsfiwftF35llpnjoZDvM3Q==
X-Google-Smtp-Source: AGHT+IEjsAdZZ2TrgAKTWEGnW3p1wMPoziKHfwDUL1AzluyyUU59YKFDtce6RDEjYzrGHYVBL9ceag==
X-Received: by 2002:adf:f40c:0:b0:324:8700:2fec with SMTP id g12-20020adff40c000000b0032487002fecmr15763212wro.64.1696978194557;
        Tue, 10 Oct 2023 15:49:54 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:54 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 06/20] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
Date: Tue, 10 Oct 2023 23:49:14 +0100
Message-ID: <20231010224928.2296997-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
documentation.

Add maxItems of 50 for the interrupts property as gs101 can have
multiple irqs.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 26614621774a..2464bc43aacb 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -35,6 +35,7 @@ properties:
 
   compatible:
     enum:
+      - google,gs101-pinctrl
       - samsung,s3c2412-pinctrl
       - samsung,s3c2416-pinctrl
       - samsung,s3c2440-pinctrl
@@ -134,6 +135,24 @@ allOf:
           minItems: 1
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-pinctrl
+    then:
+      properties:
+        interrupts:
+          description:
+            Required for external wakeup interrupts. List all external
+            wakeup interrupts supported by this bank.
+          minItems: 1
+          maxItems: 50
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.42.0.609.gbb76f46606-goog

