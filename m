Return-Path: <SRS0=smpC=5S=gmail.com=markuss.broks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8017C54E94
	for <soc@archiver.kernel.org>; Sat, 21 Jan 2023 20:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C24D5C4339B; Sat, 21 Jan 2023 20:19:33 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCD43C433D2;
	Sat, 21 Jan 2023 20:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CCD43C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id qx13so21708524ejb.13;
        Sat, 21 Jan 2023 12:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7G5+S/PVSHz7yMGza3qinD/tbKeLPcUtpFdDTPTxNbI=;
        b=MTfhvV0TM0mIGem6JR2KdbLB6KGqQ7nQOVoRtU+VXzVPlbiulNIuAeWQ40jis9+4j1
         Z5snXhrwBw233PC1FwRjR7I+VJM88+QiEwNEyspOKGMKWNn+5vW1QSIJ9k7nAUZwCNRY
         iPdFkIMIIT69xFbWUu849EXBjyq6jYYn3OWufbPaKZJ/kSmNtS3JYsga8PH3p2M3y8tD
         3lSe2esid2tL/FAww/0T3IsdjUmgjA5EPeEecvGYvQ34GYVM9uZIHcyvgMYTbPKClzQw
         TOZ2fL4N2q4iQSKS5+GIKpHTZhOekGKbQeoxSOytnqFjkau5J+nq00UTy5HKzTzM6wKs
         1u3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7G5+S/PVSHz7yMGza3qinD/tbKeLPcUtpFdDTPTxNbI=;
        b=C5AQVP1Yox93cveHvDRLqghx+hxTA1YB/UjKn6rA5yvQWmBQFX2rpdDhKZM8iD6C+N
         48D4j5Yr4eGWtObYhnws6xQ5U4oljCz7AyAH+nyPPndbajHjnHH1TDu5klpxDxumACAz
         Yc7EHAdpv0sJIPTojO2x8HHcfcltXcvb+f+sY2ARksrEFBXjrSX51yC3P/CCW3onjA0g
         MfIkRKjPVtYVAYgF3SzTx+Lr+umWFEnn99MNfpNWBqwI0c5vnKf/F7E9ILEFtTTS/j02
         Jgvd9ENgCy02ItnlL6taQnTQpiXCqgJiQ786+MIAToZaO9ifhjwv28VfDXyZZ25c3kZS
         NISQ==
X-Gm-Message-State: AFqh2koa1+nj48wUfFF60/gmKuNUwJG2pIacBjytspNLTrQEZD+D/I+c
	ktOueiepSbTeBYIQlJ/aNpE=
X-Google-Smtp-Source: AMrXdXsc5nPomzzhujeJdro79hQ+NL5g2BjdwcuW8fCjiwzRWfJ3jjK4zVr1RSsWyaX5Mff+YcBkcQ==
X-Received: by 2002:a17:907:a2cb:b0:870:7b:94db with SMTP id re11-20020a170907a2cb00b00870007b94dbmr23435891ejc.28.1674332371207;
        Sat, 21 Jan 2023 12:19:31 -0800 (PST)
Received: from localhost.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id ku26-20020a170907789a00b0084d46461852sm17462057ejc.126.2023.01.21.12.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 12:19:30 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Markuss Broks <markuss.broks@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] Add support for Samsung Galaxy S5 (Exynos)
Date: Sat, 21 Jan 2023 22:19:23 +0200
Message-Id: <20230121201926.46990-1-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung Galaxy S5 (Exynos) is a mobile phone released in 2014.
It has an Exynos5422 platform. This version of Galaxy S5 is only
capable of 3G communication using the Intel modem, while the
LTE version of the device (klte) has a Qualcomm Snapdragon SoC.

Currently, internal eMMC, USB, regulators on a PMIC, and touchscreen
are enabled in the device-tree.

It also has the following peripherals:

- 5" 1080p S6E3FA2 DSI display,
- Cypress StreetFighter touch buttons,
- Broadcom BCM4354 wireless connectivity module,
- Intel XMM6360 3G modem,
- STM32F401 serving as a sensor hub,
- Validify Solutions VFS61 series fingerprint sensor,
- Lattice ICE401M FPGA as an IRDA controller,
- Maxim MAX86900 heart rate sensor,
- NXP PN547 NFC controller,
- Wolfson WM5110 Audio DSP,
- Broadcom BCM4753 GPS radio,
- Maxim MAX77804 PMIC,
- Silicon Image SII8240 MHL controller,
- TI LP5562 LED driver

Cc: Mark Brown <broonie@kernel.org>

v1 -> v2:
- use better subject prefixes
- rename Galaxy S5 (Exynos) to Galaxy S5 (SM-G900H)
- align the compatibles and clock output names
- reorder the includes
- generic node name for regulator-tsp-vdd-en
- GPIO flag for regulator
- rename all the regulators, leaving the voltage values only where
  it makes sense (e.g. on 3V3 and 1V8 supplies for the HRM)

Markuss Broks (2):
  Documentation: devicetree: bindings: Add compatible for Samsung Galaxy
    S5 (Exynos)
  arm: dts: Add device-tree for Samsung Galaxy S5 (Exynos)

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/exynos5422-samsung-k3g.dts  | 676 ++++++++++++++++++
 3 files changed, 678 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5422-samsung-k3g.dts

-- 
2.39.0

