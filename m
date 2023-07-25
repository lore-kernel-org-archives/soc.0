Return-Path: <SRS0=w88Z=DL=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71636C0015E
	for <soc@archiver.kernel.org>; Tue, 25 Jul 2023 09:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D5C7C433C8; Tue, 25 Jul 2023 09:40:40 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C502C433C7;
	Tue, 25 Jul 2023 09:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C502C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5661e8f4c45so3679970eaf.1;
        Tue, 25 Jul 2023 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690278038; x=1690882838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GPWRUM32s+W+NzJlw5xle7BrQSCJzLbYMkNbUmW2VZM=;
        b=qlngjdYSw3kOyLjGy8BltQSYFrmRJnTsSV7SAwlwaT1k/w43g0ygOMQc7PQyU2Fjhq
         dItLCtX9G619yf03JAxpj5SrcFA94gGX+/lo3icEHUtS4vwarmmThTlIw+KG4a3vxo3k
         KgDeIgeXgyVggRJ5XXV0/9lX/KW16bNFMtVyiGPmblsov6F6wge4WI6hmGFYimSrtwUW
         OyEIRHFQfa5N47JhbB4o1Djw3jVcQpegFX7Ss+IrHtbklQmeCCTYMXtfp++8zl2F7YIv
         rXRBK0Muw3rtA6k3/Tuv0ERgg12iZ+nRymRIAC0GwV5QNhfFcVZYl2DmH0BHCRh3xqRm
         iEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690278038; x=1690882838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPWRUM32s+W+NzJlw5xle7BrQSCJzLbYMkNbUmW2VZM=;
        b=Ik3TDKdWTeBIsP68gJeCNP/pXUIpFhHrl/9JgQ5wF1AWtcBlYSEHHWtO2JQQqFeIq7
         J2Ie9kW8XbATZMZbKWuArzyYGHnD8nY1n4UPAzguYt+MQ7FxNX1F/ENLZ0MCLpetmeHD
         rCegw+GD1ZG4eU17y2+VbqX2stjERIimrm/H1tUDkkItEzzZ6SKLPTuqANy4Hykt5/7F
         8N/fmIgzsmFeN7zkuqUr9aEm2ZvAQfZcR7AzVMKTcb5iAQjE6WXfol9uhFhETGo9SJjZ
         TSizrbZ0YHiMwJiWyxyTU2r8J/A5DxARRStGKi+wTcYNrcsWrmixLxGQ3ugIeKo+sAuq
         Ft4A==
X-Gm-Message-State: ABy/qLas9CJ7XMbsn6k4O7L/TGgPAitqZDMjUvuwpMJyFiCaYUT4C8Ax
	9E20W5rnaHMsZjKM8Bwg4ug=
X-Google-Smtp-Source: APBJJlGEhpE4ZG6DHBRqr+w+pBzzUV9wuj+8xw33qdcVwNG1H7ZlQgHPvrn+wko5UauyLH47nGKD5A==
X-Received: by 2002:a05:6358:c19:b0:129:c6d6:ce40 with SMTP id f25-20020a0563580c1900b00129c6d6ce40mr9963624rwj.15.1690278037942;
        Tue, 25 Jul 2023 02:40:37 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id l24-20020a62be18000000b0064f7c56d8b7sm9121132pff.219.2023.07.25.02.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 02:40:37 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@kernel.org,
	mjchen@nuvoton.com,
	schung@nuvoton.com,
	Jacky Huang <ychuang3@nuvoton.com>
Subject: [PATCH v2 0/3] Add support for Nuvoton ma35d1 rtc controller
Date: Tue, 25 Jul 2023 09:40:27 +0000
Message-Id: <20230725094030.32877-1-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

This patch series adds the rtc driver for the nuvoton ma35d1 ARMv8 SoC.
It includes DT binding documentation, the ma35d1 rtc driver, and device
tree updates.

The ma35d1 rtc controller provides real-time and calendar messaging
capabilities. It supports programmable time tick and alarm match
interrupts. The time and calendar messages are expressed in BCD format.

This rtc driver has been tested on the ma35d1 som board with Linux 6.5-rc2.

v2:
  - Updated nuvoton,ma35d1-rtc.yaml
    - Modified patch title and fixed typo
    - Added reference to rtc.yaml
    - Used unevaluatedProperties instead of additionalProperties
  - Modified rtc driver
    - Used dev_err_probe()
    - Removed ma35d1_rtc_remove()
    - Made other minor fixes

Jacky Huang (3):
  dt-bindings: rtc: Add Nuvoton ma35d1 rtc
  arm64: dts: nuvoton: Add rtc for ma35d1
  rtc: Add driver for Nuvoton ma35d1 rtc controller

 .../bindings/rtc/nuvoton,ma35d1-rtc.yaml      |  48 +++
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |   4 +
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |   4 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |   8 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-ma35d1.c                      | 355 ++++++++++++++++++
 7 files changed, 431 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
 create mode 100644 drivers/rtc/rtc-ma35d1.c

-- 
2.34.1

