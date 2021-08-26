Return-Path: <SRS0=jjZJ=NR=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3C3C432BE
	for <soc@archiver.kernel.org>; Thu, 26 Aug 2021 14:36:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2C17760FD8; Thu, 26 Aug 2021 14:36:25 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67E9160F42
	for <soc@kernel.org>; Thu, 26 Aug 2021 14:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67E9160F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ej1-f50.google.com with SMTP id x11so6903416ejv.0
        for <soc@kernel.org>; Thu, 26 Aug 2021 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=fqdn4lJUKRzdj4mN8Ayb3pqc13SnwWbXjGY05d9xh+Q=;
        b=wVlDegPjS9L8hoURYj3Y+W5NGFfPrnPMKhMhEhVCov91ymzvuFVeoEWdC3saj2RQdi
         rfifYbkqipoQHWBYqoAVTkpKkF6HbPXrzYZvmhmoM2POtF6+3TxIIV8uXcKwaoY3MjmW
         79wCV21pQxHbBCHK+MZtDTDUykRid2VKBR0spX/b36mmD06bEbAtdxEiFtWhUDKHM/tB
         EBPvfCUSZFRyZDaDNuEHTYgR3io2/jGv8SsFmj3y15WryIyO4kBnO+7dMVZMQAyzo2aD
         4bdWfXxNRNwGGTatl7CJ+FJ6N+gmzAaD0FRpweS6isBjvSwwR70Onk4v3JlIRUgc4cId
         pY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=fqdn4lJUKRzdj4mN8Ayb3pqc13SnwWbXjGY05d9xh+Q=;
        b=pz4XYSDaxyyMTTcgzlcOi0HioBbSsASRari1O7FbG9VGI8xLeHY8lA6sjsioHTndnK
         5osMbSnQeNUQ7bhyJEk16X3VexnCcAVwvkyH+YCGEbeKz6chEU35sJJlkeRisLt70qwl
         JX2QV2AYO0GbUK0wH3KV/cnylBZcVPhLR2f4yfuiEZnUT+BoZA03kbj3GBPiz54BoBry
         ShH8T5WuaJEZIAgAoAeVbUtPefOUk1qqJ53g/HrnvYtVTgtFDXsKc+Oos0oHNWI8B6jZ
         /dgbeAciHkmbHxvFUQ1Hh7TJ+A/q5UuNWPHBbQ1KknGPwSBK+13oGhbRHW22YbiTd2fG
         vmCw==
X-Gm-Message-State: AOAM531XqdL52loid0XbQkhlEg99uvelto6R8RxlSQmx2/SF/A5rgL5p
	37NXemFt5zIves7aDQ26XbEcW4LOW+C++nAK
X-Google-Smtp-Source: ABdhPJx7n3T+TpuxqqN6SWdBLuuk9zF8TxZNII/uEhIKYg2j9fKFNdhsQNZuQpoxYNH+M/zeQ+xtkA==
X-Received: by 2002:a17:906:8506:: with SMTP id i6mr4662885ejx.397.1629988582828;
        Thu, 26 Aug 2021 07:36:22 -0700 (PDT)
Received: from ?IPv6:2a02:768:2307:40d6::45a? ([2a02:768:2307:40d6::45a])
        by smtp.gmail.com with ESMTPSA id y24sm1488268ejc.80.2021.08.26.07.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 07:36:22 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.15
Message-ID: <cec98151-d7a9-3fdb-ba5c-dc1fd182c2c4@monstr.eu>
Date: Thu, 26 Aug 2021 16:36:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

please pull these patches to your tree. I have one more patch for adding
new Xilinx Kria platform but that discussion about compatible nodes in
overlay is not finished yes. That's why I am sending this pull request
without it.
A lot patches are coming from dtbs_check fixing and synchronization
among boards to better see differences. But also couple of drivers were
already merged that's why make sense to enable it.

Thanks,
Michal



The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-v5.15

for you to fetch changes up to 479c46133c0573b6549e437165bff1422634f45f:

  arm64: zynqmp: Wire psgtr for zc1751-xm013 (2021-08-25 08:29:27 +0200)

----------------------------------------------------------------
arm64: dts: ZynqMP DT changes for v5.13

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
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi         |  13 ++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts      |  16
+++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts      |  16
+++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1275-revA.dts      |  18
+++++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts | 298
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts | 342
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts |  49
++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts |  24
+++++++++++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts | 330
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts      | 264
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.1.dts    |  15
+++++++++++++++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts      | 320
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts      |   3 ++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts      | 292
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts      | 250
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts      | 340
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts      | 274
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi                 |  93
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------
 20 files changed, 2861 insertions(+), 98 deletions(-)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.1.dts

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

