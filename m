Return-Path: <SRS0=e875=ED=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E81C71159
	for <soc@archiver.kernel.org>; Fri, 18 Aug 2023 16:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5324C433C8; Fri, 18 Aug 2023 16:45:51 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B97CC433C7
	for <soc@kernel.org>; Fri, 18 Aug 2023 16:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B97CC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-688787570ccso926699b3a.2
        for <soc@kernel.org>; Fri, 18 Aug 2023 09:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1692377148; x=1692981948;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3nqyaIKlS3+7cl8Rhwxy25of98DZZkRzljBsIJVGe+I=;
        b=A+dqpK1b/pxX9r14Crh6Rz782tfhYaDhEDEug6lOAgNteErDrSu0ytw/urNNk9Vd7j
         hkiQSODn4BANE3gBTNL/+YsELvkMduHwlROIz/9lQeqO6WDBa7EI7vj+zEJv9qR0S3oy
         ndp6Zw1UowAaRU7jmeAAEJybsKOYK1BFoCjnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692377148; x=1692981948;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3nqyaIKlS3+7cl8Rhwxy25of98DZZkRzljBsIJVGe+I=;
        b=JVutALHJq5ETpfUr+SRaDq0YWU2oURlvsCEsqmnqWS5BfQ2EfuJE7EaIg4Tl7qAtGn
         molOVcRjfCYRFFpPyLtRpcWz8eCl2NQ+ANtZR+yna9STNu4u5JFxLCKmqUcGKvYykgGn
         EKjeIuxMahN18tB32ZO0fQ/CwEvuIQ+leX8c1JcSsoFZDVkcsEx5qgK8F+Icht2pl7XE
         exrLxfJDYFfu+TfpWJSUd41SxTJDuJUAA3J2kOWkvvw/0BHjJR1SJgYgU9IfMkU5r4WN
         ziPj2sUzVuv0G8dBSnjDtF3ojhbdg/C3NWRwil74nvn0OW/nGLdYmR3/C7tarq+1CPlb
         qvLw==
X-Gm-Message-State: AOJu0YyuO1iOO1kk+cpkM5zHorkk+Pr5lZM2G+DYG0qr9svL6XSSlLjY
	kroy3FHGq8fQgdeK/NuYoFqwQg/CT/SyQqh05UjCMrNND6U/HlEjCWZzbReScl6nUxhaRZE/PPZ
	Uz7TRg/Fnvb+LzQ2CuZF7Q61WfaF6EV+FT4isU+hB1bS+SEpuspqfg/VRztAnJNiUUqpdaA7Jz2
	w=
X-Google-Smtp-Source: AGHT+IFd2xqKDZan1Wpk2BrZ/QB4Pf7HW1c6OuTUOBn/GuduDKF5AawLs7JxhoOVIJWZ/R1g8gv+/g==
X-Received: by 2002:a05:6a20:72a6:b0:145:8e82:4eec with SMTP id o38-20020a056a2072a600b001458e824eecmr3986931pzk.37.1692377148054;
        Fri, 18 Aug 2023 09:45:48 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id e21-20020aa78c55000000b00666912d8a52sm1755761pfd.197.2023.08.18.09.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 09:45:46 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	Aleksey Nasibulin <alealexpro100@ya.ru>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Dan Haab <dan.haab@luxul.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/4] Broadcom devicetree changes for 6.6
Date: Fri, 18 Aug 2023 09:45:36 -0700
Message-Id: <20230818164539.2871539-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000c4396b060335422a"

--000000000000c4396b060335422a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.6/devicetree

for you to fetch changes up to 2900083269f7c0f0ff430bffc6ced2038aed9b6b:

  ARM: dts: BCM5301X: Add DT for ASUS RT-AC3100 (2023-08-04 10:08:49 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based Device Tree changes for
6.6, please pull the following:

- Arinc adds support for the Asus RT-AC3100 router based upon the
  BCM47094 SoC

- Krzysztof splits interrupt properties per cell such that they are mode
  readable and adds missing spaces in front of node names/labels

- Rafal updates the BCM5301X DTS to correct PCIe, SPI over GPIO
  properties. He describes the Ethernet links to internal switch ports
  and then updates the BCM53573 binding and Ethernet properties by
  declaring the BCM53125 external switch on port 5, add Ethernet links
and
  disables the second Ethernet MAC on Luxul devices.

- Dan describes the Wi-Fi regulatory mappings for Luxul devices

- Stanislav updates the bcm28155 DTS to use node labels

- Linus adds SEAMA compatible properties to MTD partitions

- Aleksey updates the Linksys EA6500 v2 to have the full 256MiB of DRAM
  available

- Stefan updates a number of BCM283x nodes to confirm to DTS schema:
  pinctrl, DMA controllers and PWM cells.

----------------------------------------------------------------
Aleksey Nasibulin (1):
      ARM: dts: BCM5301X: Extend RAM to full 256MB for Linksys EA6500 V2

Arınç ÜNAL (2):
      dt-bindings: arm: bcm: add bindings for ASUS RT-AC3100
      ARM: dts: BCM5301X: Add DT for ASUS RT-AC3100

Dan Haab (1):
      ARM: dts: BCM5301X: Add Wi-Fi regulatory mappings for Luxul devices

Krzysztof Kozlowski (2):
      ARM: dts: broadcom: add missing space before {
      ARM: dts: broadcom: split interrupts per cells

Linus Walleij (1):
      ARM: dts: bcm5301x: Add SEAMA compatibles

Rafał Miłecki (12):
      ARM: dts: BCM5301X: Add Ethernet interfaces links
      ARM: dts: BCM53573: Drop nonexistent "default-off" LED trigger
      ARM: dts: BCM53573: Drop nonexistent #usb-cells
      ARM: dts: BCM53573: Add cells sizes to PCIe node
      ARM: dts: BCM53573: Use updated "spi-gpio" binding properties
      dt-bindings: arm: bcm: add BCM53573 SoCs family binding
      ARM: dts: BCM53573: Fix Ethernet info for Luxul devices
      ARM: dts: BCM53573: Fix Tenda AC9 switch CPU port
      ARM: dts: BCM53573: Describe BCM53125 switch ports in the main DTS
      ARM: dts: BCM53573: Add BCM53125 switch port 5
      ARM: dts: BCM53573: Add Ethernet interfaces links
      ARM: dts: BCM53573: Disable second Ethernet on Luxul devices

Stanislav Jakubek (1):
      ARM: dts: bcm28155-ap: use node labels

Stefan Wahren (3):
      ARM: dts: bcm283x: Fix pinctrl groups
      ARM: dts: bcm2835: adjust DMA node names
      ARM: dts: bcm283x: Increase pwm-cells

 .../devicetree/bindings/arm/bcm/brcm,bcm4708.yaml  |   1 +
 .../devicetree/bindings/arm/bcm/brcm,bcm53573.yaml |  39 +++++
 arch/arm/boot/dts/broadcom/Makefile                |   1 +
 arch/arm/boot/dts/broadcom/bcm-hr2.dtsi            |   4 +-
 arch/arm/boot/dts/broadcom/bcm-ns.dtsi             |  18 +++
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi            |   4 +-
 arch/arm/boot/dts/broadcom/bcm11351.dtsi           |  13 +-
 arch/arm/boot/dts/broadcom/bcm21664.dtsi           |   9 +-
 arch/arm/boot/dts/broadcom/bcm23550.dtsi           |   9 +-
 arch/arm/boot/dts/broadcom/bcm2711.dtsi            |   4 +-
 arch/arm/boot/dts/broadcom/bcm28155-ap.dts         |  94 ++++++------
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi     |   2 +-
 arch/arm/boot/dts/broadcom/bcm2835-rpi-a-plus.dts  |   1 +
 arch/arm/boot/dts/broadcom/bcm2835-rpi-a.dts       |   1 +
 arch/arm/boot/dts/broadcom/bcm2835-rpi-b-plus.dts  |   1 +
 arch/arm/boot/dts/broadcom/bcm2835-rpi-b-rev2.dts  |   1 +
 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts       |   1 +
 arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1-io1.dts |   1 +
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero-w.dts  |   2 +
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts    |   1 +
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi        |   2 -
 arch/arm/boot/dts/broadcom/bcm2836-rpi-2-b.dts     |   1 +
 arch/arm/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts |   1 +
 .../arm/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts |   2 +
 arch/arm/boot/dts/broadcom/bcm283x.dtsi            |   2 +-
 .../dts/broadcom/bcm4708-linksys-ea6500-v2.dts     |   3 +-
 .../boot/dts/broadcom/bcm47094-asus-rt-ac3100.dts  |  23 +++
 .../boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 163 +++++++++++++++++++++
 .../boot/dts/broadcom/bcm47094-asus-rt-ac88u.dts   | 155 +-------------------
 .../boot/dts/broadcom/bcm47094-dlink-dir-885l.dts  |   1 +
 .../boot/dts/broadcom/bcm47094-dlink-dir-890l.dts  |   1 +
 .../dts/broadcom/bcm47094-linksys-panamera.dts     |   2 +-
 .../boot/dts/broadcom/bcm47094-luxul-xap-1610.dts  |  37 +++++
 .../dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts    |  36 +++++
 arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts |   2 +-
 .../boot/dts/broadcom/bcm47189-luxul-xap-1440.dts  |  20 ++-
 .../boot/dts/broadcom/bcm47189-luxul-xap-810.dts   |  21 ++-
 arch/arm/boot/dts/broadcom/bcm47189-tenda-ac9.dts  |   9 +-
 arch/arm/boot/dts/broadcom/bcm53573.dtsi           |  53 ++++++-
 arch/arm/boot/dts/broadcom/bcm947189acdbmr.dts     |   6 +-
 40 files changed, 501 insertions(+), 246 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,bcm53573.yaml
 create mode 100644 arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dts
 create mode 100644 arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi

--000000000000c4396b060335422a
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBVgwggRAoAMCAQICDBP8P9hKRVySg3Qv5DANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMjE4MTFaFw0yNTA5MTAxMjE4MTFaMIGW
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xGTAXBgNVBAMTEEZsb3JpYW4gRmFpbmVsbGkxLDAqBgkqhkiG
9w0BCQEWHWZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEA+oi3jMmHltY4LMUy8Up5+1zjd1iSgUBXhwCJLj1GJQF+GwP8InemBbk5rjlC
UwbQDeIlOfb8xGqHoQFGSW8p9V1XUw+cthISLkycex0AJ09ufePshLZygRLREU0H4ecNPMejxCte
KdtB4COST4uhBkUCo9BSy1gkl8DJ8j/BQ1KNUx6oYe0CntRag+EnHv9TM9BeXBBLfmMRnWNhvOSk
nSmRX0J3d9/G2A3FIC6WY2XnLW7eAZCQPa1Tz3n2B5BGOxwqhwKLGLNu2SRCPHwOdD6e0drURF7/
Vax85/EqkVnFNlfxtZhS0ugx5gn2pta7bTdBm1IG4TX+A3B1G57rVwIDAQABo4IB3jCCAdowDgYD
VR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEG
CCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWdu
MmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93
d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6
hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNy
bDAoBgNVHREEITAfgR1mbG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggr
BgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUUwwfJ6/F
KL0fRdVROal/Lp4lAF0wDQYJKoZIhvcNAQELBQADggEBAKBgfteDc1mChZjKBY4xAplC6uXGyBrZ
kNGap1mHJ+JngGzZCz+dDiHRQKGpXLxkHX0BvEDZLW6LGOJ83ImrW38YMOo3ZYnCYNHA9qDOakiw
2s1RH00JOkO5SkYdwCHj4DB9B7KEnLatJtD8MBorvt+QxTuSh4ze96Jz3kEIoHMvwGFkgObWblsc
3/YcLBmCgaWpZ3Ksev1vJPr5n8riG3/N4on8gO5qinmmr9Y7vGeuf5dmZrYMbnb+yCBalkUmZQwY
NxADYvcRBA0ySL6sZpj8BIIhWiXiuusuBmt2Mak2eEv0xDbovE6Z6hYyl/ZnRadbgK/ClgbY3w+O
AfUXEZ0xggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwT
/D/YSkVckoN0L+QwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEILf0yOHNFStIqvwg
ZwHAxCdAfNIrOcDlf6savuFY5n66MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTIzMDgxODE2NDU0OFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZI
AWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEH
MAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQDwxyjSEK3xjD2sXj88wZ7JHvnL2u7j9f7/
mAuVBtOdAILosQkdDFnm9DJHBwxfHVu/ivJv1LH/Ff8c89ObEa4ZF6JtiBAzxgoH0jW4Pasu/nRG
EnAsYR8h6bMUyvRtaSb0Pu6/F5jZjttQOUAgTSv8OPUdMA2wCGDDBMGGGdF5bNgYYSKlMIiPsCb0
7alCkGTm9MDIuLWAm35INV89O9Mu0TYEbD1i/k3IN2uUN8Ya4D/rHUhzd1xA/gzl3SAeZmFl8Xbk
Mc1q3yQ8MSbU2nx+JEGtJ3DoYVxYRAr7m+hevyo+iUkIIzrB9DU3CwKTBhZByqXEHVi4SB+TJpI5
Uj5T
--000000000000c4396b060335422a--
