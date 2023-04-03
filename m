Return-Path: <SRS0=Mhi8=72=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF9AC76196
	for <soc@archiver.kernel.org>; Mon,  3 Apr 2023 16:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22A5AC4339C; Mon,  3 Apr 2023 16:14:33 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02FE5C433D2
	for <soc@kernel.org>; Mon,  3 Apr 2023 16:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02FE5C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id y4so119539883edo.2
        for <soc@kernel.org>; Mon, 03 Apr 2023 09:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680538470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4L3DXDw+rPCXmzKTDiK+3ai07bE4enDVUdfQ3XZnOM=;
        b=JDRoUWbIVadBNxnsD8FFYLW7AuITxTUXwX3xdwX6RNSAYEyIQ+biBbpCkF16oaq9bQ
         416XY92YW9cDZp7Gk4OjNG+ilJvXUDf6cv0GJvKmnrvjPnYqmeHJ8FmoC+0Z/v/kqPil
         XmsuGa5brUm3IZl4+AX9zex8XYTNVM4+hgS8185zv6oCDVXN3T9P3lrertndNPsWpu54
         Le42lby9c0nCmgKXGoANFbRn9n0UZWNR2iclkD2c7GGUrd10NW3326TuyoWOXFABQNL1
         1AvtkCx9I2yLc5mzYwpuhzQEXiu0EpowEHDC8jQYKpyfcbzHLPCrLagU2wpj4GdbpsOz
         0hKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680538470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4L3DXDw+rPCXmzKTDiK+3ai07bE4enDVUdfQ3XZnOM=;
        b=44npMWERg6AF6J4kE4gUdHfNMjunRPCVHFmo0YAwoNhD7+OJnQrG0w/xqJr3Uhyptz
         V692GgpfuLlAPYu4xGJaS2+Y3JjdbG94xg/GOXivMoMFXwrTysuXgYD5sXWUsKTFW8Fs
         6oQkEpTFB32uuz+fY7KLCX7VycSEbtUAN//NKi1ypHSMvFppsZxVJu+smLyZnZrj92Mi
         8/Zh4zpjQaJzZBKr7IJKTQczWP2ZdpR5vE4R/Xy0TQX8SGuFqMkcePFvVr1sgFhmXbmM
         cOrmbTUkNUC7GKXupzoE9mfLWdsDNwtmKkoXhTQ/2B0GSn83MewAlaObY+78iq05L6Z5
         GGTQ==
X-Gm-Message-State: AAQBX9fzn/nYYHKHjseEIDUZmACX9uPcDVo1Fswyjmeafpmta/Y9eRRK
	iWsvFoCPEfDIEe09lkhCAxsUTA==
X-Google-Smtp-Source: AKy350Z3xCJXIC+Hli76zppu9pCredWqfD5VdWlKk07M12aYUrThxhmHTTPbZfExtPuGaP2tIhW6Zg==
X-Received: by 2002:a17:907:3e93:b0:947:793d:b5c4 with SMTP id hs19-20020a1709073e9300b00947793db5c4mr16523759ejc.64.1680538470292;
        Mon, 03 Apr 2023 09:14:30 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id f24-20020a170906825800b008bc8ad41646sm4725234ejx.157.2023.04.03.09.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 09:14:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.4
Date: Mon,  3 Apr 2023 18:14:27 +0200
Message-Id: <20230403161427.328128-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.4

for you to fetch changes up to 69d170c4c28ba0490bd42630cc09d7e1834bbb3d:

  dt-bindings: memory-controller: Drop unneeded quotes (2023-03-31 21:53:15 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.4

1. STM32 FMC2: allow using driver on all STM32MP SoCs.
2. Cleanups:
   - Atmel EBI: use preferred of_property_present() API.
   - Tegra210 MC: drop redundant variable initialization.
   - Drop redundant quotes in Devicetree bindings.
   - Remove MODULE_LICENSE in non-modules (several drivers).

----------------------------------------------------------------
Christophe Kerello (1):
      memory: stm32-fmc2-ebi: depends on ARCH_STM32 instead of MACH_STM32MP157

Diogo Ivo (1):
      memory: tegra: remove redundant variable initialization

Nick Alcock (2):
      memory: tegra: remove MODULE_LICENSE in non-modules
      memory: remove MODULE_LICENSE in non-modules

Rob Herring (2):
      memory: atmel-ebi: Use of_property_present() for testing DT property presence
      dt-bindings: memory-controller: Drop unneeded quotes

 .../devicetree/bindings/memory-controllers/renesas,dbsc.yaml        | 4 ++--
 .../devicetree/bindings/memory-controllers/renesas,rpc-if.yaml      | 2 +-
 .../bindings/memory-controllers/samsung,exynos5422-dmc.yaml         | 6 +++---
 drivers/memory/Kconfig                                              | 2 +-
 drivers/memory/atmel-ebi.c                                          | 2 +-
 drivers/memory/bt1-l2-ctl.c                                         | 1 -
 drivers/memory/da8xx-ddrctl.c                                       | 1 -
 drivers/memory/fsl_ifc.c                                            | 1 -
 drivers/memory/mvebu-devbus.c                                       | 1 -
 drivers/memory/tegra/mc.c                                           | 1 -
 drivers/memory/tegra/tegra186-emc.c                                 | 1 -
 drivers/memory/tegra/tegra210-emc-table.c                           | 2 --
 12 files changed, 8 insertions(+), 16 deletions(-)
