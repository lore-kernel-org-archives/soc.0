Return-Path: <SRS0=98Po=DG=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A59C001B0
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 01:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 095CBC433CA; Thu, 20 Jul 2023 01:28:35 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01192C433C7;
	Thu, 20 Jul 2023 01:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01192C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b8bd586086so1869005ad.2;
        Wed, 19 Jul 2023 18:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689816513; x=1690421313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RLL2tr+LIqX1NO/Pc6Wrphl4U7IYBQOy7XNovYEZclQ=;
        b=GPSmmtDPWNsIkTZDwpeml90XUUsdUDNJLkiIu7LZuUkn/gywuhX58ThYa/svu0oz+z
         sdV3nprLThqbBBFc/9TgUzZY45eDde3YlmYZCVhugTuH54XKHfTtB25pwNW/UK+p1YVa
         vUsPO4qXqk+AjR/dy1+4roSJ26nLT587NiVZmEIBwTKVdDR8Ok27yR/vL4rjIZ1XhOH9
         VICMuvFIiBRzoCT1XxLDTHogttTNCCQijGbXY3MHAcICmlVI5co1xBLJbbQTKdvOX9Ns
         xox8heOEOr86J0ZD8mgwKXRyygJvK8gOZONSOxB8hi5qExMcwOLCngYs82t6BdYcEFxv
         z3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689816513; x=1690421313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLL2tr+LIqX1NO/Pc6Wrphl4U7IYBQOy7XNovYEZclQ=;
        b=h9HMkURJTMHEiu/iFx/tlRih9PJmwORR14x4IX4glkSMaOqXHAv0Y6oYHvatvOAGm3
         KyZkvJxixD7al+HlnZKOV+dClhn0CELFey2x1vggcQXnPEfrZZKObeiu9TEZhdSKPK6u
         ZiD1J2GqZUfFAP8mBI2k9ZqA7+etQorZ8xsM4B3UmEGL1QBTSI55M819d123I/bnvT6e
         bg5lksB4jqE+t2cOUvkU8KDVpbhXOFd/U94Pn5s9az5VJY6B+KUfUwRQlqN0wf/bTx4L
         7vKvDYPHRz/a9aFI5wTPWenAhYXOOnbBQ430ovrL4ta2z9GCHD56lWvIYjAXVNCXyyfB
         O9FA==
X-Gm-Message-State: ABy/qLb2wqQWrpBVTkAvuUSsPGCbvgEQXRrEiEjhfT5ZDV8xF4SnllJA
	NdeD9CyqHEVY15UFXP9CUMg=
X-Google-Smtp-Source: APBJJlH7o+eExptczkCECKURCD9Em0bpUiO2dPHusBQmDrgRDRdwQxGXlsePstVPgqTqvEZNkiOSfg==
X-Received: by 2002:a17:902:cecd:b0:1b2:1a79:147d with SMTP id d13-20020a170902cecd00b001b21a79147dmr2551275plg.2.1689816513179;
        Wed, 19 Jul 2023 18:28:33 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id jc18-20020a17090325d200b001b1a2c14a4asm4673998plb.38.2023.07.19.18.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 18:28:32 -0700 (PDT)
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
Subject: [PATCH 0/3] Add support for nuvoton ma35d1 rtc controller
Date: Thu, 20 Jul 2023 01:28:23 +0000
Message-Id: <20230720012826.430026-1-ychuang570808@gmail.com>
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

Jacky Huang (3):
  dt-bindings: rtc: Document nuvoton ma35d1 rtc driver
  arm64: dts: nuvoton: Add rtc for ma35d1
  rtc: Add driver for nuvoton ma35d1 rtc controller

 .../bindings/rtc/nuvoton,ma35d1-rtc.yaml      |  45 +++
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |   4 +
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |   4 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |   8 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-ma35d1.c                      | 371 ++++++++++++++++++
 7 files changed, 444 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
 create mode 100644 drivers/rtc/rtc-ma35d1.c

-- 
2.34.1

