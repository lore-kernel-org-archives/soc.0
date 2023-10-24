Return-Path: <SRS0=rYmW=GG=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F644C25B48
	for <soc@archiver.kernel.org>; Tue, 24 Oct 2023 15:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0D2BC433CC; Tue, 24 Oct 2023 15:59:33 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B3D8C433C9
	for <soc@kernel.org>; Tue, 24 Oct 2023 15:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B3D8C433C9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6b1e46ca282so4585464b3a.2
        for <soc@kernel.org>; Tue, 24 Oct 2023 08:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1698163171; x=1698767971; darn=kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jJrSySweZavE6crw1OgQSY+G1BrAVOWcEO0tgr+71Yg=;
        b=cmgqHsWhzq6g+4G7Q/BQ84aL2G2ICPtIS93NudJ7fnYE39g23rJ6y8wotnNwXSAZjW
         y84CRTx+idfhxmGdrydz+aGBWvkBGmLJYkfaSdEtqa33n5V5YhCUAF18/ZWNHqbh8mvS
         AXMmgyCvuc3s5nNkcNh/XE8bcKfazXP8bjj+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698163171; x=1698767971;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJrSySweZavE6crw1OgQSY+G1BrAVOWcEO0tgr+71Yg=;
        b=kIVl2icJAzDNjAmkUQCb7GTZsWcchfP0n7S55kIwReb5YVnAdAIJ/AJuKAt9nhmrgf
         Ut/oSScflTRV0NQ8doUbScmG3aEFFPta8RIYhQleA3dpe3gbkl5XaDS+RsO4/vnMmHMF
         z9NKk2HSSdqCy36+PuWbmQByE+JqxdAxzSGk+R0+lM6FDmezggInroxFk4iyNZpjRH7g
         Y1qeWi1S5nKk53faHm464n3Um1h3BUgwL79lCahSXRMD4KuF4C2oplcD+LjqIOjbTEIK
         fdF0b7zKauKhWKB5jMola3g9GElRNTMH6iY0y0B+CQQNdbnSW/UdI0kQCoDNMi0ggtgP
         RRJQ==
X-Gm-Message-State: AOJu0YyzkAaWa2wo17IIwzu7kNchFBH5LuY7tNo/iMpC4EWJG0wlR9IX
	hSCIEV0nSPas/19VrDbopTAYJxWbAM4ggvlJoRorvbNSOsHJYxHFO666b/BjG8gTBUyL6du+B2k
	BSddZUfvkZIWBj/CWg6PuNUOyKDgUAE6E25ao/kE8Hy88B06S4CVmT6/SdSo5So8UaED3+CLsnc
	NNpg==
X-Google-Smtp-Source: AGHT+IF/mCPQnMTaflW8Wi0l5zOMMOWCKBURDvCFL/QbYP9ntV6uYnVLtIe8fXjB+dO6pg1osVKQVg==
X-Received: by 2002:a05:6a20:da88:b0:17e:2afd:407f with SMTP id iy8-20020a056a20da8800b0017e2afd407fmr4017906pzb.9.1698163171094;
        Tue, 24 Oct 2023 08:59:31 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id n5-20020aa79845000000b006bd67a7a7b3sm7790551pfq.68.2023.10.24.08.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 08:59:30 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Rani Hod <rani.hod@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vivek Unune <npcomplete13@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree changes for 6.7
Date: Tue, 24 Oct 2023 08:59:26 -0700
Message-Id: <20231024155927.977263-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000009d84de0608786cca"

--0000000000009d84de0608786cca
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.7/devicetree

for you to fetch changes up to 253358f373492608348136e569366d73cb969f6a:

  ARM: dts: BCM5301X: Set switch ports for Linksys EA9200 (2023-10-24 08:51:19 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs changes for 6.7,
please pull the following:

- Rafal makes a number of updates to the BCM5301X (Northstar) SoCs DTS
  to set MAC addresses for D-LInk DIR-885L, Asus, RT-AC87U, he
  relicenses parts of the DTSI to GPL 2.0+ / MIT, and finally fixes a
  number of Ethernet switch ports properties to enable/disable ports
  adequately.

----------------------------------------------------------------
Rafał Miłecki (7):
      ARM: dts: BCM5301X: Set MACs for D-Link DIR-885L
      ARM: dts: BCM5301X: Set MAC address for Asus RT-AC87U
      ARM: dts: BCM5301X: Relicense Felix's code to the GPL 2.0+ / MIT
      ARM: dts: BCM5301X: Relicense Vivek's code to the GPL 2.0+ / MIT
      ARM: dts: BCM5301X: Explicitly disable unused switch CPU ports
      ARM: dts: BCM5301X: Set fixed-link for extra Netgear R8000 CPU ports
      ARM: dts: BCM5301X: Set switch ports for Linksys EA9200

 arch/arm/boot/dts/broadcom/bcm-ns.dtsi             | 34 +++++++++++++++++++
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi        |  8 +++++
 .../boot/dts/broadcom/bcm4708-luxul-xap-1510.dts   |  8 +++++
 .../boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts   |  8 +++++
 .../boot/dts/broadcom/bcm4708-netgear-r6250.dts    |  8 +++++
 .../boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts  |  8 +++++
 .../dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts  |  8 +++++
 .../boot/dts/broadcom/bcm47081-luxul-xap-1410.dts  |  8 +++++
 .../boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts  |  8 +++++
 .../boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts    | 11 +++++++
 .../boot/dts/broadcom/bcm4709-linksys-ea9200.dts   | 38 ++++++++++++++++++++++
 .../boot/dts/broadcom/bcm4709-netgear-r8000.dts    | 18 ++++++++++
 .../boot/dts/broadcom/bcm47094-dlink-dir-885l.dts  | 24 ++++++++++++++
 .../boot/dts/broadcom/bcm47094-dlink-dir-890l.dts  |  8 +++++
 .../boot/dts/broadcom/bcm47094-luxul-abr-4500.dts  |  8 +++++
 .../boot/dts/broadcom/bcm47094-luxul-xap-1610.dts  |  8 +++++
 .../boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts  |  8 +++++
 .../boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts  |  8 +++++
 .../boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts  |  8 +++++
 .../dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts    |  8 +++++
 .../arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts |  8 +++++
 .../arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts |  8 +++++
 arch/arm/boot/dts/broadcom/bcm5301x.dtsi           | 34 -------------------
 arch/arm/boot/dts/broadcom/bcm953012er.dts         |  8 +++++
 24 files changed, 269 insertions(+), 34 deletions(-)

--0000000000009d84de0608786cca
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
/D/YSkVckoN0L+QwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIJOPF2EHzA2Iwmcc
m49H19Y7JaRShWJSMVeNCBQCA238MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTIzMTAyNDE1NTkzMVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZI
AWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEH
MAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCajcFlw/ETwwHTFgA18pPzrkDXR66iCOmf
Zefd2iY4j4XJSgIGzNcAqaBDMUNd+0mr/4hOWrqC+Jd12gfCT38OrqBWrrjf1ylLwbIHuaqSU/N4
rf4f53uTw9YZ1+++ziu8VWh49PKEpKe56qUQMx8pREZBm/emuZdu2gc5LNqTDwFRsj5gAZKg+aFh
Z6yP9XhvS5GUdETURv/oju5VMAzNbf+KVRjk9R8R2GmfuG0AsDvCenBgGGiFnSZWtLCr+Y9SPfOx
uCkj5vaPXZ4OpfMGQQUVNb2Zchw/9PbYux8iFlWtboZFf2/q/4LKVwky7iuOmtoR8y8yE448tniu
DLtd
--0000000000009d84de0608786cca--
