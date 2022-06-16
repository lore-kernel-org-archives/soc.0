Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE950C433EF
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B56D3C3411A; Thu, 16 Jun 2022 00:53:51 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E798C3411F
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E798C3411F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id bo5so111044pfb.4
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cvvN8aBgTj9HE/8ZJgUwMRYXoKBSvquSuql4gX904u8=;
        b=m4X8tc/NeQV4uX2ihYpGARyheg93SpNMVBaA/z+4HAdniayLLeti8D1EIlsGvdTmI7
         OGunSmuBHcNa1fceZCkfcknYCf27JwxhewXCg0kQzOEI/bd/gFp/YavdRZBd9i8dRuaa
         UWWR2cdaxdFMxGGmRuLfs+KgyV4f81ZDl2UqJ8vC1jK8oOu8AlO2bibruHvTq52teMay
         vmLoL9VcE01zsyXEombWiXhOfQgn1dX/aakTXqEJkdqH+OHTvZbiyswbEi4xhkL9pTiT
         JqOyz4L1pPrk+6ZBowqLVvI7IMOQ+2dYj61wd3Ki3GJP/bsTLkpmmGL8wAWDQAP1ZJh1
         Olcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cvvN8aBgTj9HE/8ZJgUwMRYXoKBSvquSuql4gX904u8=;
        b=XcaxSy/PbCqfKeVOQVdEGLeyplEXzPH8VD1eUUBU6aKw0vUD9CnkadENCiC712pJgl
         6y/R/ZpCNsVtRJC+oBiq0A5sm4qhKvwfDW4xYUjCVGRi+FlmDGdZeioGlWo8YjACgmzR
         j3LZ3QZmACEuRM52lBxMdLzM3CDRmNmww2tl56p4eXkWb2ZpgmqG183Yd8HPOZuNC9zm
         Z4g07Ed54SzNuXvpE9jtByxS8HSBgyJ/Iecc6/39ZUSWdRIp1+Ujd02w1ZxVdtkZmTLO
         bHozOUqzQ2fvvEU3Bw4afuBrcJUgFpVQWfQyp2D+XAo459VJ51vp2VjrKBXdVjNEx0iP
         G1PA==
X-Gm-Message-State: AJIora9MK3Lo7MRanwsY9COtg5pG/pE9GRijIPJQjDA5MlyYYTbBezSX
	qRwZMyflfI63i21BhQ/Aoo55hw==
X-Google-Smtp-Source: AGRyM1trMeeEPUM8xA2lwAFvt7jemmODw29ElIK08LzXDNqlwQ4AIXWQuAPAAAOL5K9gcbHeI7raFA==
X-Received: by 2002:a05:6a00:1a8f:b0:51c:2f82:cdba with SMTP id e15-20020a056a001a8f00b0051c2f82cdbamr2259455pfv.85.1655340829859;
        Wed, 15 Jun 2022 17:53:49 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:53:49 -0700 (PDT)
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
Subject: [PATCH v3 02/40] dt-bindings: input: gpio-keys: reference input.yaml and document properties
Date: Wed, 15 Jun 2022 17:52:55 -0700
Message-Id: <20220616005333.18491-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original text bindings documented "autorepeat" and "label"
properties (in the device node, beside the nodes with keys).  DTS use
also poll-interval.  Reference the input.yaml to get these top-level
properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/input/gpio-keys.yaml  | 32 +++++++++++--------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
index 27bb5c6ab8d9..e722e681d237 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -15,6 +15,13 @@ properties:
       - gpio-keys
       - gpio-keys-polled
 
+  autorepeat: true
+
+  label:
+    description: Name of entire device
+
+  poll-interval: true
+
 patternProperties:
   "^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$":
     $ref: input.yaml#
@@ -94,19 +101,18 @@ patternProperties:
 
     unevaluatedProperties: false
 
-if:
-  properties:
-    compatible:
-      const: gpio-keys-polled
-then:
-  properties:
-    poll-interval:
-      description:
-        Poll interval time in milliseconds
-      $ref: /schemas/types.yaml#/definitions/uint32
-
-  required:
-    - poll-interval
+allOf:
+  - $ref: input.yaml#
+  - if:
+      properties:
+        compatible:
+          const: gpio-keys-polled
+    then:
+      required:
+        - poll-interval
+    else:
+      properties:
+        poll-interval: false
 
 additionalProperties: false
 
-- 
2.34.1

