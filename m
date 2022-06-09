Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B870C433EF
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65AA3C341C0; Thu,  9 Jun 2022 11:39:17 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9499BC3411D
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9499BC3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id fd25so30836605edb.3
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yoi+zPkWqTTvlN+wO0cy6XLBUH8069tfMWIB3LL7MAs=;
        b=jiHkLK2k0V/g9+AU3CbOGfidj6TqBsk4kjV64geDER1L1xv+kpMA6vTWnvPc0C3HcS
         g8yVvr7jLk/na3LS/SGySvcKJPqXFiUPI7S/5y6LUCElhUncPQWSccSD+hLN4lryu3Mu
         LUnNeC5yPeRjldMXzw++Sohz1TSconnBpYNnZbZw+aJ18630ydwPup+sBYpkBNTK0I4o
         ii8PEtXpm02HpG9/z1Hy6kcnwfBJlcGHD0BVITC2VWhn8Jldo5DUSz9jaXiJYFm2wc0i
         69jQFNVwsQ+slukxmL3x5og1A9PjRJHXqtXW7THYyyw6Qy17CCsAJE1Ip9zIHNYqyg2Z
         t9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yoi+zPkWqTTvlN+wO0cy6XLBUH8069tfMWIB3LL7MAs=;
        b=Q+ZI35BoxN+AD3ypvxE7V5NBfqEw8vhJPELddYiQWVY/re8WDjSWV86A39ngq3I2Kz
         T6dgEe4dSsZLMbEWdCyjR0aVwBViYToE0em6JH5rgOlMMKmrmcZ+6zFvLm0wyzcv7Let
         cmZESbza3XeMhaQDTIIIRQda9TrMoA7VvG07Hf3z3TG5/gKI0v6+3nHf4uCrjCfECpYC
         NWAAsVQ9BinJCmnwJ/k5Sy+WSEGO9ihcywl6aWs4EoRd3V+jhvcubQ3qfDsVLaCsM0O+
         fF7VWPIZwCVIqG3y6Z9xRL1Il9P44uQFcKkMoO4bbb2HEoGCZJfh6JY6IDpjbp71Cm5g
         pcYw==
X-Gm-Message-State: AOAM532LF/6NtXahZ9K/GxfSPsLo9TecvNFe0qd/TUOmFvl71Jk+xMDM
	S6enkUk3tLIdEXSgWlLJh3RrZQ==
X-Google-Smtp-Source: ABdhPJy+7F28cex3h0pFanY6YezFkbHHuVzHYvL0vVNyCbO/DG3qqXf1BUvEgXxJsF4hNHkgS2Vp7g==
X-Received: by 2002:a05:6402:3586:b0:42e:2a6a:218b with SMTP id y6-20020a056402358600b0042e2a6a218bmr38718649edc.208.1654774754952;
        Thu, 09 Jun 2022 04:39:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7d54e000000b0042e21f8c412sm11898495edr.42.2022.06.09.04.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 02/48] dt-bindings: input: gpio-keys: reference input.yaml and document properties
Date: Thu,  9 Jun 2022 13:39:04 +0200
Message-Id: <20220609113911.380368-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original text bindings documented "autorepeat" and "label"
properties (in the device node, beside the nodes with keys).  DTS use
also poll-interval.  Reference the input.yaml to get these top-level
properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

