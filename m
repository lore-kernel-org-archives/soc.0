Return-Path: <SRS0=ULv4=CH=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A60EB64DB
	for <soc@archiver.kernel.org>; Mon, 19 Jun 2023 13:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFF4EC433C9; Mon, 19 Jun 2023 13:49:31 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E68BC433C8
	for <soc@kernel.org>; Mon, 19 Jun 2023 13:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E68BC433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-668730696a4so524887b3a.1
        for <soc@kernel.org>; Mon, 19 Jun 2023 06:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1687182569; x=1689774569;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4WID7Z/5HtxAxczdlQWRC4PL03Zj1h+ZZNVO9SnGCec=;
        b=VPElhoX2ZEuY1jgTvi5qDQHq95YTKuHfZLf10ZJZ4XobG/+BfhuYi1mfntEr1LhEmi
         Noxxxf89Ozu9MmOMlukvUY//IqeBXgsswYBpDRisdPpnjwDMmAwe3f+6RqZan2kUkF8Q
         89mfyukrx6oT8fwvWGUN+3WksZxrexDn/fqwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687182569; x=1689774569;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4WID7Z/5HtxAxczdlQWRC4PL03Zj1h+ZZNVO9SnGCec=;
        b=kkr9Gj19Ryjc65tzm650Z+//o88wyls2nxnVkB2PMVvNSKxrb3POrvtHLwPYGNFFzE
         VP3ecJvw+yWZjarSHP+BYxA1xRK4Lp7jjELdJXzwKL+1WzESQhl9xBw1wVplPa4iQIzv
         /4xrlumRovDYuSO5JBYEp2I7xXOGkxcU/DvxT9xS9CxD2U2fCVCK+2JWhlglE285pjS6
         d9Lbv1uLbNwBHy9cp9q55Uvc3RsYo6aZydMaE4at4JHFWC2iX9aXpLV71aa0adN/CgJQ
         GKPDOhH+UsAjUF94Gq7XD5xVAhvvm25HljmMr2DPBcLKidUbP9ulzYsozFJA7x7iZNTk
         /dCg==
X-Gm-Message-State: AC+VfDy3mVRl0lEVB3TSdsWscwXkfKkFs9GTcgDJydRXRuvIXDAQMtEX
	zXutdxcOhwKX8R9s9bPom48ueBA7DkriBvBiv35iv/egJXzWzZNFQ//qh9PoSPIX298ibhqfP0F
	77z9lWhV0CuNb4a2ZrMwwbe8PjezAefYTqbzUPUy+uZXt/cWufHvLMEm01LW2yMQZKl0OJq5cqz
	eEuA==
X-Google-Smtp-Source: ACHHUZ5xADIAt3s9xTV7+xi3OLTj6wfrdUNrDJ+ccn0wAM4N1felX+m2fc9bPQX26ASmw/8C06NEuA==
X-Received: by 2002:a05:6a20:4304:b0:121:cff2:a44b with SMTP id h4-20020a056a20430400b00121cff2a44bmr1669617pzk.25.1687182569040;
        Mon, 19 Jun 2023 06:49:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id f11-20020aa782cb000000b00571cdbd0771sm17676540pfn.102.2023.06.19.06.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:49:27 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Christian Lamparter <chunkeey@gmail.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Florian Fainelli <f.fainelli@gmail.com>,
	William Zhang <william.zhang@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/3] Broadcom devicetree changes for 6.5
Date: Mon, 19 Jun 2023 06:49:18 -0700
Message-Id: <20230619134920.3384844-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000bbcbe605fe7bcde6"

--000000000000bbcbe605fe7bcde6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.5/devicetree

for you to fetch changes up to b67cad33176e472df6d16a24ee7624299bdcd5d5:

  ARM: dts: BCM5301X: Add cells sizes to PCIe nodes (2023-06-19 04:57:11 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree changes
for 6.5, please pull the following:

- Krzysztof adds missing cache properties for the BCM63xx DSL routers

- Rafal relicenses a number of the BCM5301X DTS files to the GPL 2.0+ / MIT license,
  and he fixes a number of Device Tree nodes warnings, adds MAC address
  for all Luxul routers and adds Netgear R8000 Wi-Fi regulatory
  information to the DTS

- Stanislav updates the "BCM mobile" SoCs DTS files to fix various
  warnings

- Aurelien enables the BCM283x DTS files to be built with relocation
  information to make them usable with DT overlays

- Christian fixes the Meraki DTS to have correct NAND ECC properties,
  correct partition numbers and fixed-link node(s) properties

----------------------------------------------------------------
Aurelien Jarno (1):
      arm: dts: bcm: Enable device-tree overlay support for RPi devices

Christian Lamparter (3):
      ARM: dts: BCM5301X: MR26: MR32: remove bogus nand-ecc-algo property
      ARM: dts: BCM5301X: MR32: remove partition index numbers
      ARM: dts: BCM5301X: fix duplex-full => full-duplex

Krzysztof Kozlowski (1):
      ARM: dts: broadcom: add missing cache properties

Rafał Miłecki (18):
      ARM: dts: BCM5301X: Relicense Rafał's code to the GPL 2.0+ / MIT
      ARM: dts: BCM5301X: Relicense Florian's code to the GPL 2.0+ / MIT
      ARM: dts: BCM5301X: Drop "clock-names" from the SPI node
      ARM: dts: BCM5301X: Relicense Hauke's code to the GPL 2.0+ / MIT
      ARM: dts: BCM5301X: Relicense AXI interrupts code to the GPL 2.0+ / MIT
      ARM: dts: BCM5301X: Specify MAC addresses on Luxul devices
      dt-bindings: arm: bcm: unify version notation of Northstar devices
      ARM: dts: BCM5301X: Use updated device "compatible" strings
      ARM: dts: BCM5301X: Use updated "spi-gpio" binding properties
      dt-bindings: arm: bcm: Add bindings for Buffalo WZR-1166DHP(2)
      ARM: dts: BCM5301X: Drop invalid #usb-cells
      ARM: dts: BCM5301X: Drop invalid properties from Meraki MR32 keys
      ARM: dts: BCM5301X: Relicense Christian's code to the GPL 2.0+ / MIT
      ARM: dts: BCM5301X: Describe switch ports in the main DTS
      dt-bindings: net: wireless: brcm,bcm4329-fmac: add BCM4366 binding
      dt-bindings: net: wireless: brcm,bcm4329-fmac: allow generic properties
      ARM: dts: BCM5301X: Add Netgear R8000 WiFi regulator mappings
      ARM: dts: BCM5301X: Add cells sizes to PCIe nodes

Stanislav Jakubek (10):
      ARM: dts: bcm23550: Add SoC-specific I2C compatible
      ARM: dts: bcm-mobile: align SDHCI node name with bindings
      dt-bindings: soc: bcm: add missing dt-binding document for bcm23550-cdc
      ARM: dts: bcm-mobile: change "" includes to <> where applicable
      ARM: dts: bcm21664/23550: use CCU compatibles directly
      ARM: dts: bcm-mobile: move status properties to the end of nodes
      ARM: dts: bcm11351/21664: add UART, I2C node labels
      ARM: dts: bcm21664-garnet: use node labels
      dt-bindings: power: reset: bcm21664-resetmgr: convert to YAML
      dt-bindings: firmware: brcm,kona-smc: convert to YAML

 .../devicetree/bindings/arm/bcm/brcm,bcm4708.yaml  |  14 +-
 .../bindings/firmware/brcm,kona-smc.yaml           |  39 ++
 .../devicetree/bindings/misc/brcm,kona-smc.txt     |  15 -
 .../bindings/net/wireless/brcm,bcm4329-fmac.yaml   |   6 +-
 .../power/reset/brcm,bcm21664-resetmgr.txt         |  14 -
 .../power/reset/brcm,bcm21664-resetmgr.yaml        |  31 ++
 .../bindings/soc/bcm/brcm,bcm23550-cdc.yaml        |  35 ++
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/Makefile                         |  18 +
 arch/arm/boot/dts/bcm-ns.dtsi                      | 464 +++++++++++++++++++++
 arch/arm/boot/dts/bcm11351.dtsi                    |  35 +-
 arch/arm/boot/dts/bcm21664-garnet.dts              |  46 +-
 arch/arm/boot/dts/bcm21664.dtsi                    |  39 +-
 arch/arm/boot/dts/bcm23550.dtsi                    |  35 +-
 arch/arm/boot/dts/bcm28155-ap.dts                  |  12 +-
 .../dts/bcm4708-buffalo-wzr-1166dhp-common.dtsi    |  11 +-
 arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts  |   4 +-
 arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts       |  19 +-
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts       |  16 +-
 arch/arm/boot/dts/bcm4708-netgear-r6250.dts        |   9 +-
 arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts     |   2 +-
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts      |   7 -
 arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts |  11 +-
 arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts  |   4 +-
 arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts      |  18 +-
 arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts      |  20 +-
 arch/arm/boot/dts/bcm4709-netgear-r8000.dts        |  29 +-
 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts       |  17 +-
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      |  12 -
 arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts      |  12 -
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts    |  34 +-
 arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts      |  18 +-
 arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts      |  17 +-
 arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts      |  18 +-
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts      |  16 +-
 arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts      |  20 +-
 arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts   |  12 +-
 arch/arm/boot/dts/bcm47622.dtsi                    |   1 +
 arch/arm/boot/dts/bcm53015-meraki-mr26.dts         |   9 +-
 arch/arm/boot/dts/bcm53016-meraki-mr32.dts         |  17 +-
 arch/arm/boot/dts/bcm5301x.dtsi                    | 413 +-----------------
 arch/arm/boot/dts/bcm63148.dtsi                    |   1 +
 arch/arm/boot/dts/bcm63178.dtsi                    |   1 +
 arch/arm/boot/dts/bcm6756.dtsi                     |   1 +
 arch/arm/boot/dts/bcm6846.dtsi                     |   1 +
 arch/arm/boot/dts/bcm6855.dtsi                     |   1 +
 arch/arm/boot/dts/bcm6878.dtsi                     |   1 +
 47 files changed, 853 insertions(+), 723 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/brcm,kona-smc.yaml
 delete mode 100644 Documentation/devicetree/bindings/misc/brcm,kona-smc.txt
 delete mode 100644 Documentation/devicetree/bindings/power/reset/brcm,bcm21664-resetmgr.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/brcm,bcm21664-resetmgr.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm23550-cdc.yaml
 create mode 100644 arch/arm/boot/dts/bcm-ns.dtsi

--000000000000bbcbe605fe7bcde6
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
/D/YSkVckoN0L+QwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIPtC6QYFPgi3UNaY
VbqKR4x25YF0u6kkwgHWELwLABJ0MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTIzMDYxOTEzNDkyOVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZI
AWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEH
MAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAMnDz0bhrjq3dRgycOrIaNqZQ56JU2lk1c
/xBa9j4TNRuVj06TCWOLmiuqeV6auzDfJxXjtx0OKq55L5NHmLFMU1vE5j90Hgf6+ldotApXzEIw
Otki+FYavG7DQKzR1rzAvS2nVUII2dcpfrtyhCRO2RzGm1VyahLfwqEBM8ifO5q8a4ijC+9rlhvM
1iVCrC4uhHnCTzTO38a1/cItaNfrL8WnkGc9JZQpz9MsXaTMb9ISa1A37de0Psu9mnQJQopw4LhV
DlmlmduBZcQfQ/K4SZWxWYc/AZxAzyDBujYXC6jVLA2VNnsFEHcalKuFow4xQskzO779mCLbSpPR
GxaY
--000000000000bbcbe605fe7bcde6--
