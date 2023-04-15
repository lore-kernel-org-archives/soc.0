Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED355C7619A
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0C07C433D2; Sat, 15 Apr 2023 10:43:23 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0127BC433EF
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0127BC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50506111a6eso3091651a12.1
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555401; x=1684147401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/p4NRTjs3BLjzJ+cn6r3EmwmpCVSEOW5kd0Ht7+9co=;
        b=TS0mVAwVSMB3TZMk93moob2qJ+9hbVdN2NNKYdROxrSv8Z2oA+4aGmxXKYDuzVcEm3
         9WAO3TLgfk3G9ML7RIXjY0+uQuOmbaL6k8vqqwULuHlX4X2D/JxVN7h09cN4x7F2pn0t
         rpPYUBFDVlWZN7Caw5m+gaDUA9OmWj7wWdOGkRClJNU/AssvaD6n7MjIAQ8qkTQ5mZbU
         /SnSYhRWfTfkZGxD448UcXPUHEWCtgGCvKWl7FytOSgOWlkxLBnyhhZ4EzKf9SK/f1Ds
         eRUlsFjGuXFUyLEKgfNLUmosguoAt5m5GlPTyye+qpAhUv8pWtxlwd2Q4Arp7Rz6dAk4
         dIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555401; x=1684147401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/p4NRTjs3BLjzJ+cn6r3EmwmpCVSEOW5kd0Ht7+9co=;
        b=OV2kxcAVLiBO3jAPb0hqO/OYTvQ06/VzqbrrHUBv1H04DAs9MTTyt2CShIc5SC6yCe
         mCBcva4+9O3rqDtLmoeiPzrsBmIkNOaPagb6AQ+6bzQZx1Wes1WXqrgtlPhe06imcn/e
         f88By7TybWtI4bMz6E6smxp/aIzEt8cA4h3MdhYlnScnxspgrwT14v2XRZDNs21S5+y1
         suFhKLzEeaFZJNo8c9fPDk0YjyU1EQwOWBOb3RLLHj5rQjIwoSxJ5FQpEHuto3RlgViL
         Ad3VrZV72fkrdJrA/4aDW7L+mS00Ozmk53okOpwQ+G1A7Zy4yis5KUYSzW7WXEPmIxGX
         TFfg==
X-Gm-Message-State: AAQBX9eJBptMtFv2koY0wWqYw0K2Bu0lnGvvIqkLoYQAK8jT0RwxsA32
	dTExVINUapcvXSn7s2BphJ+R8w==
X-Google-Smtp-Source: AKy350Y/jEVtp7V14c4ipCG9viPadpCpFPQ5g4EBv4b8edo0N6mm6U8UNf34WSAn2Z2nfW+5TbCmYg==
X-Received: by 2002:a05:6402:1257:b0:506:8e91:3b35 with SMTP id l23-20020a056402125700b005068e913b35mr1944679edw.13.1681555401131;
        Sat, 15 Apr 2023 03:43:21 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:20 -0700 (PDT)
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
Subject: [PATCH 4/4] w1: omap-hdq: allow compile testing
Date: Sat, 15 Apr 2023 12:42:53 +0200
Message-Id: <20230415104304.104134-5-krzysztof.kozlowski@linaro.org>
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

