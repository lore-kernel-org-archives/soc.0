Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA462FF67A
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757676008; cv=none; b=HNiSTaFERMMYqC9QYrvX54xBBUg9b+psu0bkpL/tQxF6GupKcZ8tbR5Dm600WORQtwOMu9UDQtMQHRvq3e6fe3Fcx2VbYbIcwKsb5ON6hXL3+NURLJl4GFLDJSRWW0VePSTC4P/dpN8l5NBloXAGX5VPxw2KKDPfidY4yK8v+uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757676008; c=relaxed/simple;
	bh=wtZLN8DwmNqtaAKbNLk3NFR7bHJvZ0E+t5pr4hijtpY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=cAdidVVtuk8HIsvwmdyhN7Z3szvOJbucVw8YreARHcWjZHaQ07W1LgskSoezoe/z6B5npE3XO9Ir6+GFwBGbIpcgq0FA1F/yCHErvTgS7C5h9lztooauvF3Sj/0omngojcgMDaj5MJv7MIYqs/KX0AKy6YGrMLFDcWUHHY7Z8ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=AiOT6yhN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="AiOT6yhN"
Received: by smtp.kernel.org (Postfix)
	id 37491C4CEF7; Fri, 12 Sep 2025 11:20:08 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F020C4CEF1
	for <soc@kernel.org>; Fri, 12 Sep 2025 11:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F020C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so274421366b.3
        for <soc@kernel.org>; Fri, 12 Sep 2025 04:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1757676002; x=1758280802; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5X7H8g9TghKOTLREJ2OSJx6IAiEOQjoYaS013q9w+o=;
        b=AiOT6yhNh8EWfCsa7+VMAg5rIOD/x0rtGW6NSmOzh9HwvRwiV9EujVLnUNpNwc7Cyn
         tjhX0Pvqbeqr0sOuwl834G7xUx+TTrEHQFR0v7Rdc1QHuP/KeyUQGXIufKsTpFv2F78I
         VqIq4kYDXqf8HFlXuPQbWJBeeFZA7OBAObzmwm1nmYa+LF3T3VMTN+W+BilR9iIY915+
         WFyiwniW1uHUIqbJo2rUAKqaZiOTII4LQjGszBWEbj11l4znn7cNoWVj4Qe6kdUk/D6d
         OujWCXTo9rSt9tYu0jY46o3LWX+qYE4zsH+6VcQ8r6M8rIyalk1wj8xgC5ziz/pDsg5s
         pWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757676002; x=1758280802;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s5X7H8g9TghKOTLREJ2OSJx6IAiEOQjoYaS013q9w+o=;
        b=aF8p/ByAclNzO95m29tpKB0jJKUbIUsN4KmMYXUkyF2n+EQ7aj0tdIH9Ns4HuWIXoc
         dlc0gH4bgItP2O8CUY5xUvrW6R2D150KLiWmxKRRTTTHfB85GGaulLqavBGfu0fNc0vG
         nciS5SwRay2eQpTyPNrGppZADFWp59189zQOK5Y9gPeZNUpjrYzWCRhcGMCPXOVHc+wm
         CnaJMtBg1+7w4AXU+u8NKL2h4sFRRcmmM3U/5LlbXe8yKGVSWDyeJudDe83lTmWhG8gk
         pFvpUatobc6FszVjihFMOYK2Y0iIwWSQt++QD3G3S2vT//kgd0Beql/YpUAIcSYCPFxT
         SGGA==
X-Gm-Message-State: AOJu0YwDRm67looEw/PcnEHhyaM6ZPvyXAnALEf72wR9vZsihtkQQbwy
	1KrANvUIIzUlOZ5Dk6asAg9mH+mV7qkCMvhEi5/L02PFDt43sSO5s9quTPOp9tm6AUxVN9ayBM8
	EcFrc5n+N
X-Gm-Gg: ASbGncv2xsVcBbAM47GvmL05DcREvt31rscI9MJSPQniGBYWHZvAK3EzU9Ne4yhUhnV
	cia7yzFeWLBjtd7DBWygHLRRoci8/hhKpBda1tkKuACJGGgUP8nojY4iFhzFhVoLL6wazeJacrL
	jeH3yaPfLpc2WG4GDEbo/RHo8vqeD8f/PtlAIsA2RUzxsp1e0rWJ49I08BoNvEOqzTnqth8Y2RX
	2B7p8SPAHZviJ0R7cNVG2zxgM4ziiImX6dqAK5AT+qP4GyH61CwGGGQy2eAbTRdZ75j4rVjNMrc
	IvxyK7TzTeps5YX5YfIQl3xU4Cz6TBECImGWilfetxwEzCrcEhHiDn1nCSPHlAmbkRrR5mUxstO
	j7vBvLAiB9FSsrn/ZbfrZ26ZrcUrh91yS0KtfXJ0sjcM/NQnm10Q=
X-Google-Smtp-Source: AGHT+IGvugGRAn2HRo+5LhqaFkHFSWWapkjEnS7PFZhMxUpdAiZSErcN9VQ0FwoL0JVtOgsS/yt7fA==
X-Received: by 2002:a17:907:6096:b0:b04:5a74:b675 with SMTP id a640c23a62f3a-b07c353e5d7mr289894566b.9.1757676001707;
        Fri, 12 Sep 2025 04:20:01 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd6f3sm348713966b.67.2025.09.12.04.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 04:20:01 -0700 (PDT)
Message-ID: <24b47c3c-1cd7-4dda-9abf-5032fcd1d30c@monstr.eu>
Date: Fri, 12 Sep 2025 13:19:59 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: SoC Team <soc@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: ZynqMP DT changes for v6.18
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull these changes to your tree. Pull request contain description for new 
k24 SOM which is placed on kd240 carrier card. Also new kr260 carrier card which 
is using k26 SOM (as kv260).
There are a lot of changes in versal-net.dtsi but just because of 16 CPUs and 
cache hierarchy.

The rest are small cleanups and fixes.

Thanks,
Michal



  The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

    Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

  are available in the Git repository at:

    https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-6.18

  for you to fetch changes up to 0e81960419ad186378b4cb55d7939d03c85262ab:

    arm64: versal-net: Describe L1/L2/L3/LLC caches (2025-09-10 15:56:24 +0200)

  ----------------------------------------------------------------
  arm64: Xilinx DT changes for 6.18

  - Fix some issues reported by dtschema
  - Properly mark EMMC devices
  - Update PSCI version
  - Update DP description and enable it on boards
  - Disable DEBUG IPs by default

  SOM:
  - Describe usb hubs
  - Fix PWM polarity issue
  - Add support for k24, kr260 and kd240

  Versal NET:
  - Describe CPU cache layout
  - Fix RTC calibration value

  ----------------------------------------------------------------
  Harini T (1):
        arm64: versal-net: Update rtc calibration value

  Michal Simek (10):
        arm64: zynqmp: Use generic spi@ name in zcu111-revA
        arm64: zynqmp: Remove undocumented arasan,has-mdma property
        arm64: zynqmp: Introduce DP port labels
        arm64: zynqmp: Enable PSCI 1.0
        dt-bindings: soc: xilinx: Add support for K24, KR260 and KD240 CCs
        arm64: zynqmp: Add support for kr260 board
        arm64: zynqmp: Add support for kd240 board
        arm64: zynqmp: Describe ethernet controllers via aliases on SOM
        arm64: zynqmp: Enable DP in kr260/kv260 revA
        arm64: versal-net: Describe L1/L2/L3/LLC caches

  Paul Alvin (1):
        arm64: zynqmp: Add cap-mmc-hw-reset and no-sd, no-sdio property to eMMC

  Quanyang Wang (1):
        arm64: zynqmp: Disable coresight by default

  Radhey Shyam Pandey (1):
        arm64: zynqmp: Revert usb node drive strength and slew rate for zcu106

  Rohit Visavalia (1):
        arm64: zynqmp: Enable DP for zcu100, zcu102, zcu104, zcu111

  Venkatesh Yadav Abbarapu (1):
        arm64: zynqmp: Update the usb5744 hub node as per binding

  Vishal Patel (1):
        arm64: zynqmp: Fix pwm-fan polarity

   Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml |  81 ++++
   arch/arm64/boot/dts/xilinx/Makefile                      |  24 ++
   arch/arm64/boot/dts/xilinx/versal-net.dtsi               | 410 +++++++++++++++++-
   arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso     | 390 +++++++++++++++++
   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso     | 455 
+++++++++++++++++++
   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso     | 456 
++++++++++++++++++++
   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso     |  40 +-
   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso     |  39 +-
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dts        |  23 +
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts        |   7 +-
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dts       |  21 +
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts   |   1 -
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts   |   1 -
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts        |  21 +
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts        |  18 +
   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts        |  18 +
   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts        |  18 +
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts        |  14 +-
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts        |  20 +-
   arch/arm64/boot/dts/xilinx/zynqmp.dtsi                   |  18 +-
   20 files changed, 2046 insertions(+), 29 deletions(-)
   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dts
   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dts

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

