Return-Path: <SRS0=vNIe=RF=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C45C43219
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 11:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0FF3AC36AEF; Mon, 20 Dec 2021 11:54:25 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2503C36AE8
	for <soc@kernel.org>; Mon, 20 Dec 2021 11:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2503C36AE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5DAA34000D
	for <soc@kernel.org>; Mon, 20 Dec 2021 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1640001257;
	bh=BiSej51yYULgIZHsG9pL05ele3C+77gD9wdHvVEAU9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=b3/5sxf4tRZf59VfiSozYYiIn7t1HTJnzxA+hJj7gu7ZaU2F1yL9RGz7VKpt3EsTa
	 6CUujci9Jsh5KK9T1qxbgQbZjvxajR3TeSBdghq8jM3OJjaKZoEtd0jOeVqPzcGHKO
	 UyXoPCN1/HMXpkBYC3JsG1lfymwwukjVjZW93RYdbQSoqvtxvXEUM6WJuTMrfEi62c
	 BZV58H3b31wbidrgyiRrjL4ZXmlCpVFDc4YmCM83vwrG57iGhSQTopIcoYRWz87+DF
	 p1RELmvvomVaEdNoBdCnnMgQXOyzkDfuKbXyaHkCk+TMoEsieRz7WDpAXnGn02AsKc
	 q4dqKC7bvJaOg==
Received: by mail-lf1-f69.google.com with SMTP id p19-20020a19f113000000b00425930cf042so2693722lfh.22
        for <soc@kernel.org>; Mon, 20 Dec 2021 03:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BiSej51yYULgIZHsG9pL05ele3C+77gD9wdHvVEAU9U=;
        b=0ZIUztfOpjoz1Ihj96vdQ6A7PmqfrLHvr5k/XZvKkkja8895lGvsTRyBYdFRswAeku
         jgs6BmqR42scfPQjFGvLknsV+fBOSwm1rtMjPQmeWsOgWWxW7BBcMxifpXOke1s67CJa
         OCgGZrRQuoosM4B2QH47FHNwdfKhqevbC0DuOlnIJ11ReWLZpT66uotnr730P1BJSCmL
         BWfDfuE8gbXQ6O6z66Qyz4phrvsvd/JY7mV4zi2QC/zwtxanXoQ4wTnUcCPT0+oBfhPI
         tb34jc7MlhmK/HhDaC1F5noeSHkkhuEFfCTO3PY2hw5bIuMYJkug/gRDJhF1JveqlyMG
         CqmA==
X-Gm-Message-State: AOAM533H5/8EYoYehnLieZXqMGszc9S2fhv7nWbyaH49eoj5a1zY9wxO
	GT124FS0jwLrPqHi3O4u3g5TDZjFeAIuacEVOZMgGp2UNEiu+rePVIftHvT6lz5m0o2Bff5tf0r
	vhbSkEW/KoMDPRmsoPF5yru8=
X-Received: by 2002:a05:6512:31cf:: with SMTP id j15mr15393096lfe.229.1640001255736;
        Mon, 20 Dec 2021 03:54:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxukitS1KSF7GI4iskxIcOk21fHlAlOcFHWfirC/4iGi+9Oan2Iv/EB+PwDHT6+xTsQiGI0g==
X-Received: by 2002:a05:6512:31cf:: with SMTP id j15mr15393073lfe.229.1640001255510;
        Mon, 20 Dec 2021 03:54:15 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a4sm2339486lfo.96.2021.12.20.03.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 03:54:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	Chanho Park <chanho61.park@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/6] samsung: soc: drivers: for v5.17
Date: Mon, 20 Dec 2021 12:54:00 +0100
Message-Id: <20211220115405.30434-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211220115405.30434-1-krzysztof.kozlowski@canonical.com>
References: <20211220115405.30434-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

See below in the tag explanation for ABI impact by this change and future
serial driver changes. ABI break is not yet broken, although changes are not
bisectable between DTS and driver.

Best regards,
Krzysztof


The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.17

for you to fetch changes up to 96c8bddb6cdefb029cc7e411a5ee2183477368ea:

  dt-bindings: soc: samsung: keep SoC driver bindings together (2021-12-18 11:55:59 +0100)

----------------------------------------------------------------
Samsung SoC drivers changes for v5.17

1. Exynos ChipID: add Exynos7885 support.
2. Exynos PMU: add Exynos850 support.
3. Minor bindings cleanup.
4. Add Exynos USIv2 (Universal Serial Interface) driver. The USI block is
   a shared IP block between I2C, UART/serial and SPI. Basically one has
   to choose which feature the USI block will support and later the
   regular I2C/serial/SPI driver will bind and work.
   This merges also one commit with dt-binding headers from my dts64
   pull request.

   Together with a future serial driver change, this will break the ABI.

   Affected: Serial on ExynosAutov9 SADK and out-of-tree ExynosAutov9 boards

   Why: To properly and efficiently support the USI with new hierarchy
   of USI-{serial,SPI,I2C} devicetree nodes.

   Rationale:
   Recently added serial and USI support was short-sighted and did not
   allow to smooth support of other features (SPI and I2C). Adding
   support for USI-SPI and USI-I2C would effect in code duplication.
   Adding support for different USI versions (currently supported is
   USIv2 but support for v1 is planned) would cause even more code
   duplication and create a solution difficult to maintain.
   Since USI-serial and ExynosAutov9 have been added recently, are
   considered fresh development features and there are no supported
   products using them, the code/solution is being refactored in
   non-backwards compatible way.  The compatibility is not broken yet.
   It will be when serial driver changes are accepted.
   The ABI break was discussed with only known users of ExynosAutov9 and
   received their permission.

----------------------------------------------------------------
David Virag (1):
      soc: samsung: exynos-chipid: add Exynos7885 SoC support

Krzysztof Kozlowski (3):
      soc: samsung: exynos-chipid: describe which SoCs go with compatibles
      Merge tag 'samsung-dt64-exynos-usi-5.17' into next/drivers
      dt-bindings: soc: samsung: keep SoC driver bindings together

Sam Protsenko (4):
      dt-bindings: samsung: pmu: Document Exynos850
      soc: samsung: exynos-pmu: Add Exynos850 support
      dt-bindings: soc: samsung: Add Exynos USI bindings
      soc: samsung: Add USI driver

 .../{arm => soc}/samsung/exynos-chipid.yaml        |   2 +-
 .../pmu.yaml => soc/samsung/exynos-pmu.yaml}       |   4 +-
 .../bindings/soc/samsung/exynos-usi.yaml           | 159 ++++++++++++
 MAINTAINERS                                        |   1 +
 drivers/soc/samsung/Kconfig                        |  14 +
 drivers/soc/samsung/Makefile                       |   2 +
 drivers/soc/samsung/exynos-chipid.c                |   3 +
 drivers/soc/samsung/exynos-pmu.c                   |   2 +
 drivers/soc/samsung/exynos-usi.c                   | 285 +++++++++++++++++++++
 include/dt-bindings/soc/samsung,exynos-usi.h       |  17 ++
 10 files changed, 487 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/{arm => soc}/samsung/exynos-chipid.yaml (93%)
 rename Documentation/devicetree/bindings/{arm/samsung/pmu.yaml => soc/samsung/exynos-pmu.yaml} (95%)
 create mode 100644 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
 create mode 100644 drivers/soc/samsung/exynos-usi.c
 create mode 100644 include/dt-bindings/soc/samsung,exynos-usi.h
