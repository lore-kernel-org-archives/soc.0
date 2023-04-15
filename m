Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDA8C7619A
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4458EC433EF; Sat, 15 Apr 2023 10:43:32 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60272C4339E
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60272C4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5066ce4f725so2021915a12.1
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555409; x=1684147409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/p4NRTjs3BLjzJ+cn6r3EmwmpCVSEOW5kd0Ht7+9co=;
        b=YXcbgRwsSgr/cZJsxc8wHJKyT2TNmzYL0AS/8ZRCR5I23P+xV4iRCgOJJ/b+doiGoP
         1PMy18o+UMdWKonNljUZNVQ6z2oyM1sNBaWRa/bmOS3qGWngxZZ8QsD+SEh1LcjxOdPl
         goRDvRwsJ8qKJEA+smv6WiMmABWP43MzDflZ/29iv24fcUwlrhR1U++ZdwDJPlfQyQ0n
         v5taaDS/yUDTaNe56P+LON+qY7Q32ruraDVQniSE97D/mU9IaHmcwWmpCjObjjV8yE2Q
         y5Ooz5D0Rv6GXP0BDgj0s5uh3Fa9RLcj2JmUowCBxWc6qx3A4+26bonHxm1DbgQ61qvG
         LfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555409; x=1684147409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/p4NRTjs3BLjzJ+cn6r3EmwmpCVSEOW5kd0Ht7+9co=;
        b=dx7RZwuEGa7o8m+pXEI/7xUiGYClsj4haUnV4O5IdICeb+T1RVaYw+CIPbsJZ0IZcQ
         nok9LVx+QDlpxfZ0g7sBt1U99+fxkz5fZXN0nc1fF5lD5cfIepIQNDvzAEmV7OlJ5hTH
         INdPfOjVUDnzoZ9NKxbtKRMeKXoO91d4H7UV7EL4nGJMXv8uT8kourON6Ndkd+37F0Uw
         h7RWjRYE7ACUOjz5jAg6PwxgH6TnCIuZKF49KcBekJZ+AVnG7+mpTUKd6RP5qHH19XsE
         +V1J7SwRVKliypZEZ+a8965120s51jS7iJlz/Xu1kczKs+Ht3kV0TeQOpcD/6VlvKBx+
         ZQSg==
X-Gm-Message-State: AAQBX9f2A9G1KrH0APLkM25HDe0gHb4605agBBBpDdeQhLt+EclOPB12
	wnnVMO69+ZedkBCDPpdZSIzXKQ==
X-Google-Smtp-Source: AKy350b8nFIjeKtfcK+zDkqqPw0+7OElRQc6Y3ogylMJD+VwGYTUHrhFdnCujozs0PidPBblAjvWmA==
X-Received: by 2002:aa7:d509:0:b0:506:7d34:51d1 with SMTP id y9-20020aa7d509000000b005067d3451d1mr5623056edq.29.1681555409487;
        Sat, 15 Apr 2023 03:43:29 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:29 -0700 (PDT)
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
Subject: [PATCH 12/15] w1: omap-hdq: allow compile testing
Date: Sat, 15 Apr 2023 12:43:01 +0200
Message-Id: <20230415104304.104134-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omap-hdq does not depend on anything from ARCH_OMAP for building.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/w1/masters/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/w1/masters/Kconfig b/drivers/w1/masters/Kconfig
index 692cac3ff0ee..ad316573288a 100644
--- a/drivers/w1/masters/Kconfig
+++ b/drivers/w1/masters/Kconfig
@@ -53,7 +53,7 @@ config W1_MASTER_GPIO
 
 config HDQ_MASTER_OMAP
 	tristate "OMAP HDQ driver"
-	depends on ARCH_OMAP
+	depends on ARCH_OMAP || COMPILE_TEST
 	help
 	  Say Y here if you want support for the 1-wire or HDQ Interface
 	  on an OMAP processor.
-- 
2.34.1

