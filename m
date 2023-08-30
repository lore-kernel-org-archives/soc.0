Return-Path: <SRS0=dB9Q=EP=gmail.com=peteryin.openbmc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2149C83F01
	for <soc@archiver.kernel.org>; Wed, 30 Aug 2023 09:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0772C433C9; Wed, 30 Aug 2023 09:05:53 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8CABC433C7;
	Wed, 30 Aug 2023 09:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8CABC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6bdcbde9676so4226813a34.3;
        Wed, 30 Aug 2023 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693386352; x=1693991152; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJ+Y7CXqKbGK1IYq1UEYCIh7uYK50Z8X6EK6Ai4bZgE=;
        b=RvZUyVFWy98NUMfcGvaXPC+8lbVtvWssiQ/LhV/zO/Jub2vTWR+UeOw46rYwZB4qCx
         ctASroDVT2RBv299fhOw8vS0RBCBIBKKbLMxdQPFBJ1OvzmvcibcrX7Ckus2rxjbEjgU
         ureZZhaSUkgP0CwCLwrWaG6y8SSBeHhHg+vFO40ed9O4Q2/hfXye2Ar7qT8lV4sZzZfg
         H8kMJiDhX9XmL3uux5GGWeWQV9R3FAsuzGNSDbvG+IvIlUSBf+O2Dye7ERbbFf4l+CKE
         Q/Hf5jszYOBlYCHozA76t7H1cMPTm1LvNS/bat/rm9E970U1RpsdgeqOisCwFzDP8o0t
         T5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693386352; x=1693991152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJ+Y7CXqKbGK1IYq1UEYCIh7uYK50Z8X6EK6Ai4bZgE=;
        b=cCfpbdZJTWIoA216Wp+JukQw0mq3LXBaAEt9/UwwWIqjAHDVzwkTji2LHAY2wp9+pH
         YHriz7HmTxyqU7EThq94hkA6D3MTmIrhGXM0y6X7fOJk3ZPKrnqtseH4ZLVZMgiiw3qF
         J4dMd1pE82NbHFA1fA9I6HZsNjEmlT7wQBqjsYYTnQfWf8vW/8jwcgvlNmYwlhYSAjlf
         xGtXjUPYHr20K1ybvoe1P385ibM75eLwve/OhYWV80g9NA9BK8AzZ9/iYcN0yM2ABJIp
         ntpScqrzG4MrDqe9SDjJ6iAWOfW23a9E3234JJkAvc0y5TzDCb3Jp8VgaiO8Ghk3lHMG
         H1Og==
X-Gm-Message-State: AOJu0Yw3I6mKL+dwOQMnkcMAADaddrtpTukH1xIUJMN1koMRqJ6fW16q
	AywlJXEQVorytPuCSmPGmn8=
X-Google-Smtp-Source: AGHT+IHBi4wWX18II858/6D5KjNsEuV47hc5ZmyFbvALqMzO+3lIqlPuTfCfgYY/EmoJoJ1gBDaM8g==
X-Received: by 2002:a05:6358:9318:b0:135:57d0:d171 with SMTP id x24-20020a056358931800b0013557d0d171mr1313065rwa.15.1693386351915;
        Wed, 30 Aug 2023 02:05:51 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id x4-20020a656aa4000000b00553dcfc2179sm9263226pgu.52.2023.08.30.02.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:05:51 -0700 (PDT)
From: peteryin <peteryin.openbmc@gmail.com>
List-Id: <soc.lore.kernel.org>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: cosmo.chou@quantatw.com,
	potin.lai@quantatw.com,
	daniel-hsu@quantatw.com,
	peteryin <peteryin.openbmc@gmail.com>
Subject: [PATCH v4 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Date: Wed, 30 Aug 2023 17:02:11 +0800
Message-Id: <20230830090212.3880559-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830090212.3880559-1-peteryin.openbmc@gmail.com>
References: <20230830090212.3880559-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new compatibles used on Meta Minerva.

Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 6b0a6683ccae..b681bbf960d1 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -80,6 +80,7 @@ properties:
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
               - facebook,yosemite4-bmc
+              - facebook,minerva-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
               - ibm,tacoma-bmc
-- 
2.25.1

