Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806E83009F1
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 11:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677110; cv=none; b=ByzQECgzioCxniEFxc3nUEQ0WdrwfgeD09KAqXf+NGco4Gy5pkQExCEkkvDltNDEZY+aX7rV2eg3NF2VTNoM22M4WDzr3DzdjvRWPhoCJZDN5LDFzrFuzjSzl+Klm4M63yQkMkGK74/4+e/w0yNwsg3bV0n88E6uNh6ldhUQ9ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677110; c=relaxed/simple;
	bh=bOTAwnZl8SNZ0mcxrB4v3Tz5bxoDSVT/zfyxps2tfa8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bOM6rTqEHctqTlJom3giHOvBFZCYi3SuEUacxu0IoVh+L5Fp9R9u0xBXJhoNNKWaw8DO6msJ6aQhfGj5b5y1lK61/jMp4y4+b+Uwm9dmQOA0q0T3g6b8R9qdchZ1QWZXr2NurngtDpUmRQ0TplutA4JI2klAHr4QWY9+f24kK0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=qvybtoEN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="qvybtoEN"
Received: by smtp.kernel.org (Postfix)
	id 3B661C4CEF4; Fri, 12 Sep 2025 11:38:29 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 640D3C4CEF1
	for <soc@kernel.org>; Fri, 12 Sep 2025 11:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 640D3C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-ea3dbcc5410so414763276.2
        for <soc@kernel.org>; Fri, 12 Sep 2025 04:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1757677105; x=1758281905; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0xCcLz0xeAKx5n/UEUykcuqgh7EdPmjYCEV4CfhEznQ=;
        b=qvybtoENpTi3M90px+/3V+IAcMkjcs9Es3lw15pgQ1yK0dIf5ScfdEXYrI6BAGaV6C
         vbBUFMyFN/6OhGonppOe1Q92/iVHvcMn4364uu3Rgqlw8Wu8YvHOtFnSTcHfB8k5P6yD
         HwtNqquzhry/wGwKAXzJiyvXMJZmLiMQWobTl2UT/XwFjnipNBseo+WQb3VFnywNGn71
         pkqzWMtb2fLaebNEr1Hj+0l+y7r1vFqoVKP4wmHN7LPSThXRROkMuXQXEmpwbtNyPiwS
         SUtYetklqB1B7EjnPkOyoXvZUJzEFQp2ul0CQUSW//xggUB7uHhPyfDnNUW9I5BbdBKK
         N7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757677105; x=1758281905;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xCcLz0xeAKx5n/UEUykcuqgh7EdPmjYCEV4CfhEznQ=;
        b=PG5BTJ76M2vZWEhq8lLLcAhp6R4Nc1A6HDT3n60zmQkW6YXRINob6Q1VzIh/zbdt44
         QIpIVJG+KQWSoWq3PFDQmW2Dr1G26neV66foidOVi2GDqTDACG5Un3ufYGg+naxeRaps
         GyxKwBuJO8vb4iiUplKsdrXiIN1j4WqVZvvmt4TQ4DwJdnj6Bz7q0EociKKesVxKijFS
         AWmRPIUS+D1n9kkR5RvfgGnhaec8JLeC+dChrkNYZYAGiaLr0zKckBNmmAuGCvXMX+l5
         90O5Cx1+HR25xZmupWEybBiCZTu56gOhyBc72Bg4qU42i1JJ6mqiccWEYEEaDCSyHsQe
         /fow==
X-Gm-Message-State: AOJu0Yzegfpapo97npVWqSxbg2pX26ofz0kYjtE0XyoD0cq0krJpH1co
	weSnFfHi7sRpCmQ6C5gZW0DpnOMs3jy/6wkKy567WSY+gJaT4rcwbNums27LtiYDAqgPioSy7If
	NYD3vev/RZiFipbCjuXl03Bxmd9onnO0EiyOzEJht5ANKNToWTvr6jhUBLB0=
X-Gm-Gg: ASbGncvsD6jB1Ge495DQLed5vJ/Waw/HNoV50ilYJoYS02U0HAiCT/66KiuY0yN0Ypy
	2kBHuScMLPmql0Ljpfwfzu5r2aaLi34gIX/kMNXkcUenEral0Ytdx+RJ2AK/ohEMQISeSJm5EGl
	3BhI8CpfwFNloWY6Ulx+bZDxq9/qLOUFyJeYy3aSdOo/8Y+V3hSGypT9sGWnxW79jfoFD+8bcDx
	0Z9/rhF
X-Google-Smtp-Source: AGHT+IHomt3IVxngq/04+CycevFJTL5UsnTxN3HPA8yQj6kojY+b2IE4luQhzMGXxooXg9gISnBqG/EwWliSr5txeJU=
X-Received: by 2002:a05:6902:72f:b0:e95:2a4e:6e26 with SMTP id
 3f1490d57ef6-ea3d9caf3cbmr2422823276.52.1757677104679; Fri, 12 Sep 2025
 04:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 12 Sep 2025 13:38:12 +0200
X-Gm-Features: Ac12FXz16hCtqAIdxUPmYnu87QdzPPB-ONwoYmQp4XNsW_aV_6Sj1cqQsDx9iZc
Message-ID: <CAHTX3dK6if9f+-DW5ZEnfSO4=K_Zje-WH-fwysTY77farsSS9g@mail.gmail.com>
Subject: [GIT PULL RESEND] arm64: ZynqMP DT changes for v6.18
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these changes to your tree. Pull request contain description for new
k24 SOM which is placed on kd240 carrier card. Also new kr260 carrier card which
is using k26 SOM (as kv260).
There are a lot of changes in versal-net.dtsi but just because of 16 CPUs and
cache hierarchy.

The rest are small cleanups and fixes.

BTW: I am sending it again via web email interface because the first
email is visible on lore but it didn't pop up in patchwork
https://lore.kernel.org/soc/24b47c3c-1cd7-4dda-9abf-5032fcd1d30c@monstr.eu
Seen that problem in past that's why it's better to send it again.
Tag/changes are the same with the first one.

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
 arch/arm64/boot/dts/xilinx/versal-net.dtsi               | 410
+++++++++++++++++-
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso     | 390
+++++++++++++++++
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
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
