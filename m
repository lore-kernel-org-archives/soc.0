Return-Path: <SRS0=rsSr=CB=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4FEC7EE2E
	for <soc@archiver.kernel.org>; Tue, 13 Jun 2023 11:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08663C4339E; Tue, 13 Jun 2023 11:49:14 +0000 (UTC)
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6945CC433D2
	for <soc@kernel.org>; Tue, 13 Jun 2023 11:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6945CC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yb1-f196.google.com with SMTP id 3f1490d57ef6-bb15165ba06so4467403276.2
        for <soc@kernel.org>; Tue, 13 Jun 2023 04:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20221208.gappssmtp.com; s=20221208; t=1686656949; x=1689248949;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R/5OXLy1qd9mgKLkyukk0eeZwSGA1RUZ3ixgqZMe0C0=;
        b=lURn+EBiK/a/toTmM0dljbAloTyzYKqm+qla5s0620V1++J5ectptCV6UC32EIO0Aa
         QQmSDfmu9fe1vggoqBWx0iozAboXXiWSSCPcCeRd7wHRDBysnpP00DQouN2+/yQ3XYEJ
         0zyjGGcKDasHUbyRAtZwMmYj5x8z8qFk6nhGfvoty4PkpNpO9z2prEhAockF4Tu+qBaD
         rsvWhhn0ZRhtVn/9bmDsdqZ8HhDU9N86wXMwGR1qDvf0o9JcsnxA6Oct4m3bdhwhe9BH
         1hbbHLNUXyLJHOoFPih7w0ysbicbgURAvJDFDUKns3T6wt/IEr4K3CJL0yo+hXEfa9OO
         WWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686656949; x=1689248949;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R/5OXLy1qd9mgKLkyukk0eeZwSGA1RUZ3ixgqZMe0C0=;
        b=CPnoCtamX8Il1HUEUikdbJxKnHtIKvGi51fJW/KQtl5lEuqGZWJDpoGgAJNwDcwI81
         Q8Azfoc2ZDtYIQ5c3OYvILgwke1eMsuEhJuxGz4KWhQt74T/nk7YidMLXX9vBbLRQ9Ke
         DYt23QSwgP6X71hjlwCk90wNDcgIJ149p2KpeO0d1MsftFgSzetUmIELdWjxk0jUoMLN
         bA28ZXFiC6yPReop9zZj3ehaWofclC446Dxyzr2gZs/a1d68H3105ZJj/LZVYfH1pW9U
         GxK8rpvfdnnezc6B84VVqPYCzeifmcW7327x7zIIJOIyCI44T/RhW68XfPrngLNyTIwv
         Lm3A==
X-Gm-Message-State: AC+VfDzSKIiws7JXWvNjM8BZGN727YelniFgG1vXNvLvLPQWCsmHlmld
	j7P+Tn4Y9xHo22iCaZwzayzERNWTHv145ZTS9mwjp/WaJkjYhmaUMIKp5QX7MdU=
X-Google-Smtp-Source: ACHHUZ7RL470l/9gQ2xHeJ2WEOibi6Mh9Xj8ws5+q5Y5kAKgX2q64fscSndm4p8o9wUl2MKvU5EI/awWwdUeVDgtwoA=
X-Received: by 2002:a25:cbce:0:b0:bc5:c85c:cdd4 with SMTP id
 b197-20020a25cbce000000b00bc5c85ccdd4mr1175973ybg.12.1686656949125; Tue, 13
 Jun 2023 04:49:09 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Tue, 13 Jun 2023 13:48:57 +0200
Message-ID: <CAHTX3d+2s_KmCnd=x5hydGb+LYoznAzYGTizvqqN2NFmrBurfw@mail.gmail.com>
Subject: [GIT PULL RESEND] arm64: dts: ZynqMP DT changes for v6.5
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these changes to your tree. Based on our chat I am sending
this request again because previous
one wasn't recorded properly in patchwork.

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
      Revert "arm64: dts: zynqmp: Add address-cells property to
interrupt controllers"
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

 Documentation/devicetree/bindings/arm/xilinx.yaml  |   8 +-
 Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml  |   2 +-
 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml  |   2 +-
 Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml  |   4 +-
 Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml  |   4 +-
 Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
 |   2 +-
 Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml  |   2 +-
 Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml  |   2 +-
 Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.yaml  |   2 +-
 Documentation/devicetree/bindings/gpio/gpio-zynq.yaml  |   2 +-
 Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml  |   2 +-
 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml  |   2 +-
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml  |   1 +
 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml  |   2 +-
 Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
 |   2 +-
 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml  |   2 +-
 Documentation/devicetree/bindings/memory-controllers/snps,dw-umctl2-ddrc.yaml
 |   3 +-
 Documentation/devicetree/bindings/memory-controllers/xlnx,zynq-ddrc-a05.yaml
 |   3 +-
 Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml  |   2 +-
 Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml  |   2 +-
 Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml  |   3 +-
 Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml  |   2 +-
 Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml  |   2 +-
 Documentation/devicetree/bindings/serial/cdns,uart.yaml  |   2 +-
 Documentation/devicetree/bindings/spi/spi-cadence.yaml  |   2 +-
 Documentation/devicetree/bindings/spi/spi-xilinx.yaml  |   2 +-
 Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml  |   2 +-
 Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml  |   2 +-
 Documentation/devicetree/bindings/timer/cdns,ttc.yaml  |   2 +-
 Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml  |   2 +-
 Documentation/devicetree/bindings/usb/xlnx,usb2.yaml  |   2 +-
 Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml  |   4 +-
 arch/arm64/boot/dts/xilinx/Makefile  |  18 +-
 arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dts  |   2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi  |  21 +-
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso  |  28 +-
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso  |  22 +-
 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts  | 327 +++++++++++++++-----
 arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dts  |   2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts  |   4 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts  |   6 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts  |  15 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts  |  12 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts  |   2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts  |   8 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts  |   4 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts  |  38 ++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dts  |   2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.1.dts  |   2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts  |  48 ++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts  |  27 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts  |  48 ++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts  |  48 ++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts  |  35 ++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts  |  35 ++-
 arch/arm64/boot/dts/xilinx/{zynqmp-zc1275-revA.dts =>
zynqmp-zcu1275-revA.dts} |  10 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi  |  40 ++-
 57 files changed, 633 insertions(+), 249 deletions(-)
 rename arch/arm64/boot/dts/xilinx/{zynqmp-zc1275-revA.dts =>
zynqmp-zcu1275-revA.dts} (73%)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
