Return-Path: <SRS0=mcdX=EQ=gmail.com=peteryin.openbmc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB7AC83F10
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 05:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CA8FAC433C7; Thu, 31 Aug 2023 05:52:55 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD45BC433C8;
	Thu, 31 Aug 2023 05:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD45BC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68a3e271491so296488b3a.0;
        Wed, 30 Aug 2023 22:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693461174; x=1694065974; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3cZF7dX+T51M1ilFDTmCciuWPN/WaDzWfsb09z2eis=;
        b=fCqx6moteGfy7cUDZUdCJeNlDngi4zPTh+CxEsKkQltBOyjnl4p84yqoZJlmLQsysX
         lQv6gYSaV7SyS03jFUDieuAhA9Eo1bd+UBm/Od8fhUvndYeHEVs7+7j5G0Z+FSQ/xLdr
         iFq73oHysuajl+9Sfpq/MOoXsfjPrng2HIZ1qlkHWoohufAY7h3Y9P/djhqNmW1WLkEh
         FNWnps4sDZFXxyw9PWLnDxN41TMiqvShD/dqYUxIAAvSL9VaJriQo+MrB99GIZZhDXBx
         VRWZPKKlwWvxuc5+TYTRIje6RDoMaOZdj7Fovi+fh5RUsfNuWkrDjqWuZQ7gPiXIXPCK
         Km1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693461174; x=1694065974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3cZF7dX+T51M1ilFDTmCciuWPN/WaDzWfsb09z2eis=;
        b=aMnS3y0ZPQeIf4flU6mbJ2Y6GpvmBtky4Bs4q/GsCTsncifex0Z8IyN4TUkW18gOXQ
         042DWcLBFoBho1dQ8tVzECQoHfpNcqoD3cgUwSG5CGyVzsD80qoH+/y4hzJGicQje/du
         ssHNhEtfaE/mq2QMh9+YX/0rNIzTBs/E8AzzPyynZbb4X6i7W0UUJFe4U6IOyRK5IWG+
         OLTTgBV50QGWoaqMPtvu9BVdfx2oSM3emazwZiykJ45zajY8oGt8JLtybFHBskxZZvhE
         VtwpDo5bcit0m1pQ2BusTriP25eHO+6KGrgWf3t9E1qO14ENfBUy1HRfef2S+sOI+nv5
         LhVg==
X-Gm-Message-State: AOJu0Yw7xKkfg15IMVh8QvI3Cm/94+hNXAAX5t72d1nuiF5/JcvZzfYT
	0w9qJgbhAvE0PL3wTtn0Ffs=
X-Google-Smtp-Source: AGHT+IEdJynyF1sPM1LXLbG7Nu+SIfBmaDaQ/AiHeUYK7hqPLOD64a5I0ezeV+XxRtQWw59aoXR+mA==
X-Received: by 2002:a05:6a00:850:b0:68b:fb93:5b4e with SMTP id q16-20020a056a00085000b0068bfb935b4emr4938014pfk.26.1693461174104;
        Wed, 30 Aug 2023 22:52:54 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id e22-20020aa78256000000b0068c97a4eb0fsm506731pfn.210.2023.08.30.22.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 22:52:53 -0700 (PDT)
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
Cc: cosmo.chou@quantatw.com,
	potin.lai@quantatw.com,
	daniel-hsu@quantatw.com,
	Peter Yin <peteryin.openbmc@gmail.com>
Subject: [PATCH v5 0/2] *** Add Facebook Minerva (AST2600) BMC ***
Date: Thu, 31 Aug 2023 13:50:27 +0800
Message-Id: <20230831055030.3958798-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 link : https://lore.kernel.org/all/fb09f5e6-8381-312f-2f1e-f2b471cec68a@linaro.org/
v2 link : https://lore.kernel.org/lkml/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/
v3 link : https://lore.kernel.org/lkml/20230830025133.3756506-1-peteryin.openbmc@gmail.com/
v4 link : https://lore.kernel.org/all/1d531692-5455-fbfd-0775-50856bf0fbc7@linaro.org/

Change log:
v5: 1.remove redundant blank line.
    2.Correcting the arrangement order in document.

v4:
    1.seprate dts document.

v3:
    1.Fixed commit description.
    2.Add sgpio line name to sgpioP.
    3.Add ipmb debug card bus.

v2:
    1.Add facebook,minerva-bmc in aspeed.yaml
    2.Use stdout-path
    3.Add Makefile

v1:
    1. Create minerva dts file.


*** BLURB HERE ***

Peter Yin (2):
  ARM: dts: aspeed: Minerva: Add Facebook Minerva (AST2600) BMC
  dt-bindings: arm: aspeed: add Meta Minerva board

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 377 ++++++++++++++++++
 3 files changed, 379 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts

-- 
2.25.1

