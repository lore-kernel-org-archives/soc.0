Return-Path: <SRS0=MVv1=OF=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D320C433EF
	for <soc@archiver.kernel.org>; Wed, 15 Sep 2021 08:09:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7E52C61212; Wed, 15 Sep 2021 08:09:18 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E64A2608FB
	for <soc@kernel.org>; Wed, 15 Sep 2021 08:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E64A2608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ej1-f45.google.com with SMTP id kt8so4198985ejb.13
        for <soc@kernel.org>; Wed, 15 Sep 2021 01:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=YStp2qtLbcS0HTF6as203y7oEMSYP7Q6WpFfPubppdk=;
        b=pyUGgLnY7Zn5s5whkfzV/sqzjVcjoQ52gkrDwi06p4BKILQht5/8CNWjB8zpc5Fa+a
         cN+R0bax3uwg5Yp1FZiUro0JgIJLP8LLOFSMFD0O9Ninn5RZf0hvFwQUryv7tNiFBs0U
         1nL4QGySqLuoi/dHVvAW1o6KYlDqY77TNNfeflHJSt+syW8OcxjQiWHzJbaadWvX3lgc
         SfyB1IxNuu9S0Nleq/ei+dXOFeARzxfaBZ1qUgb16/LEr1ZEUFGegzOSTQT4WwpSciBQ
         +IXc8dvCuIicAUKf/WxyzLCNujuaQEaeerPGXaO7P+S5e4MzH5N+LAS+/+oG5uIIwXrv
         Ij0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=YStp2qtLbcS0HTF6as203y7oEMSYP7Q6WpFfPubppdk=;
        b=xzIaft4t16pSOEFNl1BG0WDu43dWeJ1MqN3Tlzk0KGjgfSlSOWqe28zLVg3JMsQiwF
         gQPRi02/1Clzxc/ZFscYf4XFP3UvDEZedr8Dr0111SG2Zbuy2SUkgm1DZ1cfJFv3ZTpO
         QMfLZyhSPMsEzqGFKCNBqVrqheKoBXipluRVW7AlnPyTiN9f3y19aR8PdEsNOBf92pOs
         qaDR3NwcYtPLx6m6KUtodXVSxQpP41rdoZ53B0O3W3MxPMcHgWLedgS8W9WVuoaK4oNU
         SGongoWORnG6sHSCpNPZ75D3DKGj8vyS8uz0XXHvJgw9aaV6M8bBIUU9wApa8foEOyeE
         dr8g==
X-Gm-Message-State: AOAM532wfg7nQBswbtwTUe687z3yUtvwwUH6U1NAxSX9BQZaPehuQtAj
	oyGRosFW6zFMLUGBxQvhuBxxIQ==
X-Google-Smtp-Source: ABdhPJwfrrktf/Xfvz+hxtoH0QcGVRjQbleUQmOsnRZS9oirXWymnyCLo7rbI/KDOuz+IVKUPHkd4g==
X-Received: by 2002:a17:906:1454:: with SMTP id q20mr24383663ejc.446.1631693356433;
        Wed, 15 Sep 2021 01:09:16 -0700 (PDT)
Received: from ?IPv6:2a02:768:2307:40d6:f666:9af6:3fed:e53b? ([2a02:768:2307:40d6:f666:9af6:3fed:e53b])
        by smtp.gmail.com with ESMTPSA id d25sm6643175edt.33.2021.09.15.01.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 01:09:15 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.16
Message-ID: <b1cbd05d-ab40-e1fc-4001-6cf88e1e81f9@monstr.eu>
Date: Wed, 15 Sep 2021 10:09:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

based on discussion at
https://lore.kernel.org/r/CAK8P3a0ZWxsUrGA2J8d=M-G=0Bbw16XfxuL=Uu=cXvPpMyQkgQ@mail.gmail.com
I am sending new pull request for adding DT changes which didn't go to
v5.15. There is likely be another pull request later for v5.16 kernel.

Thanks,
Michal


The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-v5.16

for you to fetch changes up to 35a7430dad4dd83fe295917b8232595f437bb208:

  arm64: zynqmp: Wire psgtr for zc1751-xm013 (2021-09-13 08:55:56 +0200)

----------------------------------------------------------------
arm64: dts: ZynqMP DT changes for v5.16

- Fix issues reported by dtbs_check
- Enable DMAs, DP, USB, NAND on various boards
- Add description for irps5401
- Add pinctrl description
- Add psgtr description for usb3, sata and DP
- Start to use nvmem alias for eeprom reference
- Clean up aliases list
- Wire qspi and usb3.0
- Add support for zcu102-rev1.1
- Couple of minor fixes and sync patches

----------------------------------------------------------------
Amit Kumar Mahapatra (1):
      arm64: zynqmp: Do not duplicate flash partition label property

Michal Simek (32):
      arm64: zynqmp: Disable CCI by default
      arm64: zynqmp: Enable fpd_dma for zcu104 platforms
      arm64: zynqmp: Fix irps5401 device nodes
      arm64: zynqmp: Add pinctrl description for all boards
      arm64: zynqmp: Correct zcu111 psgtr description
      arm64: zynqmp: Wire psgtr for zc1751-xm015
      arm64: zynqmp: Correct psgtr description for zcu100-revC
      arm64: zynqmp: Add phy description for usb3.0
      arm64: zynqmp: Disable WP on zcu111
      arm64: zynqmp: Add missing mio-bank properties to dc1 and dc5
      arm64: zynqmp: Wire DP and DPDMA for dc1/dc4
      arm64: zynqmp: Enable nand driver for dc2 and dc3
      arm64: zynqmp: Remove additional newline
      arm64: zynqmp: Move clock node to zynqmp-clk-ccf.dtsi
      arm64: zynqmp: Add nvmem alises for eeproms
      arm64: zynqmp: List reset property for ethernet phy
      arm64: zynqmp: Remove can aliases from zc1751
      arm64: zynqmp: Move DP nodes to the end of file on zcu106
      arm64: zynqmp: Add note about UHS mode on some boards
      arm64: zynqmp: Remove information about dma clock on zcu106
      arm64: zynqmp: Wire qspi on multiple boards
      arm64: zynqmp: Move rtc to different location on zcu104-revA
      arm64: zynqmp: Add reset description for sata
      arm64: zynqmp: Sync psgtr node location with zcu104-revA
      arm64: zynqmp: Remove description for 8T49N287 and si5382 chips
      arm64: zynqmp: Add support for zcu102-rev1.1 board
      arm64: zynqmp: Add psgtr description to zc1751 dc1 board
      arm64: zynqmp: Remove not documented is-dual property
      arm64: zynqmp: Fix serial compatible string
      arm64: zynqmp: Enable gpio and qspi for zc1275-revA
      arm64: zynqmp: Enable xlnx,zynqmp-dwc3 driver for xilinx boards
      arm64: zynqmp: Wire psgtr for zc1751-xm013

Mounika Grace Akula (1):
      arm64: zynqmp: Add reset-on-timeout to all boards and modify
default timeout value

Srinivas Neeli (1):
      arm64: zynqmp: Update rtc calibration value

Stefano Stabellini (1):
      arm64: zynqmp: Add missing SMID for pcie to zynqmp.dtsi

 Documentation/devicetree/bindings/arm/xilinx.yaml      |   1 +
 arch/arm64/boot/dts/xilinx/Makefile                    |   1 +
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi         |  13 +++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts      |  16 +++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts      |  16 +++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1275-revA.dts      |  18 ++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts | 298
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts | 342
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts |  49
++++++++++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts |  24 ++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts | 330
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts      | 264
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.1.dts    |  15 +++++++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts      | 320
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts      |   3 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts      | 292
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts      | 250
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts      | 340
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts      | 274
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi                 |  93
++++++++++++++++++++++++++++---------------
 20 files changed, 2861 insertions(+), 98 deletions(-)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.1.dts

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

