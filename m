Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794766064;
	b=Z2tE8+/EWjoUdmI4jgHqJCF5Q7aiD/wCOCM22Yym8f8yzuwKPPFmhYZwVSc51llEhN5u
	 aQAL4xGAcEAyCAffIQ4L4y1HmmVFjbB4xa9TURzeZTsdKmevFJsLM8mbNZweOUAOlnKDn
	 IYKmy5pvg2dSKFfVURBpXiSrFXvfe2EPOQgLlJXpib7cZYlJZ4h0hB/d5FdtPvcY/nMgT
	 nZWX7vWZgSwvgYmuCR0IWsoKXNZShjzR6K3D+PkO+5NCSOt7RKOl2OgXNrnr7mmdJO/y3
	 R7E0BYNqr3ec7Rs8geiE6FbSr3MXLMGAVwntLcdjhHfu/jxy2Jn+L+hWlqOju8Ns6ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766064;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=08ECguGEt5mKY5O0zhlWhlszKnOmF7Z1WUHLZizEhZg=;
	b=NDUzci+9QG+ToNg1Migl6SbMNPnvO56b5BEsRCiBme11mP5J9i9UMeGWfCXGx4YWKkor
	 8XLm1G+5WsWHXdwZTN+b3WmfVtcN0XNXx+xBnYrwSMO7WQhG9jtbSm+8pXuvGhEUZq5HE
	 SRIgE4AZXRZ9m0QNrwUAsvp6u9R0Smgt8Z6o3umhn1bAlKj8xnCY7plFob97FG/VantQa
	 EBzHzRH/N3r6KE1rifEa1gQZ9XXFtNM4NvJKV42ilK0L/EjdLe61NuP97BTV8GstPlpjQ
	 EzXCDWgfCY1yaMVV38l/tOBWw7zLjI9xV/6c25274y34VBqZB9JH95fGLUQkeEfNdWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwtEBNat;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A23606A31E
	for <soc@lists.linux.dev>; Sun, 15 Nov 2026 18:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwtEBNat
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A292B1F000C7
	for <soc@lists.linux.dev>; Sun, 15 Nov 2026 18:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794766063;
	bh=08ECguGEt5mKY5O0zhlWhlszKnOmF7Z1WUHLZizEhZg=;
	h=From:Date:Subject:To:Cc;
	b=HwtEBNatawJhYBqAdi26+Fuw/aOPiZ3JNzspnfWuZrU+HIohjDxnDHSDqTzUgchiF
	 ZOkcMXpKMfHTj9TbH2VDCFjSP4KG9RGJ45kCqedfev5aSOdpdGmod5B3htnOaRTGSC
	 8GgSkOMEMrDhn8eGEzrjbNtaAUrkdwgf8TE8cAdtRDvpm2LdK0obcXMoBOoJKvDFWL
	 LsltVAOsbM6/5PSEcfJoS7ABwP7vdKMlGOLyWbb/dTDbnDS2EPbMDTD3qrLQL6DeIk
	 93EAjCKz+lEmyCBxcSWA3YB4Ggn1bup8+iQgkvPh2ZfVgFvTEBnKyLnXkrU6ulcWi5
	 IKI2Gp7s3XfsQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso2482726e87.3
        for <soc@lists.linux.dev>; Sun, 15 Nov 2026 10:07:43 -0800 (PST)
X-Gm-Message-State: APuU4Z/Gf99I1SLc6ZsYlNE00LXfekjVL5aElUwHx/jRvu689RFgcqmk
	7Co6vqhZGGxQcueHv5GtJKc72QYMvHr/OqfdVaxmnCkCm2+4SvPTcqUq6FKSpwu+xHJctAUOaFE
	fAsU2OIUjFc9wakDKY+ZqZzitAz9DXWU=
X-Received: by 2002:a05:6512:b88:b0:5bf:dd05:3a89 with SMTP id
 2adb3069b0e04-5c170a0fce2mr3165979e87.61.1794766062318; Sun, 15 Nov 2026
 10:07:42 -0800 (PST)
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
Date: Sun, 15 Nov 2026 19:07:29 +0100
X-Gmail-Original-Message-ID: <CAD++jL=z=i8dKwA7XBjjM+tNXPmZDttCYz00gpkZE86Wwh1Mzw@mail.gmail.com>
X-Gm-Features: AclHuK8USlSPTfgH0T_EpOBmC23ixDquMOtn57B_dNGjY89wO27Ifa-8NHjtVYI
Message-ID: <CAD++jL=z=i8dKwA7XBjjM+tNXPmZDttCYz00gpkZE86Wwh1Mzw@mail.gmail.com>
Subject: [GIT PULL] U8500 defconfig updates
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

the posted update of U8500 defconfigs.

I have been told in the past, sharply, to split up these updates, so a lot
of patches. Feel free to just squash them into one or however you like it!
A rundown of the changes in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/u8500-defconfig-v7.5-soc

for you to fetch changes up to f908ea8a0f2de52dca6b19ef14885ed6f034fe58:

  ARM: configs: u8500: Enable compressed firmware loading (2026-11-15
18:52:05 +0100)

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
- Finally enable compressed firmware loading as Nura uses this.

----------------------------------------------------------------
Linus Walleij (15):
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
      ARM: configs: u8500: Enable compressed firmware loading

 arch/arm/configs/u8500_defconfig | 187 +++++++++++++++++++++++++++++----------
 1 file changed, 140 insertions(+), 47 deletions(-)
