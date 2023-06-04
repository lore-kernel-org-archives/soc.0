Return-Path: <SRS0=I9Ey=BY=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CA9C7EE2A
	for <soc@archiver.kernel.org>; Sun,  4 Jun 2023 06:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48620C433A7; Sun,  4 Jun 2023 06:30:44 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35B46C433EF;
	Sun,  4 Jun 2023 06:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35B46C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-75d5469c856so23060785a.2;
        Sat, 03 Jun 2023 23:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685860241; x=1688452241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SbqYJAHskzU5DpmVfI7uhOaA6IbRO1C4pvsLQyJWA6o=;
        b=n4wXNxl+K400gB1Ir/Qmwa1PG4A0CdCHuO3n26/m7JRfeqUYaC6QmPPeFE+sHuy9ER
         3FkmS/JP9ThGJws0SVJl8IZxnjyLtmPPUknFTJvflPMGlbMFws+2TjVRm217Sy9rV8x5
         bP/aBOFOfuZ+d/JWFg33GFlBZKXMFAzCsUS7Tq61FLWbir7XaY8KqwHV3oX3cHyMhsv0
         qQmRoJJvGfFExjXQdLe3rELNFYFPH/97TD0Xcxi23Rgv8xecAlJ71eySA5mvqSD21Om3
         egN8WTiBKBh2FSzGd3iRe/b6RbUH28UYaZ1ii/k/FcC6xW24YZT+rSrdfDU1ji8/uAhM
         9qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685860241; x=1688452241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbqYJAHskzU5DpmVfI7uhOaA6IbRO1C4pvsLQyJWA6o=;
        b=MFVE6UPfhFyoq5lszCWx+V6aveC9T4nLyd10Q03QwwbXiTUnnduGtkytzRh8QLYesH
         OSTn/x8Gb1Rhdv2qfbPSX0rftQmUdrFNanVP2ZwFytTI3+/OZILIRLtdWvR/hUXDy0ZV
         uIG6UOZCGU3NNHm0zcE/JOXZmCyY//puqrg/BH3PS5a7QmLI6kRnZKV1HzvXbrL0farG
         Bl8SB/W7MxKUuZupZMwv7753wrRNvecClI/51MVXyS/oG+6NnWY1GHFnpYdMrOsg7fk6
         Mzdh4krIMlWLNwWYL2fHdv6yEtCmqhEmZoh3lciKCqg/jp1Gz2scXJBTpjOQQs6IfxLk
         I7qg==
X-Gm-Message-State: AC+VfDw0Z4pLrgyh09KunALuCpmhYqsiGf8rZEJrXJ1SzNGykTAPuO/h
	l4QzqfuwpSEcmYe0dCVlZ/qoEdFZ/ntw3g==
X-Google-Smtp-Source: ACHHUZ6IUiD2zJzv9IRX3p+2i7RHR6TC4L//qeKiNXgoHsvBjkZf4Y2adSGmxeR2gcKQg2LBugYnqw==
X-Received: by 2002:ac8:5812:0:b0:3f6:a015:d9d4 with SMTP id g18-20020ac85812000000b003f6a015d9d4mr4419511qtg.65.1685860241025;
        Sat, 03 Jun 2023 23:30:41 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:ab78:dd77:aea4:8d1a])
        by smtp.gmail.com with ESMTPSA id e10-20020ac85dca000000b003f018e18c35sm3044163qtx.27.2023.06.03.23.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 23:30:40 -0700 (PDT)
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
Subject: [PATCH v3 0/4] Samsung Galaxy Express SGH-I437 Support
Date: Sun,  4 Jun 2023 02:30:17 -0400
Message-Id: <20230604063032.365775-1-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Samsung Galaxy Express SGH-I437.
Currently the following things work on this phone: UART, eMMC, SD Card, and
USB.

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

