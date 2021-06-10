Return-Path: <SRS0=piyp=LE=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F97C48BDF
	for <soc@archiver.kernel.org>; Thu, 10 Jun 2021 23:28:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 39E5561403; Thu, 10 Jun 2021 23:28:16 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CC1B613CB;
	Thu, 10 Jun 2021 23:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CC1B613CB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mnhagan88@gmail.com
Received: by mail-wr1-f48.google.com with SMTP id i94so4046701wri.4;
        Thu, 10 Jun 2021 16:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NkHOILVMygEEoZYONCaDsk6m76wqea7EMgUYfwAkp6E=;
        b=AyrM6aYYpCk/W3IH4jtqrK0gdAw7TpdyWoH75b18wAoaCzycuAPB/OMesODG2n27Ak
         CJhmqFVk5R6G7f3zjKNhxwJvEeqTKVRhaNjSv2oHwSwzcLmMANt4ydOCjHqWDhPgCjQs
         qwYoIk+YNbxnj+/Ww8DLfV+gwj7y0KZD5oFvuo36CxEu8kwPKfdsCuvI4UU4vFk+OeoR
         Ij93lWV/1GQ94JZ+/TbrCxe2vQrhrZ4sfAvO/IvSqSpICf1n1iK3f7VoVeZPHCsgGSRO
         jFx74kMtQU5BaLC7+huYoNyI6c9N1alScZmUAyg0a9oYC50y+820qMlRIIPt6AuIa4YQ
         0nfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NkHOILVMygEEoZYONCaDsk6m76wqea7EMgUYfwAkp6E=;
        b=CGnZOB1yZR+CGlRvs65RATKyYnacdH/7nszm3lsJZYoTepvAeb4tmyflVZ+SJQF/Qf
         TBVLIjbU3bYzqcWFpHPUwIN2aXtj7Lwu7D7Xtrvs7H5igCMZHn8Ehu3obbvH2I6B2UZk
         QTWvFHGL2ewCsnS0D0mtD3qcRkqAstNzVqHR2RuHF2dE0PL6/L1RF8YT277i5GlARcNJ
         X+Tty2Y3OG/qFLH/cK3GN+pIB39+eCxySqMuKsJ24vDEcTq4yP8zNv9gYOB2C1xGTCzH
         bGZxFWc4XyRF8GSCDcfFWR/uNZIA/f+mSatC5FfyXlCeAbChblfjAfBY0el/NYnLrmpa
         x1sA==
X-Gm-Message-State: AOAM5331v+BSGkMotayOFfrWgangwa7mRokvl13WOXL1RC31pOIBhPLg
	+hZaMokxl+1fbm8pYvM30Z0=
X-Google-Smtp-Source: ABdhPJypWTWUMZFBvZneUf16gGGhOmY/Vj3MErZvt8ucDJz8tXaOY9ccvLRmQnYzWdMk9kcOr9TuVA==
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr754337wrn.127.1623367694702;
        Thu, 10 Jun 2021 16:28:14 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id w13sm5478549wrc.31.2021.06.10.16.28.13
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 10 Jun 2021 16:28:14 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Matthew Hagan <mnhagan88@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/5] ARM: dts: NSP: add Meraki MX64/MX65
Date: Fri, 11 Jun 2021 00:27:12 +0100
Message-Id: <20210610232727.1383117-1-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes from v1:
- add dtb entries to Makefile
- add bindings entries to brcm,nsp.yaml
- change naming to include Meraki name
- remove unnecessary portions, including pinctrl from meraki-mx6x-common
- add A0 variant for MX64

Matthew Hagan (5):
  dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
  ARM: dts: NSP: Add Meraki MX64/MX65 to Makefile
  ARM: dts: NSP: Add common bindings for MX64/MX65
  ARM: dts: NSP: Add DT files for Meraki MX64 series
  ARM: dts: NSP: Add DT files for Meraki MX65 series

 .../devicetree/bindings/arm/bcm/brcm,nsp.yaml |   6 +
 arch/arm/boot/dts/Makefile                    |   6 +
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi | 298 ++++++++++++++++++
 .../boot/dts/bcm958625-meraki-kingpin.dtsi    | 131 ++++++++
 .../arm/boot/dts/bcm958625-meraki-mx64-a0.dts |  45 +++
 arch/arm/boot/dts/bcm958625-meraki-mx64.dts   |  15 +
 .../boot/dts/bcm958625-meraki-mx64w-a0.dts    |  55 ++++
 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts  |  23 ++
 arch/arm/boot/dts/bcm958625-meraki-mx65.dts   |  15 +
 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts  |  23 ++
 .../dts/bcm958625-meraki-mx6x-common.dtsi     | 148 +++++++++
 11 files changed, 765 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi

-- 
2.26.3

