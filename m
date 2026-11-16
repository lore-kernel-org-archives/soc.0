Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861242;
	b=TiBc/NoNI3jjDpskvg5k90QygB/vhBy8BgfnJHFJ9UpbGXUIrxeJLRp3f+b4WAc51UMe
	 5+xsiHTQ+u3Gma78tgdGgJeYKqof5UeSgd01QnD2Ap5reTsKeK3vacHG1fqzh80YB3nsY
	 1V0jZTELoaoBsUvUQeHVweIFznlu208QPbouho//n9HfxtCSr3zb0nmod2WLkrkRVfSg+
	 j/gGuS6+x0T8p316PXc4WxFDL8bd1dlMdpPctf1XwgxlmolZraBjIQv2pAg1acjB+lPoQ
	 ysLufHw8OLicOPXOa/jsussq3jHUEHafWEvNgCYOKlsoNwX8LgfniwiZunxZx8mtAUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861242;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ybyQzwZ3PkNAZEo66FI21Y1cWKk1p2Nf3GLBD7KeT88=;
	b=gYijfIdeddevIiEXoVw/lRVV+crR2Z2Ji0usbS+CYTT89H3jDQEfBUmQl0FNLtkOFVeH
	 kHwbrRiunqlE6sJf209xq8IR2HN47luj/sUQwSjQGmwq2+PZhoflWHF2padC22oDnyBpL
	 muZi9NjlphRDbKHfaNhkc3knQtrYRss5WRn+zfA0XvUI/y0fwEN4L18wG9ZQd0YQygrqC
	 hzElwL0pNVT4ty97XM85o2DIPoCkT9O+9twp2pFtqIYGzjovlnSw5neFbE+8oBxalXGIh
	 mS898JbpbJ/7UKzWqn7b6qORXHSgCwocg/1n7xX37znSsDLELJbULn+8fC0A89lJfvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmxZBvW0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2145606A322
	for <soc@lists.linux.dev>; Mon, 16 Nov 2026 20:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmxZBvW0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C621F000C5
	for <soc@lists.linux.dev>; Mon, 16 Nov 2026 20:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794861242;
	bh=ybyQzwZ3PkNAZEo66FI21Y1cWKk1p2Nf3GLBD7KeT88=;
	h=From:Date:Subject:To:Cc;
	b=bmxZBvW0kwJIoOGvPPEd0e0ogqTZTsAn3ZlV+DDdPDExH4/YJPwtEJXThl3u0reiE
	 cIYiIU86waGucOvI67ARn3UWomRx65RhC8ZGk0o9CxnE87hgPfqfQCIwzvsOMjW9+P
	 AKHfh2TETQ2NKuJ+q8oPB5fNxeTmoSpgu85fuDM66SYIbhciGOS2dABzKUeZ/LndBt
	 gTv+UaQ9ToS3d6/u9AAykHrIB54K9V0i+ZRy+X8qtPaDzaB17Baw111em54f81ha4z
	 5ZLVJmBoo1/FBYQuqUEd3WQWsFTQkfpk7rxr8YAPNPz7zcbDrrjhbUbXolFiZvCqaR
	 0WHk3JtFLVZWA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4fea434bso223010e87.1
        for <soc@lists.linux.dev>; Mon, 16 Nov 2026 12:34:02 -0800 (PST)
X-Gm-Message-State: APuU4Z9MHNCeo9xzLOrn+D4NKIg9nuuttSOgBOcv+axK7TZ350YDh5qP
	iRocS7e6+i1wgQT3wE6E7WckruWZMtJwHeBgOVznvOi9GPfdsfZPZjXtLNn85H1XGcM7IeXigeY
	NjHNSmiaX/Pq9Xf0JjDKKGd4w5VlSA6g=
X-Received: by 2002:a05:6512:3e02:b0:5c1:70b3:1975 with SMTP id
 2adb3069b0e04-5c1a0f0e2fcmr212994e87.17.1794861241041; Mon, 16 Nov 2026
 12:34:01 -0800 (PST)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 21:33:48 +0100
X-Gmail-Original-Message-ID: <CAD++jL=FzG1EMuZUZ3_14VqV-1U9=c06gCUJYaTZpAkdB9+5Cg@mail.gmail.com>
X-Gm-Features: Aa3M54qK7nT5lTq4DRQf3huPCFn-AZkG5Rxf3lO7hTcUY2eSx3gWnFsUCbF1En0
Message-ID: <CAD++jL=FzG1EMuZUZ3_14VqV-1U9=c06gCUJYaTZpAkdB9+5Cg@mail.gmail.com>
Subject: [GIT PULL] U8500 defconfig changes
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Stefan Hansson <newbyte@postmarketos.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

this is an annual update of the U8500 defconfig.

The details of the update are in the signed tag.

I dropped the tail commit off of this pull reques becuase
Stefan raised a concern regarding the generality of that patch.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/u8500-defconfig-v7.5-soc

for you to fetch changes up to 96561f4bc602db784d06e35c8918876036c08057:

  ARM: configs: u8500: Enable audio graph card2 (2026-11-15 18:52:05 +0100)

----------------------------------------------------------------
Annual U8500 defconfig update

This config is mostly used by the Nura (former PostmarketOS) project.

- Refresh to Kconfig changes.
- Update to contemporary scheduling and using e.g. the TEO cpuidle
  governor, BSD process accounting, PSI and autogrouping.
- Enable control groups and namespacing, checkpoint-restore.
- Enable generational LRU, DMA-CMA for memory management, disable
  PAN (too slow) and ramdisk commandline.
- Enable FUSE, DM/dmcrypt, squashfs, ZRAM.
- Enable basic IP routing, nftables, TUN and VETH.
- Move a bunch of U8500-applicable device drivers to be modules.
- Enable I2C mux (MPU3050 is the sole user but we need to support
  it.)
- Move V4L2 support (used for flash) into modules.
- Disable devices such as the STM32 MMCI we don't use.
- Move all IIO sensor drivers to modules.
- Enable some security features, crypto XTS, EXT4 ACLs, BPF
  jit compiler.
- Update Coresight debugging options and move it to modules.
- Enabled the Audio Graph Card2 as introduced for U8500 in
  kernel v7.4-rc1.

----------------------------------------------------------------
Linus Walleij (14):
      ARM: configs: Refresh U8500 defconfig
      ARM: configs: u8500: Update scheduling and accounting
      ARM: configs: u8500: Enable control groups and namespaces
      ARM: configs: u8500: Update boot and memory configuration
      ARM: configs: u8500: Enable storage support
      ARM: configs: u8500: Enable IP routing and filtering
      ARM: configs: u8500: Build peripheral drivers as modules
      ARM: configs: u8500: Enable I2C mux support
      ARM: configs: u8500: Update media support
      ARM: configs: u8500: Disable unused drivers
      ARM: configs: u8500: Build IIO sensors as modules
      ARM: configs: u8500: Enable security features
      ARM: configs: u8500: Update debug and CoreSight support
      ARM: configs: u8500: Enable audio graph card2

 arch/arm/configs/u8500_defconfig | 184 +++++++++++++++++++++++++++++----------
 1 file changed, 137 insertions(+), 47 deletions(-)
