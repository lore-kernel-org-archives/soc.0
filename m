Return-Path: <SRS0=XNjI=ZS=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706D7C6FA82
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 02:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 572E8C433D7; Thu, 15 Sep 2022 02:30:53 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 684D7C433C1;
	Thu, 15 Sep 2022 02:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 684D7C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id l14so4745381qvq.8;
        Wed, 14 Sep 2022 19:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=C2L6Ty4CvOYYsLPwpy+PwPh7dVj9ZKeMKP4Vsos9eeM=;
        b=a6nXpbtnXi0tO9sGgPjqY/U8wszT0BJxJe5PBNwaT/ysp0wR1a6gTRBsuSc5PfM6GH
         t5efrf2+Qd5usLkImCdT0LR7wk9898KNR4ct692DPA460J2iUGwoynj4RFc+80sikSt1
         /m6n8K9/+fFTkAgfpW4tNLSakcasRrVeJSXI9ycRxNkQQdvVJsXj8LjW8PQKQfR8jDv9
         EbNcBYLzAn2IuMSWnqLP750YZVxZp+OTqs4wTXdzmd1BEFtcMCttDVbctt2dKUA+BJKb
         GL229evKcUyD32kESV52jtcwVBm2sF4TtiroX79gm8I8yJhYuv2NGtQ3N5po5tOLj4cj
         NZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=C2L6Ty4CvOYYsLPwpy+PwPh7dVj9ZKeMKP4Vsos9eeM=;
        b=5QtBgHCPhKEQ5ak/WAUPKLoYs7iSgiAb5KbvZaznaVD6lN8xJlv/iH4NyRWlVHCneX
         ardd5OMCoGnZdC21pF7sbp211rojY2N9wn70gfFgY4+RZQAvCx5Xho1nspYvFbttVNMl
         XqHDbMz1azCFziAG1xogmOqbPdX8Sexp1JIGsGjwZZp95llJ9vDn0lF3a+GIChe7wcg3
         5Xc54ftK49/KCV8GNv12+5DKAjhRmmcQ17HI9fZjiWYn04v1yhHkpH2eSf517ihW4l4o
         eHTApvqShWtWub7MKHRZkWWp/OyVX/VZKHVGeNb48h3ZqKFLUKdMB62rV8OARmK9vSKv
         7KfQ==
X-Gm-Message-State: ACgBeo0szAol5jV1Dp+IF8QI7ljtk5NdN3aAMzmpDsCx/ASsQdjSjNeM
	tTju7ZAHxV6/a+SwGuh6R+dfwBmpPNQ=
X-Google-Smtp-Source: AA6agR5ruTcTWMAMNdxhRUA08dHnbocH+nBDPiip3zDrpSZ5KyiFPoy8FLuLaBrTWEtc+xglWN5f4w==
X-Received: by 2002:a05:6214:5186:b0:4ac:72e5:c312 with SMTP id kl6-20020a056214518600b004ac72e5c312mr30720524qvb.41.1663209050755;
        Wed, 14 Sep 2022 19:30:50 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u16-20020a05620a0c5000b006bbe7ded98csm3062982qki.112.2022.09.14.19.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 19:30:50 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/5] Broadcom devicetree changes for 6.1
Date: Wed, 14 Sep 2022 19:30:41 -0700
Message-Id: <20220915023044.2350782-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915023044.2350782-1-f.fainelli@gmail.com>
References: <20220915023044.2350782-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.1/devicetree

for you to fetch changes up to dd5c672d7ca92040ed77aaf9293a5134a5980af1:

  arm64: bcmbca: Merge ARCH_BCM4908 to ARCH_BCMBCA (2022-08-15 09:56:09 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoC Device Tree updates
for 6.1, please pull the following:

- Rafal improves the BCM5301X PCIe DT nodes schema validation by
flagging the PCIe controller with a missing "device_type" property

- William merges BCM4908 within BCMBCA since this chip is part of the
Broadcom Broadband Carrier Access group and follows the architecture of
those chips

----------------------------------------------------------------
Rafał Miłecki (1):
      ARM: dts: BCM5301X: Add basic PCI controller properties

William Zhang (6):
      dt-bindings: arm64: bcmbca: Merge BCM4908 into BCMBCA
      dt-bindings: arm64: bcmbca: Update BCM4908 description
      arm64: dts: bcmbca: update BCM4908 board dts files
      arm64: dts: Move BCM4908 dts to bcmbca folder
      arm64: dts: Add BCM4908 generic board dts
      arm64: bcmbca: Merge ARCH_BCM4908 to ARCH_BCMBCA

 .../devicetree/bindings/arm/bcm/brcm,bcm4908.yaml  | 42 ----------------------
 .../devicetree/bindings/arm/bcm/brcm,bcmbca.yaml   | 25 +++++++++++++
 arch/arm/boot/dts/bcm5301x.dtsi                    | 12 +++++++
 arch/arm64/Kconfig.platforms                       | 10 +-----
 arch/arm64/boot/dts/broadcom/Makefile              |  1 -
 arch/arm64/boot/dts/broadcom/bcm4908/Makefile      |  5 ---
 arch/arm64/boot/dts/broadcom/bcmbca/Makefile       |  5 +++
 .../{bcm4908 => bcmbca}/bcm4906-netgear-r8000p.dts |  2 +-
 .../bcm4906-tplink-archer-c2300-v1.dts             |  2 +-
 .../dts/broadcom/{bcm4908 => bcmbca}/bcm4906.dtsi  |  0
 .../{bcm4908 => bcmbca}/bcm4908-asus-gt-ac5300.dts |  2 +-
 .../bcm4908-netgear-raxe500.dts                    |  2 +-
 .../dts/broadcom/{bcm4908 => bcmbca}/bcm4908.dtsi  |  0
 arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dts   | 30 ++++++++++++++++
 14 files changed, 77 insertions(+), 61 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,bcm4908.yaml
 delete mode 100644 arch/arm64/boot/dts/broadcom/bcm4908/Makefile
 rename arch/arm64/boot/dts/broadcom/{bcm4908 => bcmbca}/bcm4906-netgear-r8000p.dts (96%)
 rename arch/arm64/boot/dts/broadcom/{bcm4908 => bcmbca}/bcm4906-tplink-archer-c2300-v1.dts (99%)
 rename arch/arm64/boot/dts/broadcom/{bcm4908 => bcmbca}/bcm4906.dtsi (100%)
 rename arch/arm64/boot/dts/broadcom/{bcm4908 => bcmbca}/bcm4908-asus-gt-ac5300.dts (97%)
 rename arch/arm64/boot/dts/broadcom/{bcm4908 => bcmbca}/bcm4908-netgear-raxe500.dts (89%)
 rename arch/arm64/boot/dts/broadcom/{bcm4908 => bcmbca}/bcm4908.dtsi (100%)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dts
