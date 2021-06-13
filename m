Return-Path: <SRS0=VOD1=LH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313D0C48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 10:20:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED17C61261
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 10:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED17C61261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZPh6rNQbyIpU2SiR1mW08nbaXSVk9oVxqg0/cUasqEA=; b=h3QT7hzt30DfXW
	28bdKGhFe6wRMScEWoIL93VdvT/BjW1MnXnPlECzno6+5mimkjFDMxFYB0YDnobk/1dqmx6k0hvYt
	tVXMB8mNRUtrJBlpSJmDQEa0nsy1FsiAkvx+qMSRo9Cra1G3f3UzytCWPJdK7M253SmoQxSczWpx8
	U6tOghVrgk/XJnGbOaYNNPsKp+/9LLNCYQff1e28O0emvyEUOgu+OQLWx41Jdr523IzBy5ejk/qju
	OpxxMNuSLTLeDb0gy8QtEFPbbVqYw+E1qiLVNzbUFJaWzbVZyzRl5GR2vvE0ehKh/SQx0GVR5gVdw
	KzTJq59u31Va3/53ktWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsNCf-00ACBA-Ib; Sun, 13 Jun 2021 10:18:53 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsNCb-00AC9k-Ib
 for linux-arm-kernel@lists.infradead.org; Sun, 13 Jun 2021 10:18:50 +0000
Received: by mail-wr1-f42.google.com with SMTP id m18so11018929wrv.2
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 13 Jun 2021 03:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xdbyjhZ0Rh8uIQkMpi2ZIF52kY6qMW2ZB38/qlzn2jw=;
 b=o3yRtZnk+S2NzLuXlfrmCs1lGEPwEur38evNNxrA4TTchT+vxykB4VV/YLevQeBamH
 XvsxFYC6lsPlCLXwOAcHrqvpanA7Md4STGu89+iN8x/E+RMDIOE3BHYb96mDW+jgP62P
 WVXVd71PUNitenxaf0NJUZg1mHdULf7LKp0VkO3oS/8cbqagKM156G4JqJBy9Vro2C/D
 XnNAMhoqRwSPNDoEjuG2eNuztt6EskaooYryyOJLm6DG8sz7yiG90lTaUc4ghDcNZn6c
 Uausm7XecBN/YwPAoXJJd3cThm1ZPCGqFUXq089/5wRnUS/mO8WhDeQow+Ar25l6fXbr
 feeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xdbyjhZ0Rh8uIQkMpi2ZIF52kY6qMW2ZB38/qlzn2jw=;
 b=HoXECBT3G0Y0ptqrZoptmqcODITWmjJSUrchBBm8BiB292IpN+DlruHEIK4Ykc3bRn
 A9BI7lQsk91qZEnSOdjoxwaT5aJkO1V/UfZJqnBhuZBnj7J6013GhK02quhGiUq9Kq1o
 FaG/f2UO1k987VApg3oFeN1N5U1BSEvsXIo9z8qO5S/VMupYFakaT3G2bt7kbzeSHp+O
 SBlKrBWacWHRXF+HrmZxz0AwcQZcpTfYV3Oj22H+JUMDLnkmEn0RE/8pjHHYv+IPd0SC
 J0uj4xejvgQFyCUiAwsmz+EJw9qF0y3gvdYqnIER83D40DULHjojAUNPTOQ/1OcXXKPx
 +Gmg==
X-Gm-Message-State: AOAM532jHz2kROJqAUZGIOE7N6wVTdttW6XPJajaGArCZgi13MYT+Xh4
 pX2kJsBTZqUlV2BAkH/gMHrsWalLV9w=
X-Google-Smtp-Source: ABdhPJwp6ECOCLQMCVIdG6nhHH7oJPlKEBP/BcvCeDYzHEIJt9KXR74W+fJjAJb34Wwr8whFJwYBxA==
X-Received: by 2002:a5d:4538:: with SMTP id j24mr13170776wra.391.1623579467888; 
 Sun, 13 Jun 2021 03:17:47 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id n18sm11599397wmq.41.2021.06.13.03.17.47
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sun, 13 Jun 2021 03:17:47 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Matthew Hagan <mnhagan88@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] ARM: dts: NSP: add Meraki MX64/MX65 series
Date: Sun, 13 Jun 2021 11:16:44 +0100
Message-ID: <20210613101658.3242777-1-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_031849_641267_3A0DED24 
X-CRM114-Status: GOOD (  13.43  )
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
Message-ID: <20210613101644.QPTClVT54My4J7sMwvlhZ1cWTcrVfrFL72dtyKotctU@z>

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

The following changes have been broken out into a separate series:
 - Introduce patches to disable QSPI & SP804 CCBtimers by default then
   enable where used (Vladimir Oltean)
 - Move mdio@18032000 node from board related file SoC (Vladimir Oltean)
 - In addition to above, relocate mdio-mux to bcm-nsp.dtsi and fix
   the resulting usb3_phy issues


Matthew Hagan (4):
  ARM: dts: NSP: Add common bindings for MX64/MX65
  ARM: dts: NSP: Add DT files for Meraki MX64 series
  ARM: dts: NSP: Add DT files for Meraki MX65 series
  dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65

 .../devicetree/bindings/arm/bcm/brcm,nsp.yaml |   6 +
 arch/arm/boot/dts/Makefile                    |   6 +
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi | 281 ++++++++++++++++++
 .../boot/dts/bcm958625-meraki-kingpin.dtsi    | 165 ++++++++++
 .../arm/boot/dts/bcm958625-meraki-mx64-a0.dts |  45 +++
 arch/arm/boot/dts/bcm958625-meraki-mx64.dts   |  15 +
 .../boot/dts/bcm958625-meraki-mx64w-a0.dts    |  55 ++++
 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts  |  23 ++
 arch/arm/boot/dts/bcm958625-meraki-mx65.dts   |  15 +
 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts  |  23 ++
 .../dts/bcm958625-meraki-mx6x-common.dtsi     | 145 +++++++++
 11 files changed, 779 insertions(+)
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
