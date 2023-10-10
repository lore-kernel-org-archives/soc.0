Return-Path: <SRS0=F8+2=FY=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123A5CD68EC
	for <soc@archiver.kernel.org>; Tue, 10 Oct 2023 05:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BEDA6C433CB; Tue, 10 Oct 2023 05:00:01 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA80EC433C9
	for <soc@kernel.org>; Tue, 10 Oct 2023 04:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA80EC433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99c1c66876aso944559966b.2
        for <soc@kernel.org>; Mon, 09 Oct 2023 21:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1696913998; x=1697518798; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i7NaDoDI8qOvV+4nnKqwVBkoAdHosDfS0rPHPzrt7zI=;
        b=YpAd5gucPLMrTnIG0pt6MPGEghkp24ruT89bl079woIJQDZS5wj3Hyfz9vKF/sm5ho
         8/UWZxwQDrXuWWGszxS6wo+IVc55gih1rJV1kzguUZuZuGFsUfagLRdslHaEJz6uGSkr
         5WPIz6fuOatzsnxjfYiCWTlXR8Fe/IU7sfmCx0TJuW3wAhmE/dyR4OVMB2J0q2uV4aHf
         Pd3F/qxPVQj4g9ZWCuG2rZqq7PHMauMiAT1obdFzAdhwi0+FQqzoUBZ9Pe4bYPcPaoX0
         ividcV0oEFElPP9TIf1Xv/gpllj2682BoEp93xiQ9lMjCD35qU91EhRw0QukIBCVkXnR
         jLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696913998; x=1697518798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i7NaDoDI8qOvV+4nnKqwVBkoAdHosDfS0rPHPzrt7zI=;
        b=eHTVsBqTPSNbr3P6Ap86xe6n4tVal7epp68ULXNLUg7Cb40yh9YwGtooLA8MM6cHN1
         yYnKFup2TfNHlUIRuV64/7iEiYVhic4apQyMQDY/Bz9Cbf1oAPYWMKEmj5IPbX/WeWHC
         VfSjjmWML/RpQR82ch+N7Logy8A3LZU47FMMrMhp3IozE3ulHz2eB4G6DvgMGKLQvoS2
         HzxkO927QrWwev0Ay758j9ju4vu0jhEeDBkMJRfhaoS8wqwHaZ/ks1IysirpZ8dguby5
         U7u7gik68d7AI0PMRC/tn+epbCoFJMYufZI+HNJs2sDzS+LqHVDyIxMmnej3PzEyJ/Pe
         l0CA==
X-Gm-Message-State: AOJu0YwQoTDmgKl2ahD7Yrfke3nYGxJkEIj9Sr8wDKkioflh4dmRAzac
	uJj1KA1zpHEzhhaEggmHLELPFw==
X-Google-Smtp-Source: AGHT+IG4KAyijfW9zG+Vos6yiDuHH4ICn5vykN1f2tDW/U2Jj3lMCwVNIwmaxpqImYoGXMxnuhzkjg==
X-Received: by 2002:a17:907:7788:b0:9ba:2fe3:c976 with SMTP id ky8-20020a170907778800b009ba2fe3c976mr2152769ejc.12.1696913997850;
        Mon, 09 Oct 2023 21:59:57 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.152])
        by smtp.gmail.com with ESMTPSA id lu22-20020a170906fad600b009944e955e19sm7811947ejb.30.2023.10.09.21.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 21:59:57 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 DT updates for v6.7
Date: Tue, 10 Oct 2023 07:59:55 +0300
Message-Id: <20231010045955.1259843-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.7

for you to fetch changes up to 3cec9514911c4400a4b4ab778b9e92b60a14c677:

  ARM: dts: at91: sam9x60_curiosity: Add mandatory dt property for RTT (2023-09-29 22:29:04 +0300)

----------------------------------------------------------------
Microchip AT91 device tree updates for 6.7

It contains:
- the new Microchip SAMA5D29 Curiosity board
- a typo fix in TDES node name for SAMA5D4 dtsi
- enablement of RTT as RTC for SAM9X60 Curiosity board

----------------------------------------------------------------
Andrei Simion (1):
      dt-bindings: ARM: at91: Document Microchip SAMA5D29 Curiosity

Mihai Sain (1):
      ARM: dts: at91: sama5d29_curiosity: Add device tree for sama5d29_curiosity board

Nicolas Ferre (1):
      ARM: dts: at91/trivial: fix typo in crypto DT naming

Tudor Ambarus (1):
      ARM: dts: at91: sam9x60_curiosity: Add mandatory dt property for RTT

 .../devicetree/bindings/arm/atmel-at91.yaml        |   7 +
 arch/arm/boot/dts/microchip/Makefile               |   2 +
 .../boot/dts/microchip/at91-sam9x60_curiosity.dts  |   4 +
 .../boot/dts/microchip/at91-sama5d29_curiosity.dts | 600 +++++++++++++++++++++
 arch/arm/boot/dts/microchip/sama5d4.dtsi           |   2 +-
 5 files changed, 614 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
