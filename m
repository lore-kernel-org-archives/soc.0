Return-Path: <SRS0=jEOm=TS=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ED6C433FE
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 19:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7FC4CC340EF; Mon,  7 Mar 2022 19:48:24 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4F06C340EB;
	Mon,  7 Mar 2022 19:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4F06C340EB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id kx6-20020a17090b228600b001bf859159bfso168742pjb.1;
        Mon, 07 Mar 2022 11:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z9Q70QdsnVT6ShilnskVKKKIX5qhh4h7gTHyp443IC0=;
        b=ieTVTUuawbA4lvZE6XdI1PrLLtuc6E3/JgyPHNl11hkLZBnYxB4xcz6gvxM9Dalb6W
         kUrQ0HXz6q7BPiJeFsm1KBCY/ZCU2JE6VTAy2Hws2H3MSSYED05GKL7+my/LgtKrccwh
         fRkD3+06ZIqlSHKayKY1iDiz7LhgZP0cN+2xNssh4q/FchZbz1olGRtiMSVVtFNtEDKk
         R2ARA7TuwhcVv0stxu2QvfzSLRN5uK6yPWmXyUsHA0b8xqKYzwXjGm6oXC1KItHIRS8s
         F5tWCQrr7ecCpFj3b9NjNbL69xwUcpsU8kOv5iqWVlpWI7YCd3upG5hSmxkKmwyTmYwz
         6+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z9Q70QdsnVT6ShilnskVKKKIX5qhh4h7gTHyp443IC0=;
        b=vs0C9bBMzPyhgI0B7bPv8FBd/XK121tmzwKA6gvMMSg+ydYYhZmp37ttl+5WdilJih
         My0riauRp8XFltuXjFpic6JfNJj4gdc2CJ/p6dI6px2SHCimlEmJw13evg8gxeiheFMR
         XRbdS3K+jusBkOdv7BEXlmJw1bGEkQk3/x2cc28WwQF02eg3wb8+DrB01LpWP9SqFQP9
         SKv1SAJwimaR1s6svZDnw8VttEMom+0efmlxoho9Y/u5dyw4dfkVh/CFsLaqD+yjdHSo
         Ww7cyKTMBu898KLVZ7ki//61BdxyFjxoDBOyJJ1zZ66reZYOmYQ+q2Qx5TdEfNFVZnJ7
         kTmA==
X-Gm-Message-State: AOAM532KmtWoteBGfgY7OCFk128Yi6T4LUYKTTzf48aaomoVrK4FyzSs
	HEJUKG2+T2Wl4wcGsjXVfavulQWlh18=
X-Google-Smtp-Source: ABdhPJx5f6/RlZ9LPUZa3yLnjiBn29Pz6KMNHA8vWCBfCfviiOIDvB9xOvCuuhwqlF/FPNajTGraMQ==
X-Received: by 2002:a17:90b:1809:b0:1bf:7e9:bdf5 with SMTP id lw9-20020a17090b180900b001bf07e9bdf5mr661588pjb.52.1646682502874;
        Mon, 07 Mar 2022 11:48:22 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id s20-20020a056a00179400b004f709998d13sm4060092pfg.10.2022.03.07.11.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 11:48:22 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Matthew Hagan <mnhagan88@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Rob Herring <robh@kernel.org>,
	Richard Schleich <rs@noreya.tech>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/4] Broadcom devicetree changes for 5.18
Date: Mon,  7 Mar 2022 11:48:15 -0800
Message-Id: <20220307194817.3754107-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307194817.3754107-1-f.fainelli@gmail.com>
References: <20220307194817.3754107-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.18/devicetree

for you to fetch changes up to c8442f0fb09ca3d842b9b23d1d0650f649fd10f8:

  ARM: dts: BCM5301X: Add Ethernet MAC address to Luxul XWR-3150 (2022-02-28 13:28:32 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree changes
for 5.18, please pull the following:

- Arinc defines the switch ports of the RTL8365MB switch on the Asus
  RT-AC88U

- Richard provides cache information for the BCM2835/36/37 and BCM2711
  SoCs such that tools like "lscpu -C" can report it when supported

- Stefan adds support for the Raspberry Pi Zero 2 W (wireless)

- Matthew defines the MAC address NVMEM cells for the Cisco Meraki
  MX64/MX65 devices, he also fixes the LED for these platforms.

- Rafal adds the MAC addres NVMEM cell for the Luxul XWR-3150

----------------------------------------------------------------
Arınç ÜNAL (1):
      ARM: dts: BCM5301X: define RTL8365MB switch on Asus RT-AC88U

Matthew Hagan (2):
      ARM: dts: NSP: MX6X: get mac-address from eeprom
      ARM: dts: NSP: MX6X: correct LED function types

Rafał Miłecki (1):
      ARM: dts: BCM5301X: Add Ethernet MAC address to Luxul XWR-3150

Richard Schleich (3):
      ARM: dts: bcm2837: Add the missing L1/L2 cache information
      ARM: dts: bcm2711: Add the missing L1/L2 cache information
      ARM: dts: bcm2835/6: Add the missing L1/L2 cache information

Stefan Wahren (3):
      dt-bindings: arm: bcm2835: Add Raspberry Pi Zero 2 W
      ARM: dts: Add Raspberry Pi Zero 2 W
      arm64: dts: broadcom: Add reference to RPi Zero 2 W

 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/bcm2711.dtsi                     |  50 ++++++++
 arch/arm/boot/dts/bcm2835.dtsi                     |  17 +++
 arch/arm/boot/dts/bcm2836.dtsi                     |  50 ++++++++
 arch/arm/boot/dts/bcm2837-rpi-zero-2-w.dts         | 136 +++++++++++++++++++++
 arch/arm/boot/dts/bcm2837.dtsi                     |  49 ++++++++
 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts       |  76 ++++++++++++
 arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts   |   8 ++
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi      |   3 +-
 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi    |   3 +-
 .../arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi |  10 +-
 arch/arm64/boot/dts/broadcom/Makefile              |   3 +-
 .../boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts     |   2 +
 14 files changed, 403 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2837-rpi-zero-2-w.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts
