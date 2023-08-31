Return-Path: <SRS0=mcdX=EQ=gmail.com=peteryin.openbmc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4378DC83F29
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 07:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24410C433C9; Thu, 31 Aug 2023 07:23:05 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42A48C433C8;
	Thu, 31 Aug 2023 07:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42A48C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-26f9521de4cso373532a91.0;
        Thu, 31 Aug 2023 00:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693466583; x=1694071383; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7qrHrxv+tQmHkxgkfHoWgymD/z9+utSjFBhVwcl5B4=;
        b=f4pF1RdnCLCOsaAuV98X3cd0GuhZo38QGzXN+cYr7xaDoYNV3oYYPKRsRHzkAYp1Dm
         05RI5ivnA6O7Ja8hPYK0LHAORjU0XjekslfEbUv6TGDib3OBKRi4Yk3n4hxbaOWojAJ5
         H9ZuQz4SOPSqLJexEC5rCVMBaS8XBVZa9orcLd65liYh0bajMpS+R4iATP3aMJiTx8gN
         rMpmrnVjV9v9kqd6a7RGZHT1359ZrCU//UJF/tgRKmTmW8ToTMkGWHRgWPgXwCQMoc1c
         3JekAXR4i3Zvlsu2xhxAOrq73QbW+RHaoSglFCRFr0YLWVpR+7iIzDR6kgNmsK/W4qlG
         alyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693466583; x=1694071383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7qrHrxv+tQmHkxgkfHoWgymD/z9+utSjFBhVwcl5B4=;
        b=UeQTvOx+9m0jOE7EApR9SNqFp2gh+wROxloiA6UNY28eIU0Ft3+ndfqEj6xjgkFAXP
         z4/bXLMyJ3iHEDbknQ5wI2lIku/cHFm9FTBhcTOoDeVV4h2Y+D37IfgaxzZUijr2lPWI
         +woiLqxaSae5If5JRnURm+yp8BWjHG+8TH4Y/PRW2HzJ+kXHGDZOC+fVutT+jCDZS+SD
         C+NuPIwFMuIkHliiIjpsY0TqVQZLWgJVuszdhCJKWHvxjlsXsgnpJSUOmI8bTSbCTFFF
         hfAZeGvIFi4tlHWt4U011Sk6H1uvFjME7U979WpKozz1nzq8FfUO5UKfLZNyEQSkHnJG
         XVqw==
X-Gm-Message-State: AOJu0YxuaxiDnSPtwRKpQ8Jd1npvPlm9ypM2JjB2JiXqRnflgVivwbTA
	RcbnEZCh2YrWmK58LLuYmyc=
X-Google-Smtp-Source: AGHT+IG8RaRmunMe/+M8syUr0us8nmdh+ZK2SxJG9HILQx5j1VfNjThFTYg9e6Gzivnci5tefbRqCg==
X-Received: by 2002:a17:90a:a897:b0:26d:43f9:11dd with SMTP id h23-20020a17090aa89700b0026d43f911ddmr4134463pjq.0.1693466583475;
        Thu, 31 Aug 2023 00:23:03 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id z11-20020a170903018b00b001bf8779e051sm628794plg.289.2023.08.31.00.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 00:23:03 -0700 (PDT)
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
Subject: [PATCH v6 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Date: Thu, 31 Aug 2023 15:20:47 +0800
Message-Id: <20230831072048.3966398-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831072048.3966398-1-peteryin.openbmc@gmail.com>
References: <20230831072048.3966398-1-peteryin.openbmc@gmail.com>
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

