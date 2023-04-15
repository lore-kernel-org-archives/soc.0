Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B2AC77B71
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D57AC433EF; Sat, 15 Apr 2023 10:43:28 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41D60C4339C
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41D60C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5069097bac7so345773a12.0
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555405; x=1684147405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCXVhY21NYv8g0uVv2aMkrRaQ5OFE2M1RqCENUZEQwY=;
        b=MaeoAEhme5S3w6Vvm2hlX3H8xIfe4cKomyHpefHejjA5ljeacJhQM/kb4o7+eiw0Lb
         hoZ/DxNAqYGxd2DYpb355e27sMyk8XGTNuJPFDVlQqT6M/xYcY7JMUblwZxhTDMSs2Ff
         JVHN5V5XgZEUn/lfe4teNo+OHcpeLfrSZu9LbLtvlxexDFltXHvJk3oQ3XQ+6cOEC4WZ
         oaeSaThl1C8vFWrP6nXOOK2ESynnOFKsSaF6xikIMLFYpBlCatoEFokHwK9zRFUDZuMI
         yCBGNUIVfqqmBp0+QOXDsrQdTzy62ff2qusUwOjiOhRNoBq4lIsS9z49QuIaoPN5jRzT
         U7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555405; x=1684147405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCXVhY21NYv8g0uVv2aMkrRaQ5OFE2M1RqCENUZEQwY=;
        b=it1FqDpRoz1+UD4PtIjnXg9VNDwNdCALmtRCQtGnCqr2s9yHehKhfTNcXCDTt0o03v
         0Y20ixcOnBscmTBDgOnw1MBkM9+M0DMsKLBKeHaxlz39OV6hxYYMnJ1sAwcuIO/n3wFJ
         AA8pBb9IUFUiRps1zcjgdXTzdK+0Ii1xQ8cYLk/42gMhaS59XUG+oELlrSKlH/t7kjUD
         47aYYZ9b45pZ01WTBdLk2JFZjnljc1kSLPAeig4TrB3DhmGEtgt0dVI2Nbmem84qpVuo
         zW9oIR+fRLbqnjEGBOWyPIE3vMMwMCA7zrZ6XKaU+3B2pr62fWSvnmzEV5TuZgLnqHva
         R8bA==
X-Gm-Message-State: AAQBX9eEU+QPjnUZtByqUWZrHhoFW+QO5j9gtMBXJIijQcuReqYoOVJG
	feTRLyWu+fvgNpqfdLKx30NFkQ==
X-Google-Smtp-Source: AKy350axUyld+HptWNFgmq7JEqEvSwSiRuyM/yYdGSOt3UHn5lx/H7ibPIBuKDzGrCTLDESGCPzlMQ==
X-Received: by 2002:aa7:dd59:0:b0:506:77e6:c9e5 with SMTP id o25-20020aa7dd59000000b0050677e6c9e5mr6271718edw.8.1681555405433;
        Sat, 15 Apr 2023 03:43:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:24 -0700 (PDT)
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
Subject: [PATCH 08/15] w1: ds2482: do not use assignment in if condition
Date: Sat, 15 Apr 2023 12:42:57 +0200
Message-Id: <20230415104304.104134-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assignments in if condition are less readable and error-prone.  Fixes
also checkpatch warning:

  ERROR: do not use assignment in if condition

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/w1/masters/ds2482.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
index 7e915b71045d..f4ad644a7abf 100644
--- a/drivers/w1/masters/ds2482.c
+++ b/drivers/w1/masters/ds2482.c
@@ -451,7 +451,8 @@ static int ds2482_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_BYTE))
 		return -ENODEV;
 
-	if (!(data = kzalloc(sizeof(struct ds2482_data), GFP_KERNEL))) {
+	data = kzalloc(sizeof(struct ds2482_data), GFP_KERNEL);
+	if (!data) {
 		err = -ENOMEM;
 		goto exit;
 	}
-- 
2.34.1

