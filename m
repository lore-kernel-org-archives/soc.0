Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5B734DB6C
	for <soc@lists.linux.dev>; Mon, 19 Jan 2026 08:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812535; cv=none; b=kcTOVTswiYrrBCPWRPwcI1IyC8CInBjCIu0JtBU/0MhBdPCWqy1WWPdn3dliNM3FFlXEkWY8IoOscOmDR6BJoDii6QvylemHEh5vKi0uPlfgzn+1LwzOt6BK+tQpD1Pj/Hdbun3xjus87QuyPvdeU/uXBeyPOhMXtDwUyv/FeOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812535; c=relaxed/simple;
	bh=VeKp0a0F+C4uleB7QJEqFkfh7SxZXfn0voKhm/oU5xA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qiQHwFpNw10kr5PQTvtyUYJQerzcdup0gdvPKjttaZ3Npkii4YK4sQO0jOwu1MTiB9l/niBIfaMT+9GdNHhJA+Z5G66g9GKnVudLnTgbah41ErwSlj+uAJRY1920FrvMg7V7oamvXv1g/aj0NY2bGDayiygADy2cmHnYo0KpnGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=qTb1v3zZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="qTb1v3zZ"
Received: by smtp.kernel.org (Postfix)
	id ACF0BC19425; Mon, 19 Jan 2026 08:48:54 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DE0BC116C6
	for <soc@kernel.org>; Mon, 19 Jan 2026 08:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DE0BC116C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78d6a3c3b77so52096407b3.0
        for <soc@kernel.org>; Mon, 19 Jan 2026 00:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1768812532; x=1769417332; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F8BQe+2TW0VIBQx8KKIHuEA4LsivO9fwNmFb+U3jxVc=;
        b=qTb1v3zZv1idonr5k5fo77oNIBcKYvaTX1HIthWK2hcHV7VQpsTPwiylfwSVqpZM2P
         tp4RsKrtUjB7Afmf9/pLANZKTNiD8v5nA6m8i9qd69y9vfRmqY9Om/wZRGR6DQvDWZYO
         M/XQosf767u+RLrCXrVMKs7QHDYNw1eH4pQlb01ZqkdI/uYnf8LK6mcxVbN/TK+nH6Bt
         Rdze5UHxJgweXwDXdsVGIOIPzAaZOgP/22jlvow1EfEqbmpt7xOOQprCleLFl8RuIO7Q
         8AIachdV3RvHhIKfJlYVqd0it6Tr7nu9cTSi0dZFjYeujBu0B23y6G111d1stXNpR9sm
         IkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768812532; x=1769417332;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F8BQe+2TW0VIBQx8KKIHuEA4LsivO9fwNmFb+U3jxVc=;
        b=dw7Ou2DWdyGuIyp1Pcjd9KqSLyAnmTestDLBMOfFoJnHZX5zCUcGWK13BCzgUuNpW4
         mIOeePnAUOo4Uku4+V4muCfgsYQOUcHfAC92Qb7TsoKfCTlBobTG5AJX00Wuw08VB21p
         ikNnzicwAajtJYgvZRxsOW8r827PYHROtpmVhf3/Pj2mrRDXYje3M35Z+f8fTAgeHPiW
         TOk4WZFTx9J8vy5mwPXtcmomd1VdI4mX2L6iAiSG20b2OnIa5edW1gyAHW1+PHT2Hl2a
         5WrWcTpnuIE9SMTCtBDC687TDb9TVLmhn+qgJkPrYck2/mDiCawCupdUP79WZDW2weo3
         BqIA==
X-Gm-Message-State: AOJu0Yx4LAxqOQ97ROYuDJnKZKuvidbQZY3jEVV7TbdDmIqL0eVGb0AW
	73PWoqyKCNXV++s08pXUdp3qcCud/Kz6+L5vYa6dmZfq6iuq9uD7WThIf/mPrnwB5UX5ngroclf
	zJSsl8gALoRVvbGSZWm1l28PN7CwccBI1l1W6PDLVn291u4C2g2S940b9x70=
X-Gm-Gg: AZuq6aJW1aZX/1f2of0GDe14HimbhKx8vxZ15Mvz/B+SUPZQb85+HEK7yI3sFCh7qbi
	i4hktwz766dY9P31D9KhBJ9qLkGNtNz8aq2YNoTFBfNiEJi30rcEZwjLBvnvI7tOvmEmq5xwhqD
	hx2N5oC/ZU5A4tcmuim7ENRTF+pRP+B+oKSxR+nWXIEp0jO+98EG0k5nj72R/ZB+2zbrg+D+AuI
	iaH2GFtcQVDsxSTpl9iQiHWKOHSDgydfKOemW9XZwU6gpNON7MsuIwUgd0BS7fR6P0/hqcc
X-Received: by 2002:a05:690e:1486:b0:644:5309:3e3f with SMTP id
 956f58d0204a3-64916902980mr7763421d50.4.1768812532000; Mon, 19 Jan 2026
 00:48:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 19 Jan 2026 09:48:40 +0100
X-Gm-Features: AZwV_Qi1XfZwIEC4heGsnwiYFtgdbIT5b5PtFmWw8crpibmfGC19IqOi9UD3jOU
Message-ID: <CAHTX3d+S9MP6HS7=5X92F=g8S9QZ15wHmRf=VvFd2Qgd0uSu+A@mail.gmail.com>
Subject: [GIT PULL] arm64: Xilinx DT changes for v6.20
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these DT patches to your tree.

Thanks,
Michal

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-6.20

for you to fetch changes up to 4310a370a323901b42f0ddd119a53af723f3359b:

  arm64: zynqmp: Remove ina260 IIO description (2026-01-06 12:33:38 +0100)

----------------------------------------------------------------
arm64: Xilinx DT changes for 6.20

- Cleanup SPI compatible strings
- wwdt: Add optional power-domains property
- ZynqMP: Fix OPP description and setup
- ZynqMP: Remove OP-TEE node
- Drop label from dlg,slg7xl45106
- Remove ina260 IIO description

----------------------------------------------------------------
Conor Dooley (1):
      arm64: dts: xilinx: add soc-specific spi compatibles for zynqmp/versal-net

Harini T (1):
      dt-bindings: watchdog: xlnx,versal-wwdt: Add optional
power-domains property

Michal Simek (1):
      arm64: zynqmp: Remove ina260 IIO description

Neal Frager (1):
      arm64: dts: xilinx: fix zynqmp opp-table-cpu

Rob Herring (Arm) (1):
      arm64: dts: xilinx: Drop "label" property on dlg,slg7xl45106

Tomas Melin (1):
      Revert "arm64: zynqmp: Add an OP-TEE node to the device tree"

 Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml |  3 +++
 arch/arm64/boot/dts/xilinx/versal-net.dtsi                       |  4 ++--
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi                   |  2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso             |  7 ------
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso             |  7 ------
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso             |  7 ------
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso             |  6 -----
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso             |  6 -----
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi                           | 25
++++++++------------
 9 files changed, 16 insertions(+), 51 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
