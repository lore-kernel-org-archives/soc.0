Return-Path: <SRS0=efRH=WG=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08F2C433FE
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 13:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D86C4C341C6; Mon, 30 May 2022 13:08:55 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C95DC3411E
	for <soc@kernel.org>; Mon, 30 May 2022 13:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6C95DC3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f53.google.com with SMTP id c19so16705494lfv.5
        for <soc@kernel.org>; Mon, 30 May 2022 06:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1+pzy9SDgwlLKqsqL0oBtRcoKaOTRyZQ9Q60hk5By48=;
        b=xLfsGBLRyM0zlUowQPJtZ60H3StxVqy8Lqev4bSZAFy0amMHwqRiLBFGA8qK+qWlwK
         l18ufKZ4AWRQq7kDXz9Wtx4O6YN4phZRnzUdMM1LXjVfoqj350pbYMONPB9yLEOBfLtN
         R+dqGwFfDh+G5DPe8qWmOrywVdGa290EVd9yJ4JJ4yvKBVVmNxpt4r9w1HMI4d3HJQC0
         vtEWSQ9Dj+05IoYkh5v5FIxACOMnrWENLm/DPfOOyJYnMd05WJcDdp1pGsUXqR6igeV2
         Oz8kU/UVoNCeKU981jzAAXyKyx1HZIH07mPSSM/EkPIlqNcWl1O41LAemsr6uarD082O
         gy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1+pzy9SDgwlLKqsqL0oBtRcoKaOTRyZQ9Q60hk5By48=;
        b=zhgtPX2OhXquTZ5Ri3ZCCja61NLuaM/QJCsPPZUu8U0DUD7wEETHkYwdjkLkEHg4sw
         s+RGjmw50Xu3Bsbv5oIw3YNYqfyp/pGHBHqfKyTKtpX8CM/VFNBvx2cfyOLhkeRD39lU
         r6G9XhopjE/1NiQPCQvWkrsnLqn6GWmexNhQQPHhxgdH0ULlg36EtVMoVBMnfXjdDk14
         LrDiV9kl+KFmu7nYrevwBcCnWUKwVayRz3wI8NScLZQzqro8WVTbaDHwNAQgEWduTWZ8
         975l18Q50VkPwXaeZZaxFcvOgP5/pforNWaFc/Rr6Uywpxofs75FdIekDor/EPFTbDp+
         1dPA==
X-Gm-Message-State: AOAM5305W/J0iOUbsrssnvI5q5q7rKCJemTunpn6Ouj3P3+dr0gF37XO
	8fLbAI2nbITAjEycvUVDeVeZHuPZ0DAwpw==
X-Google-Smtp-Source: ABdhPJxtZA3zoQCpEe2nZfqwlqRtuL4USD5PjImrVtzpcb+6U5nJP7UJY9wlvi9z7SOKd3rbjU89zQ==
X-Received: by 2002:a05:6512:3da0:b0:478:5b79:d76e with SMTP id k32-20020a0565123da000b004785b79d76emr33233584lfv.540.1653916132727;
        Mon, 30 May 2022 06:08:52 -0700 (PDT)
Received: from panikiel.wifi.semihalf.net ([83.142.187.86])
        by smtp.gmail.com with ESMTPSA id d22-20020ac25456000000b00477a7c8a0f0sm2295701lfn.295.2022.05.30.06.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 06:08:51 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: arnd@arndb.de,
	olof@lixom.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	dinguyen@kernel.org,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH 3/3] dt-bindings: altera: Update Arria 10 boards
Date: Mon, 30 May 2022 15:08:39 +0200
Message-Id: <20220530130839.120710-4-pan@semihalf.com>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220530130839.120710-1-pan@semihalf.com>
References: <20220530130839.120710-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Mercury+ AA1 is not a standalone board, rather it's a module with
an Arria 10 SoC and some peripherals on it.

The Google Chameleon v3 is a base board for the Mercury+ AA1.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 5e2017c0a051..c6e198bb5b29 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -25,7 +25,7 @@ properties:
         items:
           - enum:
               - altr,socfpga-arria10-socdk
-              - enclustra,mercury-aa1
+              - google,chameleon-v3
           - const: altr,socfpga-arria10
           - const: altr,socfpga
 
-- 
2.36.1.124.g0e6072fb45-goog

