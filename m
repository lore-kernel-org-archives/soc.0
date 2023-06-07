Return-Path: <SRS0=vM+f=B3=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBCFC7EE25
	for <soc@archiver.kernel.org>; Wed,  7 Jun 2023 05:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C23BC433A4; Wed,  7 Jun 2023 05:00:32 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6B27C433D2;
	Wed,  7 Jun 2023 05:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E6B27C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-62884fa0e53so40872146d6.0;
        Tue, 06 Jun 2023 22:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686114029; x=1688706029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BnDSNztBm4J3NasuTfQRWgwfyES7T9XRaUOrSTDLNZ4=;
        b=hfOxgLDZXBPnbDuIG7QLJvtBnPCEgqErrK1gQCRO8R2Wv36kpvTnKynhJCefBg/5NR
         NgSk+cqo5oY2Gh58WRiu06UYRiXSUdH5znj7CDiyDPfN7QnE/Wi1dNHq5bTLSO/wRuNu
         9TXuzHyIen3xPyALTGrZdxvFldOR1EHSDFcoKAjDx4I5pM5+vZv7ZxLOpuUbQXh2NF0k
         XnmX3zbaLDU2rrftRUuBPIL4NTJ1l4UGaB7RSbsYqcUilHqJfY0P3NqG5LS5cUyIU/N8
         XdpJVR2MHevcF+aVYrkSDLyqlanxCJ01MOugzFHuwgoCdgEczFtQCC3X2mepC+cTQPHA
         wjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686114029; x=1688706029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnDSNztBm4J3NasuTfQRWgwfyES7T9XRaUOrSTDLNZ4=;
        b=NBYUf++oLAuwihps8FhnCexhSbWv/ZTHDRVTrl4xTkelwK7N5XPkUuLeyjXX6Go6jx
         AYfCrV8HQ6EWNO4NcXQSJGkRUFPhx2Zh/wcXiHyJksYOGvbxdraa2awA45U+SQUFSRzB
         zrUWXSv38Sy3LkxXxAfcc03mVFFAISPVIddtbq2VWkzMQgbxz339RUu5SEaj8W7XbBFd
         5UZZrP1nu8qqOt9GS+/Rw5hU3N+5wKWBlw8+DJtmjHJTLcH3HPD2C7pligiDQziZa9TN
         3tcg/UvJKLN6YpcZeMPvO72pfAwXeD7ddpmwPUtHE1yK+Baq22PmDArSCsjLie9TB0uN
         kEDg==
X-Gm-Message-State: AC+VfDyRA6EPbEoGO2sbBrtZZXuWk4Sik1r5gfQ/JvUZY0IyKXIQiDjI
	3XBPirvzlcojmB+Rf+4stvPFivBOwATD8Q==
X-Google-Smtp-Source: ACHHUZ6FSOUL8gqKJKG6injW2YR28bdwhMVki0CET5tehnYzxt3S9hid7iykw0he0o1Ml6HfPwuWIw==
X-Received: by 2002:a05:6214:1d2b:b0:625:b3a2:f637 with SMTP id f11-20020a0562141d2b00b00625b3a2f637mr2236823qvd.8.1686114029079;
        Tue, 06 Jun 2023 22:00:29 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:c358:f4f2:89b6:ca7d])
        by smtp.gmail.com with ESMTPSA id m1-20020ad44481000000b00621430707f7sm5848980qvt.83.2023.06.06.22.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 22:00:28 -0700 (PDT)
From: Rudraksha Gupta <guptarud@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Cc: Rudraksha Gupta <guptarud@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/4] Samsung Galaxy Express SGH-I437 Support
Date: Wed,  7 Jun 2023 01:00:19 -0400
Message-Id: <20230607050025.86636-1-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Samsung Galaxy Express SGH-I437.
Currently the following things work on this phone: UART, eMMC, SD Card, and
USB.

version 5:
- use enum instead of anyOf in qcom,usb-hs-phy.yaml

version 4:
- Rebase onto rc1
- Fix qcom,usb-hs-phy.yaml patch so it doesn't break other devices

version 3:
- Added Ack
- Fixed compatible in qcom,usb-hs-phy.yaml. `make dt_binding_check dtbs_check`
  no longer complains about USB
- Fixed formatting in qcom-msm8960.dtsi and qcom-msm8960-samsung-expressatt.dts
- Fixed the spi1_default node in qcom-msm8960-samsung-expressatt.dts.
  `make dt_binding_check dtbs_check` no longer complains

version 2:
- Combined patch 1 into patch 4, as the sleep_clk label is specifically needed
  for the USB node.
- Reformatted the commit messages to align with the style used in other commit
  messages that modify the same files.
- Included a cover letter to provide an overview of the patch series.
- Slight refactoring of the device tree source (DTS) file.

Rudraksha Gupta (4):
  dt-bindings: arm: qcom: Add Samsung Galaxy Express
  dt-bindings: phy: qcom,usb-hs-phy: Add compatible
  ARM: dts: qcom: msm8960: Add USB node
  ARM: dts: qcom: Add Samsung Galaxy Express support

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/phy/qcom,usb-hs-phy.yaml         |   5 +-
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/qcom-msm8960-samsung-expressatt.dts   | 331 ++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8960.dtsi           |  34 +-
 5 files changed, 370 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-msm8960-samsung-expressatt.dts

-- 
2.34.1

