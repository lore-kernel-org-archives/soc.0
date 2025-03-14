Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E812A1A83F2
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741963628; cv=none; b=HTKATo5mbBJFG5trcEuWV+OERdTubsGqtW7Y8sTG78Wx0ZZegqX9XaB+C9pPkj4R2YW2ko/9+OdyGnQ0Q8vt8W8er/mZ3W7O7spN/132BuBhVC1a+d/8NYMYRvleSB2WRRMsfEtsjmnAetFV+Rm3FhZCUjlbMuBYJiTvpb+L9qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741963628; c=relaxed/simple;
	bh=XR5972M2XjpwhCoL0PVcdLQpuwWg7BwZXQRuY0nCdyE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=alnd1abC9F+Z4hZuBW6ozgHrjSFgz12e974FalEa8kCJFoUEx1RAnV7ZVFaAnUgs97ufdyM3DQ3UAay4u4sd372VkNVn1z8jes3vq4+6Sk1FRGPUiJSsUaayAjU9Bl9EqssySNMCm1KZu/f8FpTuVhgzP+EXhKIAjG7/UU09e2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=NRmbjpGl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="NRmbjpGl"
Received: by smtp.kernel.org (Postfix)
	id 7CAD1C4CEE9; Fri, 14 Mar 2025 14:47:07 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3337DC4CEE3
	for <soc@kernel.org>; Fri, 14 Mar 2025 14:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3337DC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f74b78df93so22022177b3.0
        for <soc@kernel.org>; Fri, 14 Mar 2025 07:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1741963622; x=1742568422; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ULpxzULg3028TtNWu8N7vw/s480uAXkmsiGbIaA7mGg=;
        b=NRmbjpGldmZt/saN3TcqXeaMv0J3xepyIyn7PHPnUNAy6SI3S9haQlVctDEnttvKJC
         Dq7VhGxlEType/HtYUutZQtyFbP63qW8fQjV3HfHLa5inTj1b/XFpICIPNOLVEI4e0zk
         HDpjNrGs/KqSunIZTtsNMEAc7HGW9va9JJSHWVc9Ci8OOmGFdBoBxeeVqybl5KH4dSjG
         ooWsLrhaohxMa0VjNkIFG2HDOcIziC4qKLMSyccDZv58Cu1dzz0+MMn88WXR1I4hCbvz
         sHBD5sXNZth+Tr+oqMCUXAvfVAAJ8q180cEz/pJamlrHfPBgooz7jegwhzymOjHpxoie
         DLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741963622; x=1742568422;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ULpxzULg3028TtNWu8N7vw/s480uAXkmsiGbIaA7mGg=;
        b=jMt/oVEocKwEaR/pNY9r03uS59VzBd8BEBm5+1mggTpwi9mPffw5hF7giaJ0Uuwup5
         IzBTnRP7PvibLqDpNnsdh4QGnuQGLwvOPF1owjpW0QGcVLtODE1pJdFNjMzsYwxqS+2V
         lVBTLiOqosSjU6Bn6X2EFoR9VmN82Mxae78IzhTjoPbwCdIbSrSJqCakp+KdPJ+pEKaJ
         zVzeUL86Q05Lh1cWNb4GjNgtepzWYUMLpTSLQiLStuTl3l3sbjRpmQw2ZCC2+kPeHJYK
         NdMQQ6/8vsjhyC6qLicD1V/fY9+ItGZ4N6rcyhWg8wUi3aUOv5MSsJMz/ORotPW7JSwS
         OKHA==
X-Gm-Message-State: AOJu0YykEcZ1ExzywMqOa8EglbsjQIYf6Mbpt8uxusIVSA0QYyai3oz+
	ZrQFdCb6uFK6377W8g/hF2wFqwlXTRIAfEzH/nn8OGq/mgJepSBYPEtoruGYvXAd1/qoP1KFwt4
	JBwhFxblE0n353tgTXfC/RM57oJ1PZd0mZNkESjebp7vnVACyvU6r
X-Gm-Gg: ASbGncuLTP2gBklfoHIZ5Mv26bW+IHKwAL8vsoPfGWFiVnvKrvtnCCWIxBm1ypSNnVF
	mV4ztRX4JKZcpxdkNu/Jto7kDQI3oi/PCxkWvZP2RdT79PGCuQx7ERqg01xM5hj/eJ+zqAOh/vG
	pm+4lRhyn+xPwMxwuGzw9yI6Ndp48=
X-Google-Smtp-Source: AGHT+IHqkVQeDa8YWC8fBhIO88ibTpOHbiGi3FxISD11Pk/b7UC56/MhEMJyW7h/esZ9FomSB6B4l4pl0qUjJEHnxxE=
X-Received: by 2002:a05:690c:6901:b0:6fe:c040:8eda with SMTP id
 00721157ae682-6ff45f2bf78mr30405407b3.4.1741963622528; Fri, 14 Mar 2025
 07:47:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 14 Mar 2025 15:46:51 +0100
X-Gm-Features: AQ5f1JpGVUbKl2emC7DLpVnArC6KG70gSWzthZQtM-tnmFCjp5UWdrBp1hf_NCM
Message-ID: <CAHTX3d+u1VmxP4vm0peQS-ST7o0BuCpKUPRVCSLMfAAb=eV3Xg@mail.gmail.com>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for v6.15
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these patches to your tree. One new Versal NET board is added but
the most useful change is to start to use constants out of dt binding.
There will be followup
patches to migrate all SOC specific constants.

Thanks,
Michal

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-6.14

for you to fetch changes up to f0ceedd52a69a8bf63778b1fe9e1c10e02ecd3fd:

  dt-bindings: xilinx: Deprecate header with firmware constants
(2025-02-21 07:58:35 +0100)

----------------------------------------------------------------
arm64: ZynqMP DT changes for 6.15

- Align clock nodes with DT binding
- Add the first VN-X Versal NET board
- Move constants out of DT bindings

----------------------------------------------------------------
Michal Simek (3):
      arm64: versal-net: Add description for b2197-00 revA board
      arm64: zynqmp: Use DT header for firmware constants
      dt-bindings: xilinx: Deprecate header with firmware constants

Naman Trivedi (1):
      arm64: zynqmp: add clock-output-names property in clock nodes

Shubhrajyoti Datta (1):
      dt-bindings: soc: Add new VN-X board description based on Versal NET

 Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml             |   4 +-
 Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml |   3 +-
 Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml        |   3 +-
 Documentation/devicetree/bindings/net/cdns,macb.yaml                  |   7 +-
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml              |  11 +-
 Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml            |   3 +-
 Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml                |   3 +-
 arch/arm64/boot/dts/xilinx/Makefile                                   |   2 +
 arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi
| 231 ++++++
 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts          | 116 +++
 arch/arm64/boot/dts/xilinx/versal-net.dtsi
| 752 ++++++++++++++++++++
 arch/arm64/boot/dts/xilinx/xlnx-zynqmp-clk.h
| 126 ++++
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi                        |  17 +-
 include/dt-bindings/clock/xlnx-zynqmp-clk.h                           |   7 +
 14 files changed, 1262 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi
 create mode 100644 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/versal-net.dtsi
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-zynqmp-clk.h
---
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
