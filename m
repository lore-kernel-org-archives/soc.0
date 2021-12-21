Return-Path: <SRS0=MANq=RG=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548F5C433EF
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 22:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3BA55C36AE9; Tue, 21 Dec 2021 22:06:50 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60926C36AE8;
	Tue, 21 Dec 2021 22:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60926C36AE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id jw3so475002pjb.4;
        Tue, 21 Dec 2021 14:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b46pIZgeRjemn9cXAcyA7BsNIHFDAghD1Ibtg5lvvsI=;
        b=SGAV3wlpelYomOGOYkZLwwGGZHvxvPG7O9W5GeUzXe1ckFlo2K+mTS1L7uQZ138Qy2
         z5mwPXJSavFFIptiTZkrFE3u7G84VH5eD4iHNcJmfKA2FskgSIVafbc/ay24NOVqbEnr
         2jgdkKcgxqYiCDYLOHn2kxdyXwSXcj8aQ4NwY2tHc16QYjsxKlljerv+qQOlnnQ95MP7
         z1c+J9rrwutS9j6jY3rL+UbnYBB2Q56RYgyUvJxMeUxfBuJJrem+YJRJcO7bWj3BHNoo
         Ze6SqFJSNatCu+koA1AjSOhkHGS0Qdo2X1jLEEUsEYCP42sMATNgER5TLcwEscN0tUkt
         8KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b46pIZgeRjemn9cXAcyA7BsNIHFDAghD1Ibtg5lvvsI=;
        b=56jp5vUn9GOhF9rHP78qQnRAlwlHKUoOpU4yim0+Mx2rUnkcNC3Y+Bh1Qg2fEI9eRl
         NQngJuG4phWOKXfJs6CKHfI9KTKKVJC9P8LCPA4Z783ztKVIwPUJa6bZV3gsXFpaQBrI
         IXIrxAaOXEUrYmCN+ehrh2ETBssevUKYImOyA2qGGp1kpeubCbdj+lVvHg7hfjeSNc+T
         MuPEurMGU4cppiDTAzNzv7/YYbjPeGLydhy9XPOD+W3n8MErEja0xQcMBzDf4N7+GO0W
         lHpa7VW37SNjcRW+sErlyCxMdmHCgbkjkDU3JoiMx0gjv2zCgkL9pXJZLpio/XjWl4z+
         cszQ==
X-Gm-Message-State: AOAM530IAUucH3yxst+bBwA36HtVBhEbSZz1JL/co5efGF7nX1vZySHx
	baz2U1mNuIWr5/QdxGqgaFFLydueeMs=
X-Google-Smtp-Source: ABdhPJwqijVRlEgEMwK+bRM5IM5Hs45WyRcMDEn4ZRXbai0PzjpVQQnnBVW7SEVTimUE+536ye33Aw==
X-Received: by 2002:a17:902:9343:b0:148:a2e8:2c49 with SMTP id g3-20020a170902934300b00148a2e82c49mr122904plp.152.1640124408377;
        Tue, 21 Dec 2021 14:06:48 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id q190sm70342pgq.38.2021.12.21.14.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 14:06:47 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Christian Lamparter <chunkeey@gmail.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Matthew Hagan <mnhagan88@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/6] Broadcom devicetree changes for 5.17
Date: Tue, 21 Dec 2021 14:06:39 -0800
Message-Id: <20211221220642.2862218-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221220642.2862218-1-f.fainelli@gmail.com>
References: <20211221220642.2862218-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.17/devicetree

for you to fetch changes up to 5e33f1c4a7cb914a003a304ab8eef705b17aabb7:

  ARM: dts: BCM5301X: correct RX delay and enable flow control on Asus RT-AC88U (2021-12-19 11:38:04 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SocS Device Tree changes
for v5.17, please pull the following:

- Matthew enables the QCA8337 switch of the Merak MX65 to have the
appropriate PLL properties for it to be enabled and set the SGMII
transmit clock to falling edge.

- Arinc removes unnecessary properties of the GPIO keyboard Device Tree
node, adds the external Realtek RTM8365MB switch on the Ausus RT-AC88U,
including fixing the RX delay on the Realtek switch side and enabling
flow control on the Broadcom internal switch port connecting to the
Realtek switch.

- Christian updates the Meraki MR32 Device Tree node to make use of the
hardware I2C controller instead of bitbanging

- Rafal updates the BCM5310X Device Tree files to have the CRU node not
generate warnings, updates the USB 2.0 PHY to use the non-deprecated
binding

- Uwe adds GPIO offset to the gpio names properties for readability

- Stefan updates the BCM2835 VCHIQ Device Tree binding to YAML

- Florian fixes the iProc PCIe Device Tree nodes in Cygnus, Hurricane 2
and Northstar Plus to be compliant with the iProc PCIe YAML binding
(merged in RobH's tree) as well as the SATA controller node unit name.

----------------------------------------------------------------
Arınç ÜNAL (3):
      ARM: dts: BCM5301X: remove unnecessary address & size cells from Asus RT-AC88U
      ARM: dts: BCM5301X: define RTL8365MB switch on Asus RT-AC88U
      ARM: dts: BCM5301X: correct RX delay and enable flow control on Asus RT-AC88U

Christian Lamparter (1):
      ARM: BCM53016: MR32: convert to Broadcom iProc I2C Driver

Florian Fainelli (7):
      Merge tag 'tags/bcm2835-dt-next-2021-12-13' into devicetree/next
      ARM: dts: Cygnus: Fixed iProc PCIe controller properties
      ARM: dts: Cygnus: Update PCIe PHY node unit name(s)
      ARM: dts: HR2: Fixed iProc PCIe MSI sub-node
      ARM: dts: NSP: Fixed iProc PCIe MSI sub-node
      ARM: dts: NSP: Rename SATA unit name
      Merge tag 'tags/bcm2835-bindings-2021-12-18' into devicetree/next

Matthew Hagan (1):
      ARM: dts: NSP: MX65: add qca8k falling-edge, PLL properties

Rafał Miłecki (2):
      ARM: dts: BCM5301X: update CRU block description
      ARM: dts: BCM5301X: use non-deprecated USB 2.0 PHY binding

Stefan Wahren (1):
      dt-bindings: soc: bcm: Convert brcm,bcm2835-vchiq to json-schema

Uwe Kleine-König (1):
      ARM: dts: bcm2711-rpi-4-b: Add gpio offsets to line name array

 .../bindings/soc/bcm/brcm,bcm2835-vchiq.txt        | 17 -----
 .../bindings/soc/bcm/brcm,bcm2835-vchiq.yaml       | 53 ++++++++++++++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  | 18 ++---
 arch/arm/boot/dts/bcm-hr2.dtsi                     |  4 +-
 arch/arm/boot/dts/bcm-nsp.dtsi                     |  8 +--
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              | 28 ++++----
 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts       | 80 +++++++++++++++++++++-
 arch/arm/boot/dts/bcm53016-meraki-mr32.dts         | 62 ++++++++---------
 arch/arm/boot/dts/bcm5301x.dtsi                    | 31 +++++----
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi      |  4 ++
 10 files changed, 210 insertions(+), 95 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
 create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
