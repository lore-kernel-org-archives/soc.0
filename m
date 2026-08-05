Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA55117A305
	for <soc@lists.linux.dev>; Wed,  5 Aug 2026 00:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891159; cv=pass; b=XLaHKGXoVVB04bHO9mBfYUtLvSEGL+kEpP9i44BXMG5qtECOdkqwFivXsoG2EbNL+5MKqE/WKtJuuDDgIIrMvXt7P4/8yadewAggUo+7cHSOqtLifPCOicsYhZwt6q+J5Ei4eaSOtTIITwJzQs5CLN//+DMCVFbCS44Mgrz3Wlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891159; c=relaxed/simple;
	bh=56hiyne624apknvimi7u0LpTLpDZsS3yZLYmu7BAF6M=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=WW4wDVqRczkRxWSnsbK3B5is6H5eJqK4R/uLVhZjkNqtPbs7ZFbK6OIwBJnZpwv8QOs8RVc5tI0K5Uy8/9xdcIUce9ju8PMv3P++Tk/7O9RJdVblqRuCGWB4/eva5fDczFLzyDL5HaWuKSH5XrWfe0ndVnVst/udL4+5GcgRk7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=b6bG/mXC; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="b6bG/mXC"
Received: by smtp.kernel.org (Postfix)
	id 9948B1F00A3D; Wed,  5 Aug 2026 00:52:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=95.215.58.180
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785891157;
	b=0VQHaH2eurmIY4TCRypRjXfBMBX+oCT6NT+P3/hZlXuAUHhZEYiMnT8Xa5+w5I0PTkAW
	 HEzHUqwdQ7AlTA1zyBLJ/mgPcdDHNP+I+rJs/apaL11rd7aGIH2jxxfEm0YVfIiqQFiVa
	 KCToBz3Wae9V1unm0DTlo8Ocmx1cL13dQLj/YA5fu9YIKtXRXnTXAWIds7gMoPnvnDrLk
	 Ej1wrPaMW1IvDTsjhV26TP82ZGrIJj4Q6JDTy4Q8EZ8NBRfHpHcAZHtuqn5B1c9H8I2HR
	 ZX9c4+o5ihIoHCi3MyuICV4+f/1JTbUPqXD1Snx47CfJFa5sTHS6rOLuuJfxe1H2EaQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785891157;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:To:Cc:
	 X-Report-Abuse:From:Subject:Content-Type:Content-Transfer-Encoding:
	 X-Migadu-Flow;
	bh=EuNoCf79ahJ9OpOUeOKUANKNhV5ApwmxWIkMZqLTnDw=;
	b=OtJh4Zh3maJnYIvUNXvvVgewAWrawA7fnJKHaxHwni7RmvwvKwTg/6lzAQVvcBd4IxoL
	 oiRBfgNylAh9MyuZX/cwdh/KOFYa37/Q+4Nrgz5qLJb9+RlPKtSFteYeuPuP4BxFFui1F
	 FcfHMpaR+xZaps+c3UzkDS5yxwhXzkYuvAfIyNpBaMf0rVit4NeKMGYQjALW86YwV1H0N
	 nf52EohithwdPjLg84vB7Vr3M8wH0sL8+uon14RCSt0FWgi9Tfqz0ghSZ3U5J4CNsSIhl
	 +1KQCvk/RjfcROV3HN1K7cuD5jvYPjyk+NJgRgmspWi3aIuC1hgyhoJf3xRup+Yi9Gw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="b6bG/mXC";
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.180
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 828041F00A3A
	for <soc@kernel.org>; Wed,  5 Aug 2026 00:52:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=b6bG/mXC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 828041F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <1333a916-da71-432d-99ae-69cdb6061add@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785891154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EuNoCf79ahJ9OpOUeOKUANKNhV5ApwmxWIkMZqLTnDw=;
	b=b6bG/mXCmHH/vT7Bls4RNpXm0eXbBS5Xn+I0G/MVu9L/S2x82DLCeAtxFKD1RB0xayM5Jv
	el4LHBhVEH1vpuCiICmNsuqGPtFF+dNyw3fRPQnJxlZ9mMtj6gGKdBXPXl/ZoGxy8ayU4Q
	609HS7ZWo1LeHw+kZcOAmNPoM+okok4=
Date: Wed, 5 Aug 2026 08:52:02 +0800
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Chen Wang <chen.wang@linux.dev>, Joshua Milas <josh.milas@gmail.com>,
 Chen-Yu Yeh <chenyou910331@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chen Wang <chen.wang@linux.dev>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v7.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hey Arnd,

Please pull this dt changes for RISC-V/Sophgo.

Thanks,

Chen

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v7.3

for you to fetch changes up to 59c682ffc76ebda27ecbbbd1423e23ec482d61b9:

   riscv: dts: sophgo: Add Milk-V Duo 256M board support (2026-08-04 
18:04:32 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v7.3

Sophgo:

The changes of this PR are all for CV18xx serials.
There are three major changes. The first is to allow
DMA multiplexer setting channel number for DMA controller;
the second is to add initial RISC-V support for "Duo S"
board, which uses SG2000, a dual-arch SoC (RISC-V and
ARM64); the third is to add support for "Duo 256M"
board, another dev-board based on SG2002 SoC.

Signed-off-by: Chen Wang <chen.wang@linux.dev>

----------------------------------------------------------------
Chen-Yu Yeh (3):
       dt-bindings: soc: sophgo: add Milk-V Duo 256M board
       riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
       riscv: dts: sophgo: Add Milk-V Duo 256M board support

Inochi Amaoto (1):
       riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set 
channel number for DMA controller

Joshua Milas (2):
       riscv64: dts: sophgo: add SG2000 dtsi
       riscv64: dts: sophgo: add initial Milk-V Duo S board support

  .../devicetree/bindings/soc/sophgo/sophgo.yaml     |   4 +
  arch/riscv/boot/dts/sophgo/Makefile                |   2 +
  arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  20 +-
  arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts  | 244 
+++++++++++++++++++++
  arch/riscv/boot/dts/sophgo/sg2000.dtsi             |  53 +++++
  .../riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 121 ++++++++++
  6 files changed, 443 insertions(+), 1 deletion(-)
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts


