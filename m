Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B34201269
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964070; cv=none; b=Eicx0bQL5/UgYjAux1IdRDeQrhoxzjuK2vRSApDtB8GK60pMPwEA86h+NaIN79QOd++9Dk7eRVCe2ZTmvV8NBFgoNKHudl02Jym7TnZqi2Y3+fnfUcTEaYU3G91SX5HSMbzSO4gACUJov9zgfLCtbVt9yAwjJ1fHgqQjaulHsUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964070; c=relaxed/simple;
	bh=dj/UntRlSee00r5oZP1xiZFAODTI5VoTSIz9hXxjkXg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WUFBmXlk/GOYL0Z4Bb3xahkG1WkQldJJcK5zPr6LZqt0hjM0b6h1pM93max5dq6WlMSSdAtWdBVwWJMdcvqB0PPXORIK6a/iUc8fiyqDQ2Z3my3z5bkYFqgGmSg0Qjs+/gKJ5CBiqqt5mIHXpdHM5c9fuXaH0CHx3uXrW7xJiZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=iOQAjKTH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="iOQAjKTH"
Received: by smtp.kernel.org (Postfix)
	id A2720C4CEF0; Fri, 14 Mar 2025 14:54:29 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BCDC5C4CEE3
	for <soc@kernel.org>; Fri, 14 Mar 2025 14:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BCDC5C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6feaa0319d8so17809497b3.2
        for <soc@kernel.org>; Fri, 14 Mar 2025 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1741964066; x=1742568866; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NzC3BRogCFa6d++rf6QKoC3iEoj7rrXmy2jmqgWPJRo=;
        b=iOQAjKTH7Q/haXiUA5Zj6lkLTGm1R9wrUUmAxtsC3Bf3DXF96PTbylhGVkWNVhVzYR
         ylFHQc44eyvYchJ3ioBehrBBPZ4LZZGgBTzc+sw3+6qNEgfemdsVjm4CPiVCSGwANNbd
         zF+CeK30vICQx1nIEmqljmmJgJG/xuSDiosMg5A7Win3xDjig0Yz0nCpBJ3Wvh2Jz/DE
         pvoSiGXW2vg4C7wZtLPw6hR+UBj3HyJnqYwsvfmlKO3p1G0txuw5oAOfNkT8jJSqqkLc
         u024rdUHCbTOzMz6HWglU4tcQzGjIR36oSqFAYdXLWSPP/lzvrCPad7eCiMljyx+k3iT
         EL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741964066; x=1742568866;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NzC3BRogCFa6d++rf6QKoC3iEoj7rrXmy2jmqgWPJRo=;
        b=Uc8REExobTCC9hItnYXIa4iqXCyq8YSwXnQTeOMl50dguR1VBiHKlu4co14pVJw9b3
         jEvRuBMFmu10+gRrEYiwUW5k9QxvZO/5qGPV2a2a9AXBYHUUa0OCijYPol6WhuD2nfcX
         1zHGhCkf5TA9V1Aed8/6adMFqS/LaHNUxOFfszcyLHLI6zEyVbiE77I8fQ0ZAvrncQMk
         jlEKBw8+2z6/ZWuJH4XdzuSR1bK9bP1qEXX3ZMddHi7f0MsZPiRgcmQDXUEr8lnEAq7a
         BVUUCcYLFUPTuj9VwAcBMm5Y2HiOCJX0wXGto+o70UP6N73ifMLYaGnlZWYi/D/iMeuf
         06qw==
X-Gm-Message-State: AOJu0YylKa+R70n7WgSw/tWbchzH+MK1NdWrSd1NMN2sxlbDMlgolBhr
	ormOOwmEbKUxV9jEKkgn8fFAQguXS/OqISaBIUgMuFC4EOKpzCM7AIZOscqxWv1OYPgBxHi5+W4
	OA5UH5rpxPKfimXs2LA1POtT8eUMNDsw69VRO8JZpdoDAoO/zHt7H
X-Gm-Gg: ASbGncuCesmZki5S99RK8m2NeOM/TiObKASShZDTDuqV9plz2sPoagjLNhPYblO9vy6
	IPfc3zLdIYNuGMoMjuvkhpZ2TLnidAFJAVK7UxyVM/p9CM/fE2gxfLVLqzXnWqMA2K41TY3BJBb
	tNwWFXr+LJGo/URSjoS86YBDcZmolqqYVeXaua0w==
X-Google-Smtp-Source: AGHT+IFNMdPX2/JuPihrkOHkg6AZwt4eczqKvsFLvbiLk/cBs+yPz0peI9CqZy5qQMB+pmiHaSH/3ljKk7zMLLi7pf0=
X-Received: by 2002:a05:690c:4b04:b0:6f5:2793:2897 with SMTP id
 00721157ae682-6ff460cec41mr35571277b3.30.1741964066419; Fri, 14 Mar 2025
 07:54:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 14 Mar 2025 15:54:16 +0100
X-Gm-Features: AQ5f1JqEpqzo5ehgw93FAfaSlHfkImMnJOCozT5iFOXGjzmpO2JpeBhsM498DmQ
Message-ID: <CAHTX3d+DZo3thrakBf=QCq91QFeChoizuhVa6oBBj9E+sdEXAQ@mail.gmail.com>
Subject: [GIT PULL] ARM: zynq: dts: changes for 6.15
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these patches to your tree. The most of them are just
aligning current descriptions with DT schema while also adding some
description used in U-Boot which also went to DT schema (like u-boot
node and QSPIs).

Thanks,
Michal


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynq-dt-for-6.15

for you to fetch changes up to 6fd90200aae269daa2f0e86be7bf50246837f9f4:

  ARM: zynq: Do not define address/size-cells for nand-controller
(2025-02-04 09:32:09 +0100)

----------------------------------------------------------------
arm64: Zynq DT changes for 6.15

- Align platforms with dt-schema
- Describe QSPI

----------------------------------------------------------------
Michal Simek (13):
      ARM: zynq: Remove deprecated device_type property
      ARM: zynq: DT: List OCM memory for all platforms
      ARM: zynq: Mark boot-phase-specific device nodes
      ARM: zynq: Wire smcc with nand/nor memories on zc770 platform
      ARM: zynq: Define u-boot bootscrip addr via DT
      ARM: zynq: Point via nvmem0 alias to eeprom on zc702/zc706
      ARM: zynq: Define rtc alias on zc702/zc706
      ARM: zynq: Rename i2c?-gpio to i2c?-gpio-grp
      ARM: zynq: Fix fpga region DT nodes name
      ARM: zynq: Enable QSPIs on platforms
      ARM: zynq: Add sdhci to alias node
      ARM: zynq: Remove ethernet0 alias from Microzed
      ARM: zynq: Do not define address/size-cells for nand-controller

Sai Krishna Potthuri (1):
      ARM: zynq: Replace 'io-standard' with 'power-source' property

 arch/arm/boot/dts/xilinx/zynq-7000.dtsi         | 33 +++++++-
 arch/arm/boot/dts/xilinx/zynq-cc108.dts         | 41 +++++++++-
 arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts      |  2 +
 arch/arm/boot/dts/xilinx/zynq-microzed.dts      | 10 ++-
 arch/arm/boot/dts/xilinx/zynq-parallella.dts    |  1 -
 arch/arm/boot/dts/xilinx/zynq-zc702.dts         | 85 +++++++++++++-------
 arch/arm/boot/dts/xilinx/zynq-zc706.dts         | 67 ++++++++++++---
 arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts   | 39 ++++++++-
 arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts   | 31 +++++++
 arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts   | 35 ++++++++
 arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts   | 41 +++++++++-
 arch/arm/boot/dts/xilinx/zynq-zed.dts           | 43 +++++++++-
 arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi |  8 ++
 arch/arm/boot/dts/xilinx/zynq-zybo-z7.dts       | 10 ++-
 arch/arm/boot/dts/xilinx/zynq-zybo.dts          |  9 ++-
 15 files changed, 404 insertions(+), 51 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
