Return-Path: <SRS0=udSp=B4=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531CEC7EE29
	for <soc@archiver.kernel.org>; Thu,  8 Jun 2023 12:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A7A1C4339B; Thu,  8 Jun 2023 12:22:44 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 77C3CC433D2
	for <soc@kernel.org>; Thu,  8 Jun 2023 12:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 77C3CC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-3f6e1393f13so3483635e9.0
        for <soc@kernel.org>; Thu, 08 Jun 2023 05:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20221208.gappssmtp.com; s=20221208; t=1686226959; x=1688818959;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yz1F7Tliprej53YaeHiwZy1H7DnCvaBvLafe91fEloU=;
        b=DradJcCPrIqlFSg/L4LpOwxCH/CTL1DXfKhXHWwydg8dMDdKOzyCwsVWpwc8s6sDGR
         vuTqoBmyqJzvwPAL+brhzi1K+OS5sJF40SHgTLe8xs6c68orrhMjX78oNo5km/GfUcMP
         Ia6MqizyF/CsnadNkrM42VfkmSheFQHhNvaaYnSYvYapI1pyJLjDZ+KvKE2+kRk2uggD
         7Ivwe3nPJqEFsF/uszVppP5DIWCUCDOMHVCwRkDEt+xyZHcqUpn401SGnxbSk7PH8lB5
         zS0DyZ9/+hnLDjwh7ovoJGeC/V2XWsL1/n3mDmiph/bLtYmOpSnn5KV2ThFchj/B6hPv
         keJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686226959; x=1688818959;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yz1F7Tliprej53YaeHiwZy1H7DnCvaBvLafe91fEloU=;
        b=HehrnEpTm7ANq/mjY+0csKjhkTl6JIu4HM6hyfu5U8393bsEbTHK3rLtPSdQmnGdLo
         B3SuXmGshTzDIEW4HKp/osDX0RHKJlt/Gq54XDAl0rwyb+KDn7rgntfQaIEzjdN2if6O
         LvdaMtf6/i1WQTTBpP3xl8rFmPFN+5vNRCEwbpVvVuYvRhl7TEPDfzrWZYVKn96IMo7S
         9obeiKtuRhtkbTlPGhVjJVvnYoIpfULivLPow632Eu+pRBNWzyuDfzDQYm6FdRWzM9IL
         JkTyVFLnFinS/QFwLu8ZMe8Klx1Xllv3xpOCzwdOCtk3HQ2ekv6zEIc4PK9dQIY/Op40
         FAnA==
X-Gm-Message-State: AC+VfDws/px0J3l6Wgx+pWLFaYAR1PCHyA6XiwBZ/tJuUF1mSxgu2ZP6
	xeUvnSdD7m3zxBasunf9VJpHN/OsdEDPc9cj59TQCPng7BA=
X-Google-Smtp-Source: ACHHUZ4hdpISDEpryV0qKKsk3fw9ScUkcUYmDSdXmHxU6T1mF82VM4xQAT9CWKWjMBaM64IlZuME8w==
X-Received: by 2002:a7b:c7cf:0:b0:3f7:395a:c9fa with SMTP id z15-20020a7bc7cf000000b003f7395ac9famr1366491wmk.4.1686226958938;
        Thu, 08 Jun 2023 05:22:38 -0700 (PDT)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id u26-20020a7bcb1a000000b003f7a562ff31sm5204330wmj.6.2023.06.08.05.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 05:22:38 -0700 (PDT)
Message-ID: <4a9fc43c-9fb3-5657-ef0a-76049492c453@monstr.eu>
Date: Thu, 8 Jun 2023 14:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: "git (AMD-Xilinx)" <git@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for v6.5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull these changes to your tree.

Thanks,
Michal


  The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

    Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

  are available in the Git repository at:

    https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-v6.5

  for you to fetch changes up to 067bf44de11ceae0d2787c86127a39a67b2d60a6:

    dt-bindings: usb: xilinx: Replace Manish by Piyush (2023-06-05 13:18:32 +0200)

  ----------------------------------------------------------------
  arm64: ZynqMP DT changes for v6.5

  Various small fixes and cleanups to be aligned with the latest dt-schema.

  Other major changes are:
  - Wire mali-400 gpu
  - Change board name for zcu1275
  - Use ethernet-phy-id to handle ETH phy reset properly
  - Switch to amd.com emails
  - Update people in DT bindings

  ----------------------------------------------------------------
  Amit Kumar Mahapatra (2):
        arm64: zynqmp: Add mtd partition for secure OS storage area
        arm64: zynqmp: Set qspi tx-buswidth to 4

  Ashok Reddy Soma (1):
        arm64: zynqmp: Fix usb node drive strength and slew rate

  Michal Simek (24):
        dt-bindings: arm: xilinx: Change zc1275 board name to zcu1275
        arm64: zynqmp: Change zc1275 board name to zcu1275
        Revert "arm64: dts: zynqmp: Add address-cells property to interrupt 
controllers"
        arm64: zynqmp: Rename ams_ps/pl node names
        arm64: zynqmp: Sync node name address with reg (mailbox)
        arm64: zynqmp: Fix usb reset over bootmode pins on zcu100
        arm64: zynqmp: Add dmas, dp, rtc, watchdogs and opp nodes for SOM
        arm64: zynqmp: Use assigned-clock-rates for setting up SD clock in SOM
        arm64: zynqmp: Add gpio labels for modepin gpio
        arm64: zynqmp: Add pinctrl emmc description to SM-K26
        arm64: zynqmp: Switch to ethernet-phy-id in kv260
        arm64: zynqmp: Setup clock for DP and DPDMA
        arm64: zynqmp: Enable DP driver for SOMs
        arm64: zynqmp: Enable AMS on SOM and other zcu10x boards
        arm64: zynqmp: Describe bus-width for SD card on KV260
        arm64: zynqmp: Add phase tags marking
        arm64: xilinx: Use zynqmp prefix for SOM dt overlays
        dt-bindings: xilinx: Switch xilinx.com emails to amd.com
        arm64: zynqmp: Convert kv260-revA overlay to ASCII text
        arm64: zynqmp: Switch to amd.com emails
        arm64: zynqmp: Describe TI phy as ethernet-phy-id
        arm64: zynqmp: Used fixed-partitions for QSPI in k26
        dt-bindings: xilinx: Remove Rajan, Jolly and Manish
        dt-bindings: usb: xilinx: Replace Manish by Piyush

  Parth Gajjar (2):
        dt-bindings: gpu: mali-utgard: Add xlnx,zynqmp-mali compatible
        arm64: zynqmp: Add mali-400 gpu node for zynqmp

  Piyush Mehta (1):
        arm64: zynqmp: Disable USB3.0 for zc1751-xm016-dc2

  Radhey Shyam Pandey (1):
        arm64: zynqmp: Add pmu interrupt-affinity

  Sai Krishna Potthuri (1):
        arm64: zynqmp: Add resets property to sdhci nodes

  Srinivas Neeli (1):
        arm64: zynqmp: Add linux,code for gpio button

   Documentation/devicetree/bindings/arm/xilinx.yaml 
  |   8 +-
   Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml 
  |   2 +-
   Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml 
  |   2 +-
   Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml 
  |   4 +-
   Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml 
  |   4 +-
   Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml 
  |   2 +-
   Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml 
  |   2 +-
   Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml 
  |   2 +-
   Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.yaml 
  |   2 +-
   Documentation/devicetree/bindings/gpio/gpio-zynq.yaml 
  |   2 +-
   Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml 
  |   2 +-
   Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml 
  |   2 +-
   Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml 
  |   1 +
   Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml 
  |   2 +-
   Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml 
  |   2 +-
   Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml 
  |   2 +-
   Documentation/devicetree/bindings/memory-controllers/snps,dw-umctl2-ddrc.yaml 
  |   3 +-
   Documentation/devicetree/bindings/memory-controllers/xlnx,zynq-ddrc-a05.yaml 
  |   3 +-
   Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml 
  |   2 +-
   Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml 
  |   2 +-
   Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml 
  |   3 +-
   Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml 
  |   2 +-
   Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml 
  |   2 +-
   Documentation/devicetree/bindings/serial/cdns,uart.yaml 
  |   2 +-
   Documentation/devicetree/bindings/spi/spi-cadence.yaml 
  |   2 +-
   Documentation/devicetree/bindings/spi/spi-xilinx.yaml 
  |   2 +-
   Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml 
  |   2 +-
   Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml 
  |   2 +-
   Documentation/devicetree/bindings/timer/cdns,ttc.yaml 
  |   2 +-
   Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml 
  |   2 +-
   Documentation/devicetree/bindings/usb/xlnx,usb2.yaml 
  |   2 +-
   Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml 
  |   4 +-
   arch/arm64/boot/dts/xilinx/Makefile 
  |  18 +-
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dts 
  |   2 +-
   arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi 
  |  21 +-
   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso 
  |  28 +-
   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso 
  |  22 +-
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts 
  | 327 +++++++++++++++-----
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dts 
  |   2 +-
   arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts 
  |   4 +-
   arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts 
  |   6 +-
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts 
  |  15 +-
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts 
  |  12 +-
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts 
  |   2 +-
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts 
  |   8 +-
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts 
  |   4 +-
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts 
  |  38 ++-
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dts 
  |   2 +-
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.1.dts 
  |   2 +-
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts 
  |  48 ++-
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts 
  |  27 +-
   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts 
  |  48 ++-
   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts 
  |  48 ++-
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts 
  |  35 ++-
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts 
  |  35 ++-
   arch/arm64/boot/dts/xilinx/{zynqmp-zc1275-revA.dts => 
zynqmp-zcu1275-revA.dts} |  10 +-
   arch/arm64/boot/dts/xilinx/zynqmp.dtsi 
  |  40 ++-
   57 files changed, 633 insertions(+), 249 deletions(-)
   rename arch/arm64/boot/dts/xilinx/{zynqmp-zc1275-revA.dts => 
zynqmp-zcu1275-revA.dts} (73%)

