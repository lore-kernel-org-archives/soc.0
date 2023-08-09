Return-Path: <SRS0=f40L=D2=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F294CC001DB
	for <soc@archiver.kernel.org>; Wed,  9 Aug 2023 01:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB9E1C433C7; Wed,  9 Aug 2023 01:15:49 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A4891C433C8;
	Wed,  9 Aug 2023 01:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A4891C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-565334377d0so110222a12.2;
        Tue, 08 Aug 2023 18:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691543748; x=1692148548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GPWRUM32s+W+NzJlw5xle7BrQSCJzLbYMkNbUmW2VZM=;
        b=r6+cYmz7a9GuR4hKSjvtbYHXQ4uSc8zORRE7EPwV9JSIlZuij60Qe5TTdFTgbTfO0V
         rG1ibU41ckM+vDvqqamY+nfE+6oBdEN/Q33IzfNQHqR98uwwY8wg63IOi0m9SHliTdKF
         J+Lt/epF6QWs2YIAkePiGzsIJIkfJ1FhWnydtUJWs7UjB42SCKM5TBlhzqDJUD1ayAbn
         1isR6Yn9S51vHybdTymTQneQcoMflPeL1F1cIGrtnPfdY73uAPyuGxefgVR8cM9TKAVV
         D9njbPUBeHDlg3e7dR9dCxgbG2EukehnZ7A4kg4ABwyBKicB+sAq8FO8xr+KlG4gxoVj
         Eocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691543748; x=1692148548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPWRUM32s+W+NzJlw5xle7BrQSCJzLbYMkNbUmW2VZM=;
        b=JMEVgLDQV9D/Q49CdcdxJKXI0IoZL4TCf5IDpslNZZj76P4NJnMI75nFIt4JTp1Plj
         a7UdCM2FbAaRNLxrTTU9KVKKSR6mDFXzNpjXyRFqu+Y4nFlIcXBL0Z1VxnEp9deYs6vC
         OGkV6X/quxs0aeTo9xXqSGoAiVOCehNREeonnHQPvsrCRPw6DejvlO/0cUv2xuZmdvc8
         tIlBW2tzDoGlwW8GHH/PMnyenqovL0oOZLTHIX7PqsQf8D6cN1jEZsTjh78wpSIXOoFE
         DJBAqtO7BlOMopQ4hsGxnqNaCcVaPh965xJiTTLLYnVHF7dyQHRACVnqfx20c1Vf3pAS
         KZlQ==
X-Gm-Message-State: AOJu0Yym1oUVk5+Wc7IX7nIkg4QyBcO2Pig6d8HLvdvClgqWoLKWuyfQ
	51apTyom9UrkJyd3MVB0Z9k=
X-Google-Smtp-Source: AGHT+IEaH6Ei7SipTX4Eq714C4AvTEUatqG0ziqy/qoVCZL7cJePyRr90iRzJHRUaWUZ1RmGxLyl5g==
X-Received: by 2002:a17:902:7793:b0:1b8:6cae:3570 with SMTP id o19-20020a170902779300b001b86cae3570mr1377591pll.11.1691543747719;
        Tue, 08 Aug 2023 18:15:47 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t22-20020a1709028c9600b001bc68602e54sm5730449plo.142.2023.08.08.18.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 18:15:47 -0700 (PDT)
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
Subject: [RESEND PATCH v2 0/3] Add support for Nuvoton ma35d1 rtc controller
Date: Wed,  9 Aug 2023 01:15:39 +0000
Message-Id: <20230809011542.429945-1-ychuang570808@gmail.com>
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

