Return-Path: <SRS0=HLeY=M5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831F2C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 20:46:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AFFE6105A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 20:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AFFE6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QQFZPWQII0iACxq1W0hTuG/dlmGgOIgHCp20j+8Oz2M=; b=w3xv+ypZYCujWn
	bR3t06fVaAh2Jj2/aJKu4h/8jZ3jxqsUlXkBUbZt61jth0It4xlOaN/SlNE96AE+WPfKY+xej317v
	gNlDtFGXzxcOy8NToGMrQqLeAmV+Sloi49PBV/gGq35OvJrBenMIiiWE0lR9eh14IOoOfrm5H+WgH
	Nv9MhqLoyGgS+2m01oPXqOxpeE8kOfC2BveVJdnJo4C9TAcSS8LKXYD38trFPN9ZTkgVvqLPXUHNH
	uAlOat+G1w7HGlsOb8ZPIlTkDOBJyy3kbeqDvzfMFXyGG1/eV2+4gk70gE7rWJdhQvGh373LDwdZc
	AarS0WpJ3jJO0CGQUZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC6iA-00DWgd-Qd; Fri, 06 Aug 2021 20:44:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC6i7-00DWfW-3Z
 for linux-arm-kernel@lists.infradead.org; Fri, 06 Aug 2021 20:44:56 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so6936002wmd.3
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 06 Aug 2021 13:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bvqHVXKHi79eQa5zOD1wzmVDXkASnkyY1VkIn9290Rg=;
 b=UEqY9OVfruZl7dzVTxN6lV+4WokbppoNk8NEOo8TFgYBdJuifevBGY5DBQTViHnvaS
 sMcUyhtkCilGfcODGeqeUwKXw9W5bZKwCcXlU0sz0sWRe+TJQ8hAgAb4IMRKPij096t+
 /rPwzqvtlTMKyRyyqwc4BKbiM1CHOmkddg8wKkrv8e24Lw7lUx1UN4cgP8Evnx0qbAHf
 rbRCjRWj9aAXacAf3WLKTVC4EAezkQ2IBhTI9HpJiuDt0GcfhH8Yzru74mLHdmXjUu0k
 EZs6h+amVuxHV65413JNKAkTTHyicVEErNfK/NYTqe25OVGeQwRrA7EFN4x/57SdfmDG
 w6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bvqHVXKHi79eQa5zOD1wzmVDXkASnkyY1VkIn9290Rg=;
 b=g9MTyx0J3wX49JZBnT7Dl23kZeCec+gwQtr6YbeUcB5MH1mSQWQPEQ0ZxizWaxfnFO
 uIjj5zwoZhMUM4PHggeB/1Hx3aE1dQOkqvOqme/mWtCQ4e8zKqBCr6/uj2El1hEF/6K3
 6Jj7e3HJ2pdjpwPkQiPvOuOwJ1/2zehkzvkpvmCqgQG0DWHQJ09iGhmn3q6ETEyJSDRL
 36FP5rNAzrPljanNtwZg3KbC+XJiPlbjel8SZtnKfk0+iqczBHqWU9vjWsiKNL2Gz3Cv
 iC4raud/XF3sfX+eh4woJMJ3EgR2d7vTMuxSzIPC4m6IKFYPoAJYg5Ey9c9HtEhgStCv
 iqmQ==
X-Gm-Message-State: AOAM533sBmJG2UIiX/w2HJ2YN9Q8kUIDaAj8Lh6/KltO8NuRax7rulfK
 k5bFDkkLx5BlsMBMXoXsdlDBCkOyVSw=
X-Google-Smtp-Source: ABdhPJzMC1EHegs5qGPHSILcdEi9QcJvuIMcf6GodC2xHJ6mbnAjX84IJC3GvI2DpCVk0MTQUVkeZg==
X-Received: by 2002:a7b:c390:: with SMTP id s16mr5189879wmj.148.1628282692706; 
 Fri, 06 Aug 2021 13:44:52 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id w10sm10110029wrr.23.2021.08.06.13.44.51
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Fri, 06 Aug 2021 13:44:52 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthew Hagan <mnhagan88@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/5] ARM: dts: NSP: add Meraki MX64/MX65 series
Date: Fri,  6 Aug 2021 21:44:31 +0100
Message-ID: <20210806204446.2981299-1-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_134455_206921_9231AC00 
X-CRM114-Status: GOOD (  15.06  )
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
Message-ID: <20210806204431.oPmbdLQQnetXQp9Bt6RHoBDg2bYwCeJQw6eA0Xl1acI@z>

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

Changes from v4:
  - Move chosen and memory nodes from bcm958625-mx6x-common.dtsi to
    each .dts file (Arnd Bergmann).
  - Append [@<unit-address>] to memory nodes.
  - Create Ax stepping-specific dtsi for Ax devices (Arnd Bergmann).
  - Append read-only property to at24 eeprom node.
  - Remove L2 properties which should be defined at platform-level.
  - Correct NAND node names.

Matthew Hagan (5):
  ARM: dts: NSP: Add common bindings for MX64/MX65
  ARM: dts: NSP: Add Ax stepping modifications
  ARM: dts: NSP: Add DT files for Meraki MX64 series
  ARM: dts: NSP: Add DT files for Meraki MX65 series
  dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65

 .../devicetree/bindings/arm/bcm/brcm,nsp.yaml |   6 +
 arch/arm/boot/dts/Makefile                    |   6 +
 arch/arm/boot/dts/bcm-nsp-ax.dtsi             |  71 +++++
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi | 279 ++++++++++++++++++
 .../boot/dts/bcm958625-meraki-kingpin.dtsi    | 163 ++++++++++
 .../arm/boot/dts/bcm958625-meraki-mx64-a0.dts |  25 ++
 arch/arm/boot/dts/bcm958625-meraki-mx64.dts   |  24 ++
 .../boot/dts/bcm958625-meraki-mx64w-a0.dts    |  33 +++
 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts  |  32 ++
 arch/arm/boot/dts/bcm958625-meraki-mx65.dts   |  24 ++
 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts  |  32 ++
 .../dts/bcm958625-meraki-mx6x-common.dtsi     | 129 ++++++++
 12 files changed, 824 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm-nsp-ax.dtsi
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
