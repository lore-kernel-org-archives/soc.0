Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93575C77B71
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 09:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76677C433EF; Sat, 15 Apr 2023 09:39:17 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E7CEC433D2
	for <soc@kernel.org>; Sat, 15 Apr 2023 09:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E7CEC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-94a342f3ebcso478620466b.0
        for <soc@kernel.org>; Sat, 15 Apr 2023 02:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681551554; x=1684143554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PD8jCsTeYQriV7wAE/0X2NbGvAxABXFYQJ5UMz3CRWU=;
        b=NnUr0nrANizbMwQ+OFrF8pPZ2lV1uF3KsyCnXSIcC9HdXf4MHfvO6g5y/zxoVUHFtL
         uq9Qrz7vM/97m2FKTXwdX1dwEY1cQyOQbWlE3PeHNACR88mGlh9McXEKe4mW7c0sda19
         sQm+bFX/OSfCD4lyW/QG/iFnVFV2VJmcSjkL2f7n5yKOeqbLY8HRP20055jfP942d3rD
         y7FjiWFeAdZJsVXOwnp9uygq7/cT2Xj295Ual3vEhYfQzL9Fw4mFQKe3xG+QRx5uqsGX
         IJsP9K4yenfkVb0QyLB5uxhrUTJSCmJ22kbLxfq1JwiP8yNccHmFf6Ia+npbA8qjKRYa
         vapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681551554; x=1684143554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PD8jCsTeYQriV7wAE/0X2NbGvAxABXFYQJ5UMz3CRWU=;
        b=lvT7Gz3OBsq+vosuSCzb6SUnyveNrVrJ9JuhMm6xk6Xtk+3fIUpLy0D3Myzlvfvzyb
         Sqq2+5RY4VyMNEjv0zFQEp3dRyH90mdW421RNfAJviGnAAbJ6fb5UDuc1P18Q4MZCWsN
         C1E4ivK6FQZTQjeEzJkZ5/+DNIdtN8shSrNL90TsjgCfxLvd6Lb0tHSTJKJQrLK/37Ba
         bvjv+tMhm4PkA4DKxwHeejCaH3F34ub5JwSFowjU1lgujrEahzPqjyCtbKJeRCFoROph
         nn921/3FX5OAWPkDkYHwssb6BRG88uPnfR1tXtB6CuxB7MO2onwxjk8daADyR9n5aacE
         4A7w==
X-Gm-Message-State: AAQBX9fL8gXeQ9nKkIuOa/3SCaSvynj1536h6FEsSfS/+qyFvV+XP1O0
	KrtXq/8cPlpQDd3KWcSEB9sg+g==
X-Google-Smtp-Source: AKy350asCKZBROr26HaKLvDCLIsRVIkYjmh3G+qHfV5bk+GEx7t7sSH24egMT3zZMYzka4a82hh6Cg==
X-Received: by 2002:aa7:d616:0:b0:506:8e18:9e65 with SMTP id c22-20020aa7d616000000b005068e189e65mr2116159edr.9.1681551554352;
        Sat, 15 Apr 2023 02:39:14 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id s4-20020a056402014400b00501dd53dbfbsm3115490edu.75.2023.04.15.02.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 02:39:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Evgeniy Polyakov <zbr@ioremap.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] MAINTAINERS: w1: add Krzysztof Kozlowski as maintainer
Date: Sat, 15 Apr 2023 11:38:56 +0200
Message-Id: <20230415093856.41948-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Evgeniy wrote that he no longer takes patches for 1-Wire/W1 subsystem,
so add Krzysztof Kozlowski to help reviewing and handling these.

Cc: Evgeniy Polyakov <zbr@ioremap.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/all/bdcf41d5-cd61-1e95-0b21-b8fe401644bd@ioremap.net/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f74d8571ac9..189001228c77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22594,7 +22594,7 @@ S:	Orphan
 F:	drivers/mmc/host/vub300.c
 
 W1 DALLAS'S 1-WIRE BUS
-M:	Evgeniy Polyakov <zbr@ioremap.net>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/w1/
 F:	Documentation/w1/
-- 
2.34.1

