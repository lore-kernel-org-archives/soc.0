Return-Path: <SRS0=IwMG=D3=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC1FC04E69
	for <soc@archiver.kernel.org>; Thu, 10 Aug 2023 12:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F415C433BC; Thu, 10 Aug 2023 12:31:22 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6DAE7C433B9
	for <soc@kernel.org>; Thu, 10 Aug 2023 12:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6DAE7C433B9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-53fa455cd94so565932a12.2
        for <soc@kernel.org>; Thu, 10 Aug 2023 05:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691670676; x=1692275476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mEDAkvVdyaZhGjK4E/4I+vUys1gI9OsOdzSf1H2Xtbg=;
        b=RpUKBXJ7G/PmswXpbMf0ENc0b+ID+EOb80WkH6GjJJaBYSPWsJ4EyUWYOEBuKFlgGt
         FOe60e5VuvTAhfmmeoT1J/v5uQ2Ytw3d+gnvq8zxVuPN3ieYz4PW4jI2R5n4DBltdz7g
         e969/WQKnG1+Wl8vyfF7KkFkmdsM51ymLWvIzwG6x5xOkCz3DpmscQwwtGN1zpzRRt04
         PqKvWSojnVugdYZKHINlBbUIqiB9bH0aC+y5jBqyNj+iiGUI4NWviqv3WMKcnzYFaERg
         Ze/Y+DlBW5eAZriutnF+DEvRIyMD6pKtC56Qdu3ZhvIOAXH53GNMA2UWTWwrnMGC76Ma
         YC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691670676; x=1692275476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEDAkvVdyaZhGjK4E/4I+vUys1gI9OsOdzSf1H2Xtbg=;
        b=TdDgLTzhtlO4xUJrKOcLHlNMMTTCMMasEtG9cS++RbBOPduTb5T/7U+ZUsj7wVF8cO
         WfLFMQHbgok2JK/IuPgoBOB6E8kxzt8o5LzbhGqkCTiVsslYulQqVnUOB77HIrw/7Yyh
         LmSmvfsBVqhQ9HZtvTlXLWdXNh5coqSGGFT14CkunvLebb7VLy8DUj1FeZMe8jx9teb2
         agcCBE+nSQwBI1ibEb3E6dBhyU1C107IcCRppooL3S/ryGUug3SZtv0ZW9KEtnvdJMag
         5hTTfJoDeL69J50ekU7tkP5jANMVqSKJoHwei2vpJBvOAjDHsI6sWaW2ur8Dbobv+fbD
         uZLA==
X-Gm-Message-State: AOJu0YwMlRF5PHti2f2N70d5bduF+7rSEgiaJKDsm+P1WPdK2BCul6wV
	AleFmkSaGy3coUV2U0zt4nkO9dyOraE=
X-Google-Smtp-Source: AGHT+IFaDZQcxo2Qp+lFmysBRWlG02gOyk+syGXVpkrV3WFa9mD3mfr28uZ0JCa7bwIS9GAAR/xI7Q==
X-Received: by 2002:a17:90a:ab91:b0:268:b66b:d9f6 with SMTP id n17-20020a17090aab9100b00268b66bd9f6mr1571699pjq.18.1691670676091;
        Thu, 10 Aug 2023 05:31:16 -0700 (PDT)
Received: from voyager.ibm.com (region97.lnk.telstra.net. [110.143.27.102])
        by smtp.gmail.com with ESMTPSA id o18-20020a170902d4d200b001ac591b0500sm1616542plg.134.2023.08.10.05.31.14
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 05:31:15 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] soc: aspeed: socinfo: Add kfree for kstrdup
Date: Thu, 10 Aug 2023 22:01:04 +0930
Message-Id: <20230810123104.231167-1-joel@jms.id.au>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Add kfree() in the later error handling in order to avoid memory leak.

Fixes: e0218dca5787 ("soc: aspeed: Add soc info driver")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Link: https://lore.kernel.org/r/20230707021625.7727-1-jiasheng@iscas.ac.cn
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Hi soc maintainers, this is a low priority fix to be merged when appropriate.

 drivers/soc/aspeed/aspeed-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
index 1ca140356a08..3f759121dc00 100644
--- a/drivers/soc/aspeed/aspeed-socinfo.c
+++ b/drivers/soc/aspeed/aspeed-socinfo.c
@@ -137,6 +137,7 @@ static int __init aspeed_socinfo_init(void)
 
 	soc_dev = soc_device_register(attrs);
 	if (IS_ERR(soc_dev)) {
+		kfree(attrs->machine);
 		kfree(attrs->soc_id);
 		kfree(attrs->serial_number);
 		kfree(attrs);
-- 
2.40.1

