Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADD9C48BC2
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Jun 2021 09:50:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6BA86141A
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Jun 2021 09:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhFYJwn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Jun 2021 05:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhFYJwn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Jun 2021 05:52:43 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E9AC061574;
        Fri, 25 Jun 2021 02:50:22 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id r3so1330443wmq.1;
        Fri, 25 Jun 2021 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
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
        b=FkfDucnpe11RD5iQhmkl5uVOHCvxkq7OGP8VF18nqvEKC8gjf5sGhwejUPbwoxfU4e
         mj1r5Wak33t+3QTcexhH5T7iu1NFb7L+CtiZ83B4tt+RrjBfI6ev2NgKO0cNpldO4hq1
         DiscU6jNiWYTa2ng+I3xF2TL2VCiIcqYOdKX8nyw1ieDvtuFNLT/3WlfhjhXVqEA6R/b
         tI9V6ZuXcIhMpiQXBnAqJ+RHlWQ02wmGU5FMpLqzPTuOGxJUc2sl/epV43mYHi4hZJ9x
         DIQGvfVW2d14bfhkxPihUolTQ3MZK+Kv2jJ3DMQoegA+0r4CriTZdZmN30zSOs1VpY8Z
         A+7Q==
X-Gm-Message-State: AOAM530A1xoxkSMKoySvzJr9UpFa/OoCcEeAz+i1mUnPD81oeezKvCFh
        W+SW5MKnvX+itksXqtfl2rU=
X-Google-Smtp-Source: ABdhPJzyh7ak7zZsEwpmdhaabinEz/GJVtk55QFnkR2sDdlizSiL5ByTNHy2rcUkfIhnc35D3MHWcA==
X-Received: by 2002:a1c:a597:: with SMTP id o145mr9500498wme.53.1624614621082;
        Fri, 25 Jun 2021 02:50:21 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id q19sm10803405wmc.44.2021.06.25.02.50.20
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 25 Jun 2021 02:50:20 -0700 (PDT)
From:   Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Matthew Hagan <mnhagan88@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sam Ravnborg <sam@ravnborg.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/4] ARM: dts: NSP: add Meraki MX64/MX65 series
Date:   Fri, 25 Jun 2021 10:49:47 +0100
Message-ID: <20210625095000.3358973-1-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20210625094947.2KiCXpYprivz3ciAMx2p57VmKmKFi4Z2QfMq7c2Irbc@z>

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

