Return-Path: <SRS0=wsnO=LT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20460C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 10:32:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4C2D6141F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 10:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4C2D6141F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1x5vnYV6bgPXZHTnYu0/Af3n8juhanJbsC6HilDt/WY=; b=FSIEcgz5qPkv4e
	boBfTQrVsLO7xOcEvaV33YLiOGPEJ6565De8i/yWUnkvIt/LhZWRRx6kps2cT8NAW+S9s0M4cpTjH
	F1GUsri8xY2wcqC5Zd3IJtUm4wjq20Ww1riXws3AWKWdgU3Oc7K2TGP3j7IM24P0vteoWdOs+beki
	nWx8uwFcIP/MrPJFn6HHPrBU6J6FRBm2o/1hVOgRJQ3xk/k0cHNfX1n3yqUcaMr6gv4s6IqcCbYQt
	t7hFihqt7KzcYezlOlA/10g2EQ1Y2OPAziJxo75uu1ERP3i2rYETSAOWwzjL7+8dXmRc+MKSuIwoy
	xrTkTlp+J8x2QDJyu+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwj6N-000yQL-Kv; Fri, 25 Jun 2021 10:30:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwiTf-000li1-F7
 for linux-arm-kernel@lists.infradead.org; Fri, 25 Jun 2021 09:50:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id w13so5858766wmc.3
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 25 Jun 2021 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tk63MWA3f9dFxhlNMaBiHIPiARPvGls3NNYaj8uPzuo=;
 b=W617F5MNj8GzYcPPuxkiY6uO+pbEmBbGYxhQf2nmY2tGJ+1gJfy13cq1CmZ5veTYRP
 0GoljXHBBkVbQQIQhK0+WEIYQnu2R/VFndkoh2FNbY+R3hkq0GYD1DMKNUiMIoRspDl2
 UrcCgmu4K2qFvxULsTAiM/2jT7eWjWJFSa+vq//9HpSfgsOTS85VcsPBvdp/qYwYhx63
 ulXN86huebx6FKiMUKlTsQiHAyRISYYzzOw2ovBSHo7pd2wTU8Y3BjkpJYl5goWAVmSY
 O0zJqEFgkxMc6/Vzkfmq8dl4ITOme8NYNDPWAetORFclbvAZXYIIGjxbs4WOPNSPMe8d
 NSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tk63MWA3f9dFxhlNMaBiHIPiARPvGls3NNYaj8uPzuo=;
 b=WbsHZWSHGgjsd0LvdizU25Eya5g0NtWfgEOEpQ9/fRDIVURGRRtnOEA5tQqqB77+oY
 2Ma/XiRIfpa971QrYYd3H7N16YptOj7GITnIhFqLgEh/JpYSFFsOHTWGu8W+azyR0/Js
 QRUPFZGsugRHWyUSthlnOx7kLIavbQXleybtmfgXQFGq9JEg1KuUmyzYjbiZiYitwZYL
 LiPC7OSURn20Uan0/kBENSVh6yvFIxo1Dv1UTRG5STz9QbKfKcD9Q2/ZaVsdFwa6VUBL
 6miiJszVcObU7qejEAg8hYdTBMqJtkfSjqDvKKxHr8vmfReWAFRwPc1aKF8io3d1AtHi
 x9Ow==
X-Gm-Message-State: AOAM532UkSA8omKvC7NTUUihLGcVUbFJ0ELB8xgrgV5hBtO3Y/ITUJ4N
 +FhhfspR3xbtLiI+qKOaSWKNddSX1io=
X-Google-Smtp-Source: ABdhPJzyh7ak7zZsEwpmdhaabinEz/GJVtk55QFnkR2sDdlizSiL5ByTNHy2rcUkfIhnc35D3MHWcA==
X-Received: by 2002:a1c:a597:: with SMTP id o145mr9500498wme.53.1624614621082; 
 Fri, 25 Jun 2021 02:50:21 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id q19sm10803405wmc.44.2021.06.25.02.50.20
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Fri, 25 Jun 2021 02:50:20 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Matthew Hagan <mnhagan88@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sam Ravnborg <sam@ravnborg.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/4] ARM: dts: NSP: add Meraki MX64/MX65 series
Date: Fri, 25 Jun 2021 10:49:47 +0100
Message-ID: <20210625095000.3358973-1-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_025023_613073_4949F673 
X-CRM114-Status: GOOD (  13.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210625094947.el5w-tzSsAvmoJHtYsUEI-SLkqdKXVRTQKnMSzpxfbQ@z>

Changes from v2:
 - Introduce boards to Makefile in same patch as the board dts is added
   (Vladimir Oltean)
 - Use alphabetical ordering for labels (Vladimir Oltean)
 - Remove address-cells and size-cells in qca8337 switch nodes (Vladimir
   Oltean)
 - Remove "cpu" labels from switch nodes' CPU ports (Vladimir Oltean)
 - Various LED fixes, utilising dt-bindings/leds/common.h and correctly
   specifying LEDs in the form "led-N" and with the color/function/
   function-enumerator properties.
 - Fix PWM LEDs and corresponding pinctrl bindings. (Vladimir Oltean)

The following changes were submitted as a separate series:
 - Introduce patches to disable QSPI by default and enable where used
   (Vladimir Oltean)
 - Move mdio@18032000 node from board related file to SoC (Vladimir
   Oltean)
 - In addition to above, relocate mdio-mux to bcm-nsp.dtsi and fix
   the resulting usb3_phy issues

Changes from v3:
 - Sort labels on mx64 a0 dts files into alphabetical order as well
 - move include directives for input/input.h and leds/common.h to
   bcm958625-mx6x-common.dtsi
 - Whitespace fixes in bcm958625-mx6x-common.dtsi
 - rename "senao_nvram" partition to "nvram"

Matthew Hagan (4):
  ARM: dts: NSP: Add common bindings for MX64/MX65
  ARM: dts: NSP: Add DT files for Meraki MX64 series
  ARM: dts: NSP: Add DT files for Meraki MX65 series
  dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65

 .../devicetree/bindings/arm/bcm/brcm,nsp.yaml |   6 +
 arch/arm/boot/dts/Makefile                    |   6 +
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi | 279 ++++++++++++++++++
 .../boot/dts/bcm958625-meraki-kingpin.dtsi    | 163 ++++++++++
 .../arm/boot/dts/bcm958625-meraki-mx64-a0.dts |  45 +++
 arch/arm/boot/dts/bcm958625-meraki-mx64.dts   |  15 +
 .../boot/dts/bcm958625-meraki-mx64w-a0.dts    |  55 ++++
 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts  |  23 ++
 arch/arm/boot/dts/bcm958625-meraki-mx65.dts   |  15 +
 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts  |  23 ++
 .../dts/bcm958625-meraki-mx6x-common.dtsi     | 143 +++++++++
 11 files changed, 773 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi

-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
