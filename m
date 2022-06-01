Return-Path: <SRS0=DTuh=WI=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2E4CCA473
	for <soc@archiver.kernel.org>; Wed,  1 Jun 2022 15:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08B4BC385B8; Wed,  1 Jun 2022 15:47:44 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3A3DC3411C
	for <soc@kernel.org>; Wed,  1 Jun 2022 15:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3A3DC3411C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f50.google.com with SMTP id u26so2728566lfd.8
        for <soc@kernel.org>; Wed, 01 Jun 2022 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=03l9qZ1zqgnkEYg4B8WIYYOsQsvsRpptjIAToBGQAPQ=;
        b=wC6HwTBZ/wjGhipRi4sC8Rx0F2OeLaKSyfu5JhVWkSoxtP5PLKMC6wGUBmJ6UbYq+s
         TPVUu/lI+pwzd98F/UnK+VCSkflWpcpOH1pDuleF+QfaF9g9akVsWJbaE0dDjELoJGJ+
         FGfBYXZ9wWpuDSSFDMkgbjk7x17HGX12o2rGcUnWubDTgxM1CqQsUGb17nTN/1VSbsHo
         LMLG58sKSraMt2SupApLdwcmt6l8BzvZg/hNSujDgEHYxu6PZnP8wEzwZTBVAUjWxHjg
         jiFp5CryFIRmThjeFwU0id00YgcCZoDhGUztaSzHEt4GgUSM98zA/Ui0/elCsdm+Dc24
         EEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=03l9qZ1zqgnkEYg4B8WIYYOsQsvsRpptjIAToBGQAPQ=;
        b=cYuG6gEdFg+3OKy3XynZEHrRhRKHhx6kHPqRjNryOOKRwR4HM3GhA2aMfSbz9wfXy+
         6DKmlyIk+bMmXdWdJpLjyTTK8cPvl6+ijRrhYXrr0GQnGr0toTsNi9CGLpy2wvzy4FT0
         v9g/YDOYzaXzMW6FJ9191PRzp8iCJhF543T6SrBbFnFYzUDEsV9k2ONYJJ0RXrJbIDcn
         LSu7JLvmPDgUPJUoaEqxsPvzQwKKxS45sOCduaQTZERJiAGn+qZeJW+fooz2Xe2bzLN2
         sW6JD0Ws0i3UshsjuYGjF0LCdFj/urbUAJobHNyzlKyMXj528xnmclsZI7xMSx/SyjmC
         25pg==
X-Gm-Message-State: AOAM533QThbTTRbsGkDBKIjp91i4qF/rEp7m6xv7tKtAize+F7dJjzCC
	ElkyZriR1EevSdis3w4wMaeO5NU3GOKLqw==
X-Google-Smtp-Source: ABdhPJz3bxHBbvrhIIoXVv4logFZR7XRhjx9E7U8qShR3z07zVy59hKdo8FgbWIWVW59oJq7qYP2uA==
X-Received: by 2002:a05:6512:2347:b0:478:5a69:6dc4 with SMTP id p7-20020a056512234700b004785a696dc4mr59859lfu.478.1654098460722;
        Wed, 01 Jun 2022 08:47:40 -0700 (PDT)
Received: from panikiel.wifi.semihalf.net ([83.142.187.86])
        by smtp.gmail.com with ESMTPSA id f10-20020a19380a000000b00478ad871b25sm431219lfa.145.2022.06.01.08.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 08:47:40 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: arnd@arndb.de,
	olof@lixom.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	dinguyen@kernel.org,
	amstan@chromium.org,
	upstream@semihalf.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v2 0/5] Add Chameleon v3 devicetree
Date: Wed,  1 Jun 2022 17:46:42 +0200
Message-Id: <20220601154647.80071-1-pan@semihalf.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Google Chameleon v3 is a board made for testing both video and audio
interfaces of external devices. It acts as a base board for the
Mercury+ AA1 module.

socfpga_arria10_mercury_aa1.dtsi and socfpga_arria10_chameleonv3.dts
have also been sent to u-boot:
https://lists.denx.de/pipermail/u-boot/2022-May/485107.html
https://lists.denx.de/pipermail/u-boot/2022-May/485111.html

v2 changes:
 - split first patch into three
 - move sdmmc-ecc node to socfpga_arria10.dtsi (instead of removing it entirely)
 - use generic names for dts node names
 - keep the enclustra,mercury-aa1 compatible

Paweł Anikiel (5):
  ARM: dts: socfpga: Change Mercury+ AA1 dts to dtsi
  ARM: dts: socfpga: Move sdmmc-ecc node to Arria 10 dts
  ARM: dts: socfpga: Add atsha204a node to Mercury+ AA1 dts
  ARM: dts: socfpga: Add Google Chameleon v3 devicetree
  dt-bindings: altera: Add Chameleon v3 board

 .../devicetree/bindings/arm/altera.yaml       |  1 +
 arch/arm/boot/dts/Makefile                    |  2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi        | 10 +++
 .../boot/dts/socfpga_arria10_chameleonv3.dts  | 90 +++++++++++++++++++
 ...1.dts => socfpga_arria10_mercury_aa1.dtsi} | 49 ++--------
 5 files changed, 110 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
 rename arch/arm/boot/dts/{socfpga_arria10_mercury_aa1.dts => socfpga_arria10_mercury_aa1.dtsi} (70%)

-- 
2.36.1.255.ge46751e96f-goog

