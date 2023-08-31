Return-Path: <SRS0=mcdX=EQ=gmail.com=peteryin.openbmc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12942C83F2B
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 07:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2B31C433C9; Thu, 31 Aug 2023 07:22:56 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC36CC433C7;
	Thu, 31 Aug 2023 07:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DC36CC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bdc19b782aso3299365ad.0;
        Thu, 31 Aug 2023 00:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693466574; x=1694071374; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w+Lofyhd33uMBJ+ToOK+tKMDmw25lr78BBj5RQAypyI=;
        b=R5duDJ4dpYbwhgRHr8Fo6rTjtTlt22I+kDwuXFf6vklXxylFyku6Opo/Skqmm9TZdD
         +RLbWrS+qHDEgbO4/OqkMBC8C2dfPYq6NYxL8JbqO/2TSt9q6z77/WRLdGBLOWHnxJLF
         maL8k5uR5yTlccAdbvB/siW6eqaRxxBH4Zk0XFSkCzxrbcm0FWxxCXZWqQSxhi/7gIEE
         MT7TSqZdNKIO46b4iN4eW9TIRWZ99t///N380nzD+5GnKF3+4FqkkSwWUfkfp/fonRPr
         cwuTGHCFpUO4cWTxI19FOVJ8ewJnGG3TN7p6Uu7bFoM1s7QNOwSdhb1esjY8Bk7RHdQh
         FBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693466574; x=1694071374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+Lofyhd33uMBJ+ToOK+tKMDmw25lr78BBj5RQAypyI=;
        b=aD/xG83fsubgpVQ8Afbyy4z6+RDC1neDegKVJWadXxwemImo4e0t6jjbv2nM9SRqCr
         1Ky7xOUX7bIcn1XetafsdEovw3k3GnLVvKEedzB/qI3V0kSRbWkj5PI3glBDbqouVmXa
         INKErIt34qJjcjxecjNsihNthUFnQNOxXEIf2PnmD/6MCIqBilHrg2r50UwWDxFiT7Xd
         fcbR4/qJ+jWvhCyNd+ysiTTcehvmIsKb6LpLmSTt/F3NDcIvI7NV0iY2PByH3WgV25Tu
         ryljJImHmcRApUN5/pU81PSv0jjaDb9ygXLaDJOG12lZ7lXSe7DkWX8dewEHLTjhQO1p
         3SEA==
X-Gm-Message-State: AOJu0YywZLr35DkHIfWgY71mlhoDk1WNAQVUq5BYbr8Wgm61FWTPN0Y2
	blVLZzWXgSEdnvJlTgRTIGE=
X-Google-Smtp-Source: AGHT+IEHk+t1Wy+PMcS1vCgFZpM2AFndRd8x1kKereWVkYMryh93skTwtd4kPQtLBaNqkpEiRwmAvA==
X-Received: by 2002:a17:902:ea11:b0:1bd:f69e:6630 with SMTP id s17-20020a170902ea1100b001bdf69e6630mr5152249plg.65.1693466574056;
        Thu, 31 Aug 2023 00:22:54 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id z11-20020a170903018b00b001bf8779e051sm628794plg.289.2023.08.31.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 00:22:53 -0700 (PDT)
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
Subject: 
Date: Thu, 31 Aug 2023 15:20:45 +0800
Message-Id: <20230831072048.3966398-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subject: [PATCH v6 0/2] *** Add Facebook Minerva (AST2600) BMC ***

v1 link : https://lore.kernel.org/all/fb09f5e6-8381-312f-2f1e-f2b471cec68a@linaro.org/
v2 link : https://lore.kernel.org/lkml/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/
v3 link : https://lore.kernel.org/lkml/20230830025133.3756506-1-peteryin.openbmc@gmail.com/
v4 link : https://lore.kernel.org/all/1d531692-5455-fbfd-0775-50856bf0fbc7@linaro.org/
v5 link : https://lore.kernel.org/all/5347163b-c225-d805-d851-fe28e6b57c56@gmail.com/

Change log:
v6: 1.Correcting the arrangement order in Makefile.

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

