Return-Path: <SRS0=mcdX=EQ=gmail.com=peteryin.openbmc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5A4C83F2E
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 08:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32FB9C43215; Thu, 31 Aug 2023 08:30:43 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 338DDC433B7;
	Thu, 31 Aug 2023 08:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 338DDC433B7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68a3f1d8be2so453793b3a.3;
        Thu, 31 Aug 2023 01:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693470638; x=1694075438; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7qrHrxv+tQmHkxgkfHoWgymD/z9+utSjFBhVwcl5B4=;
        b=DyA+ZufWgsUFfO4clHRk8SBYT7GaoRCJcgj0lOHrpAoOy6nsHav4yVoL+KdDrIV9yW
         fQFAHfsfEvZZd34UDnFQenpvINIw2+r/czP3ZKH2xoWN6cYa+NRFzfbGjDAyb66iq36p
         vFHzsr+cV8q4D7aLicKe3DjfIRO81JS6QAtWG2XfNHpy/BP9GJtVwg+BxIl5XTLsj8XT
         WOTY1jz0yY24jvtQxwgJl4G7vAQoLJjJFZe9MQBfWVicDZeGROZgIcq5EO6VCqrwBtOx
         lyl0/8a0FB6BN83pjDnFGUm/CRxriupnpIsCHeiBAXmv12TYa7QkBcrLeCJzQH4PUH5Y
         GQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693470638; x=1694075438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7qrHrxv+tQmHkxgkfHoWgymD/z9+utSjFBhVwcl5B4=;
        b=cfHW0bW2m572zfkNMlwRNupAa4Oa1RUzmMb0QksnlbAokyQY5D/v5ZVa4ffqViXEmq
         BCIL1o8AE8z0OD1oDrSid3OPF/4vtd9yT9SFz6kk9BqiOOnKWOtROP0QvAm/fRyjt/T+
         wGdGeGheopfPQqzWFvTmEXUzVBe23FXRfeJJ5qKWHqpxJnM1LHllo3JDk4EMVGQqmbLZ
         D8jODqfWVEFPqnckzFc0YO6UYdrj1k2CSVX4ZPwr5srvHc5KdRvu137xvdd+HhvrzInb
         NO3TYW6zjV8tZlOnWcm6WpXxrFVfgt+tnvckKOmvGUeuERI7LT3q1H4D1WKUBvq9ipTI
         sc8w==
X-Gm-Message-State: AOJu0YwDZekGs+Z6TPo5hmYphQhuL+FalYsVh9PETtIb+4LzzDqldru7
	1sj3bDThlRcUNrklTcU1X+I=
X-Google-Smtp-Source: AGHT+IGJ0sJH/K/tzzupjuyRlTkxXV5KC1GX2bDuoSlnYE5+YMUZE9wWtazb3sOipXp4chWI3AmNYA==
X-Received: by 2002:a05:6a21:3d83:b0:14c:d5e9:211e with SMTP id bj3-20020a056a213d8300b0014cd5e9211emr4640510pzc.35.1693470637972;
        Thu, 31 Aug 2023 01:30:37 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a17-20020a62e211000000b0068a46cd4120sm812253pfi.199.2023.08.31.01.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 01:30:37 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
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
Cc: Peter Yin <peteryin.openbmc@gmail.com>
Subject: [PATCH v7 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Date: Thu, 31 Aug 2023 16:28:18 +0800
Message-Id: <20230831082819.4000425-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831082819.4000425-1-peteryin.openbmc@gmail.com>
References: <20230831082819.4000425-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new compatibles used on Meta Minerva.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 6b0a6683ccae..3b93bae4f43a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,minerva-bmc
               - facebook,yosemite4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
-- 
2.25.1

