Return-Path: <SRS0=ut6J=UV=broadcom.com=william.zhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D44C4167D
	for <soc@archiver.kernel.org>; Mon, 11 Apr 2022 17:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03DDAC385A4; Mon, 11 Apr 2022 17:28:38 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4315C385A3
	for <soc@kernel.org>; Mon, 11 Apr 2022 17:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4315C385A3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pj1-f42.google.com with SMTP id md4so7625484pjb.4
        for <soc@kernel.org>; Mon, 11 Apr 2022 10:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=f94ZpZTXbaynGhPuUs4wV3cTL/H0rR6uzktXMA7iCPY=;
        b=dzSpwcKcBKm4zo424xKK7pZ9deslvQuipIW5OurglO0g1jBqel+r0+fPlmwX7ZMmHN
         BLOCqTeE8ylLNct7qoQdMRH2/mn9n+JVolSqoM542x293HWb8o346KLcVe0mY+OchBA3
         SXd6XQHs61k1eta2U3RZUW0klBWahr8Eid7aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=f94ZpZTXbaynGhPuUs4wV3cTL/H0rR6uzktXMA7iCPY=;
        b=mHzPlBfxj58b6ufCO1k6pW/LwDYla7iyg3qcX6kazFow+piLqciigV2GD/QQ95VHwv
         misuUt2HLVVUAtofDrrbx+JsNapeHLmcDyWHzkFLI62B5HmXFAaG7foqZv4Fakmf0D+I
         pRLLAncj6v9BslkWSRBZxzjePxlvQvAq92ym9w29OWJVcB5DyAhwCS+vq7BeC7+cDDl7
         adgtcI6kOwnoglJ5JPp7jMf3zSKPYVbonCmRVRDbsOhLqUWzAf4iiM0UHky8Ai7YCWKz
         q8euaVQopBiZS9DMqEnzQ55xtLEmJiXn+B05ggGlKS7undxSar6n3Ohs6bkngVU0aQun
         r8sg==
X-Gm-Message-State: AOAM533i9ftFHDITmTDl9sbXK5VL4wKeb7uISBLkdtGv3aD5zIfIGjjr
	kFtIBdqecW+foqMKe8FA9Qppbw==
X-Google-Smtp-Source: ABdhPJw+cS5yiIumBnP2StvtBsdl7lJZI7McBC2FaKkWPK1EgWDbQw8d0/bF9Xp1MaNWtxPfuwpiqQ==
X-Received: by 2002:a17:902:a9c2:b0:156:1859:2d05 with SMTP id b2-20020a170902a9c200b0015618592d05mr34156420plr.86.1649698116205;
        Mon, 11 Apr 2022 10:28:36 -0700 (PDT)
Received: from T3500-3.dhcp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d23-20020a17090a02d700b001bf6ef9daafsm85428pjd.38.2022.04.11.10.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 10:28:34 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
To: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
List-Id: <soc.lore.kernel.org>
Cc: Samyon Furman <samyon.furman@broadcom.com>,
	Joel Peshkin <joel.peshkin@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dan Beygelman <dan.beygelman@broadcom.com>,
	Tomer Yacoby <tomer.yacoby@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	William Zhang <william.zhang@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Ray Jui <rjui@broadcom.com>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Scott Branden <sbranden@broadcom.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Thierry Reding <treding@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: [PATCH 0/5] arm: bcmbca: introduce the bcmbca architecture and 47622 SOC
Date: Mon, 11 Apr 2022 10:28:10 -0700
Message-Id: <20220411172815.20916-1-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.17.1
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000003a3b7005dc6446ff"

--0000000000003a3b7005dc6446ff

This change introduces Broadcom's ARCH_BCMBCA architecture for
armv7 and armv8 based Broadband SoCs. We expect to send additional
patches for each SoC in the near future.

The first SoC supported in this arch is Broadcom's ARM A7 based 47622
SOC. The initial support includes a bare-bone dts for quad core ARM A7
with a ARM PL011 uart. Linux kernel image can be built with
multi_v7_defconfig.


William Zhang (5):
  dt-bindings: arm: add bcmbca device tree binding document
  arm: bcmbca: add arch bcmbca machine entry
  ARM: dts: add dts files for bcmbca soc 47622
  MAINTAINERS: update MAINTAINERS file
  ARM: multi_v7_defconfig: enable CONFIG_ARCH_BCMBCA in armv7 defconfig

 .../bindings/arm/bcm/brcm,bcmbca.yaml         |  33 +++++
 MAINTAINERS                                   |  14 ++
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/bcm47622.dtsi               | 126 ++++++++++++++++++
 arch/arm/boot/dts/bcm947622.dts               |  30 +++++
 arch/arm/configs/multi_v7_defconfig           |   1 +
 arch/arm/mach-bcm/Kconfig                     |  12 ++
 7 files changed, 218 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,bcmbca.yaml
 create mode 100644 arch/arm/boot/dts/bcm47622.dtsi
 create mode 100644 arch/arm/boot/dts/bcm947622.dts

-- 
2.17.1


--0000000000003a3b7005dc6446ff
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
TltlrAeBKRJ1M9O/DY5v7L1Yrs//7XIRg/d2ZPAOSGBQzFYjYTFWwNBiR1s1zP0m2y56DPbS5gwj
fqAN/I4PJHIvTh3zUgHXNKadYoYRiPHXfaTWO9UhzysOpQIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUohM5GmNlGWe5wpzDxzIy
+EgzbRswDQYJKoZIhvcNAQELBQADggEBACKu9JSQAYTlmC+JTniO/C/UcXGonATI/muBjWTxtkHc
abZtz0uwzzrRrpV+mbHLGVFFeRbXSLvcEzqHp8VomXifEZlfsE9LajSehzaqhd+np+tmUPz1RlI/
ibZ7vW+1VF18lfoL+wHs2H0fsG6JfoqZldEWYXASXnUrs0iTLgXxvwaQj69cSMuzfFm1X5kWqWCP
W0KkR8025J0L5L4yXfkSO6psD/k4VcTsMJHLN4RfMuaXIT6EM0cNO6h3GypyTuPf1N1X+F6WQPKb
1u+rvdML63P9fX7e7mwwGt5klRnf8aK2VU7mIdYCcrFHaKDTW3fkG6kIgrE1wWSgiZYL400xggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgw28eX6TfvsbNfu
SIMwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIPAYAzkGeIIJBopNzUcS9gKDZ3N0
2z7sx2zAoXOkyP6HMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIy
MDQxMTE3MjgzNlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQDE7+OvCeEl3t0EmuDg4ULQmldSCKxBjSNWeeLQoxcUcpg9
BpZHf1hPXsi/xpaaBX3DUCNuJEgjGBDhU7VMV1/rPxwhokshUuV6WTgYGIZ5N+QubyoBhAnCAA/z
xA1dnieB4W/mCbHgSI7aDQYwGimaAXSTVwYNIzQZl13xZQx8T0kWvEuxYkUGBUr0r/3cDQPmZwfy
Fst+d6SmzNX8fSyn0CHUGv6+p8hnFafUtW7vfGYBZfFHNBp+VWkVT7xOSez5fxFy5BctrRk3UDBR
0hHpBG+BDbQnaob+lvMbTPAsc7ebac3XgcWHwGE3XK7DX3ravL93Dh4+cP4KpOpk400R
--0000000000003a3b7005dc6446ff--
