Return-Path: <SRS0=Szqg=LA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C90C47096
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:19:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2588D608FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2588D608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bxKPHQfMITiNzf3bw7WWxIywuMpbqQgSSXe0KPezOZI=; b=4d2OxbBFcyapBd
	RxBjXa22R3rUqTX3myeRlnPQ2i6QR7amW9ZYJ6QUK4vuwxxW75FA25nX6QFelKeRhU5xeXJac9CXm
	NF8owXU1lM76IaVFSM2eZkPpGFLuC918WoYrAvlp2GDADxky/dDYtPrAPGGhI8x07unFhVmQCIeac
	jQtOYfeGZ6dHROnQsfx1g14BHIgnqp7cjyHLjGgcfK+5koQN1ly8AHZfRpWh5GLn0Z9VIBemH5gZV
	d3P3et5vun3mcK/0/UZKxf/4ylxY/B5IcRjfjplCyBmKVwoMiNj+QJ13nWN4O6SMq95maphPInkr1
	fAfqngXUqEeDswr9zDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lprid-000E86-GY; Sun, 06 Jun 2021 12:17:31 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpri1-000Dze-Mp; Sun, 06 Jun 2021 12:16:56 +0000
Received: from localhost.localdomain ([37.4.249.157]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MRTIx-1m2HvI0993-00NSMz; Sun, 06 Jun 2021 14:16:33 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 0/7] ARM: dts: Add Raspberry Pi 400 support
Date: Sun,  6 Jun 2021 14:16:10 +0200
Message-ID: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:cKdZAghuMN9u/MoXRONPhzTKOrn/mHEJNZp99Sxo8X78wXXiy6M
 tj7C3B3SeODAb/YZPhIv5eUGOIYbpEPWjmCqhS7HCmEhqYEr1gwB1A0VB304wDVTcgKs9mi
 n6Ldmd2vzgDV3U919Z3dgMok3snEs1Cbm+yji1DmRSohmcAKUu8px3k5mOa/0hYdA2T8JFZ
 DO9ssTRMA+pWHjWgWvy3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XRWkM5WYsaM=:+jSITSSqJUfariSKqZ7TNf
 aAI40weEZwnI1Pv/N4g4xBKBa6PxYU4H6o2WcGjKYWJ/CYr4IQGQeDWEbNBTj/Pf3gWv48ECS
 q9NLGyc8gJPThw2OFFh/KgAoyPHCZCxMaZEgfTpzvcck7djL6WLXaxiZyM1cJKRwUAAvQNVOq
 AwjzVIqXq/jKwHjAJN9uG1WhcIrvBSnOz8JonTTh5/t82ksTEpSE2Hksnk7RNxVqw4eDWVZqh
 RlCBOo8ZnRoPdDPf1BBp+U8DZF0LZeYfjWrmfq5WMbYb5GAfj/fIQL5OzHgHldCKJPC1j9yET
 jvX7GDapqmFQgzGdPhietSn/MQLnA2UI8H2ym8wu+ytBHDLoAcwVGZtHTtaLdysY95syb4RLF
 Q/GnphLqrlAULv14R9izCXdaQk65i72UVXgGy4C4gPO/Y9zBUpxjmU+VqmzFR05Bn4HQeOQv7
 K29X5y5XiU8WLXqbXZMMqpxCAuwvulst+pQOq7oX/YhUIFp02hvztLD+TlxDVPTLWw6KBSaUZ
 zIKrEdDrmH1IwFA0C27B9U=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_051654_057753_A63C4C34 
X-CRM114-Status: GOOD (  12.28  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210606121610.2PwGsdW6Jnf9ZG0-KqsG4u3VknqEmL3K6CiLSWyCLSY@z>

This series adds support for the Raspberry Pi 400.

Changes in V2:
- add collected Reviewed-by and Acked-by
- add memory node, ethernet alias and gpio expander to bcm2711-rpi.dtsi
- drop PCIe USB reset control from bcm2711-rpi.dtsi
- add patch to fixup LED node names
- include RPi 4 B dts into RPi 400 dts

Stefan Wahren (7):
  ARM: dts: bcm283x: Fix up MMC node names
  watchdog: bcm2835_wdt: consider system-power-controller property
  ARM: dts: Move BCM2711 RPi specific into separate dtsi
  dt-bindings: arm: bcm2835: Add Raspberry Pi 400 to DT schema
  ARM: dts: bcm283x: Fix up GPIO LED node names
  ARM: dts: Add Raspberry Pi 400 support
  arm64: dts: broadcom: Add reference to RPi 400

 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |  1 +
 arch/arm/boot/dts/Makefile                         |  1 +
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              | 85 +++-------------------
 arch/arm/boot/dts/bcm2711-rpi-400.dts              | 45 ++++++++++++
 arch/arm/boot/dts/bcm2711-rpi.dtsi                 | 74 +++++++++++++++++++
 arch/arm/boot/dts/bcm2711.dtsi                     |  2 +-
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts           |  4 +-
 arch/arm/boot/dts/bcm2835-rpi-a.dts                |  2 +-
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts           |  4 +-
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts           |  2 +-
 arch/arm/boot/dts/bcm2835-rpi-b.dts                |  2 +-
 arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi             |  2 +-
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts           |  2 +-
 arch/arm/boot/dts/bcm2835-rpi-zero.dts             |  2 +-
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |  2 +-
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts              |  4 +-
 arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts         |  4 +-
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts         |  4 +-
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts              |  2 +-
 arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi             |  2 +-
 arch/arm/boot/dts/bcm283x.dtsi                     |  2 +-
 arch/arm64/boot/dts/broadcom/Makefile              |  3 +-
 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts   |  2 +
 drivers/watchdog/bcm2835_wdt.c                     | 10 ++-
 24 files changed, 165 insertions(+), 98 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-400.dts
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts

-- 
2.7.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
