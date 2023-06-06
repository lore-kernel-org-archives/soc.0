Return-Path: <SRS0=nKH+=B2=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C41C77B7A
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 04:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C372C4339B; Tue,  6 Jun 2023 04:05:41 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B9F9C433D2;
	Tue,  6 Jun 2023 04:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B9F9C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-75ca95c4272so521280985a.0;
        Mon, 05 Jun 2023 21:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686024339; x=1688616339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYhswQiRt1WsRhH2+UJS4EAOlVs+4YtiTEvdONDNyWM=;
        b=BtHZ1AlOOj/vG4h1Rnh/9nHPW2BHrVUgJvzOSOKj/iM1SBLLQPoT7l0xjaKzdF3z+x
         ThgkPrOK5vFvdtNA+9cP4eb5vdozupnDpmdc5QCZrBCtGqHPnHctWK+wtvX5yow+SQS9
         tqqyCeZcbjOrBmdFGGzgQH0mzfspVNxvtcHmTE0F6zINae5vVyhh6z5213Qv3R6XYzGU
         J+WbrSl79pGKBs9z8u1XliCwQa3oWccz4jIYDczYTJhg7/qBFfIhjezDM8tqSSf2Yazm
         G+g4fbxzrP4giT6INSHqdtL+KaeEX2HsLmc+NMWMu9ylcLX6HmThYdnrP8XmC5ZAaVjH
         YewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686024339; x=1688616339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYhswQiRt1WsRhH2+UJS4EAOlVs+4YtiTEvdONDNyWM=;
        b=LJSYN3SUG5NXQmwcwggn930QkoVSJd+CBuQx8YxPMJk+I22QTT0XI3Hs++ueInHyGm
         XdgwMQkXZbU9MKSrN7JeTL6VWmbFhV4DjpjxuRHQRIZDQjCLe22IzMosnDt28YOz6Mw0
         kpk66E+GYBlcW29/d6x7Fz1qAEvBVNYThjR9XZoanY5JsLu3qQfoEdToR0VE3wSeIbSC
         vQLeJJ5gde6aJX2PyXR1Q8QAHz5oJ3lss6X8dnT3gYxekEN1FFGMU98uyM1ggYHReT8f
         9Vwi/IbEACIFm/O83mULlKdSC70YkD8WD97SVvdlpIvlR+3l7XtJQ6Y2zhv4dQp0Wss7
         WKKA==
X-Gm-Message-State: AC+VfDwKdkZbwSZIQJlOLlsFvqvQp2ReS21Oo0otEhyainZcqsLo1ESj
	QtvM6G0BN9AWWePj/7hUbsYj2+PpARZYyA==
X-Google-Smtp-Source: ACHHUZ5ZjW8Lgt8vljRskIoL0Pq7bwAOEFKuBRFF/VtJSVNzmAcxf4EOO0i8RN6aZbg99iOCiB27JQ==
X-Received: by 2002:a05:6214:2423:b0:61b:7115:559e with SMTP id gy3-20020a056214242300b0061b7115559emr1228066qvb.1.1686024338736;
        Mon, 05 Jun 2023 21:05:38 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:aac8:d62:35cc:958c])
        by smtp.gmail.com with ESMTPSA id e2-20020ac84b42000000b003e388264753sm382980qts.65.2023.06.05.21.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 21:05:38 -0700 (PDT)
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
Subject: [PATCH v4 0/4] Samsung Galaxy Express SGH-I437 Support
Date: Tue,  6 Jun 2023 00:05:23 -0400
Message-Id: <20230606040529.122433-1-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Samsung Galaxy Express SGH-I437.
Currently the following things work on this phone: UART, eMMC, SD Card, and
USB.

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

