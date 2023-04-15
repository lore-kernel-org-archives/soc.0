Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AFAC77B77
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F110EC4339B; Sat, 15 Apr 2023 10:43:33 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DF56C4339C
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DF56C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-506767f97f8so1932545a12.1
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555411; x=1684147411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5buqkue5965jfQy5B2BdRMuK1Vit+T6gg2ptTUMAnCo=;
        b=JbNLf4kZtv5Gjgl0zLLoKT4pJSwleFT3ifkJekiFLaat6x5g4dVnqrHkkCEn1H0rNL
         bec3i9Nj5vmMLznJbar3okJAxZCj1hJ15TixBGdrHRt485nQYXyvih6vXLh1DBx95aWh
         yy7/G1ZTNTCCTJbyDiI44ip363NsgriVktYooVC8R5FxrBWkNqeHC1Z2o7GIgRPeik7H
         2bJ5sZgeW/yAFkbO+XqkmDOOOr+QHnj/rsMFGrwWBpvayPfpQbijX70hTRCh3P/bkvug
         ez3SGh67/kYA3QZ8aPzVWL863MoNKbW1NYFYw2Zh/qSAgQ/Dec47sL1schb0hTXirCmj
         ydWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555411; x=1684147411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5buqkue5965jfQy5B2BdRMuK1Vit+T6gg2ptTUMAnCo=;
        b=X9TsG1bxeecwYfPQIP0sHfUK2AzwoeBdb2EHiv8prVniKLDVaoRZnvsUvxi5R8O6jG
         AUqWeKVDqDdjJyInomn+GNhz5odpSWPr0rvKvL3kre94Ya89dRsAlUQXn54Efg9MAXWz
         bL6ntprX5O177+y8ypZYMf+Q6dpGTkBz1mkOZ4qEdV0TVR9G22Wb/ZJO5T4HbfapA0Ll
         /wFiIbk0+jsJriFGEM/1Wv4vBMLN3uv1mGyHT8rEMHmonaN7Rwqt+3m5GHzd2LbaQKs4
         FUYCpyS40NLnV20eiJX13RiIzJO0RxDAT6SIZxcF8/egK/YbJax089sC/WbfwXlu92F8
         LtBA==
X-Gm-Message-State: AAQBX9dc/54rL4zhT+5GrdzQWrtdL/WB/73wUUnEUCzQXE4+A9xlkyQg
	lDJyzD7I1Mi2cXmsI/GFeUcQIw==
X-Google-Smtp-Source: AKy350ZKvLWv7f/2M2Sgzqt65cxEHQTSAG6DpgZTuH7ADx+YAHDCfjCjqt3IgUqQLWy0Lug5eSJBOg==
X-Received: by 2002:aa7:d48a:0:b0:504:b313:5898 with SMTP id b10-20020aa7d48a000000b00504b3135898mr8886150edr.27.1681555411461;
        Sat, 15 Apr 2023 03:43:31 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 14/15] w1: omap-hdq: remove unnecessary ENOMEM messages
Date: Sat, 15 Apr 2023 12:43:03 +0200
Message-Id: <20230415104304.104134-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Core already prints detailed reports on out of memory:

  WARNING: Possible unnecessary 'out of memory' message

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/w1/masters/omap_hdq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
index 826207c24bd0..6a39b71eb718 100644
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -573,10 +573,8 @@ static int omap_hdq_probe(struct platform_device *pdev)
 	const char *mode;
 
 	hdq_data = devm_kzalloc(dev, sizeof(*hdq_data), GFP_KERNEL);
-	if (!hdq_data) {
-		dev_dbg(&pdev->dev, "unable to allocate memory\n");
+	if (!hdq_data)
 		return -ENOMEM;
-	}
 
 	hdq_data->dev = dev;
 	platform_set_drvdata(pdev, hdq_data);
-- 
2.34.1

