Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFC839CD1B
	for <soc@lists.linux.dev>; Wed, 23 Sep 2026 17:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185141; cv=none; b=lqytqDfRCk9rkRg1sOnx24OvP8MsYPDfYSf4Zr5TIfitt/BtcbnMoHwzmtSCNoQ7tiUXew2rDWxCaaiydHcxzD2D/oZmVKivHOugeoMVAXy/ayzaNkCj/4XUZjZ9aZuk8SaHgs008KhnNQwg2gUT/aBVKZRVCdjYb5CD0+ar2eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185141; c=relaxed/simple;
	bh=V/CM2w4mso3fjTO9dgk8i3O6ut+9rQDE5c6NnvmY6Tc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bAb0mQP4e7L/nHZArRWnOTMdLUU52TYQqPmu1jqhuV71T71XQDyaWIKGxYUQdx6cXhJGw+IXDuAoy2q058tuFYkOhIJstZLFe12oPVecXiQ+SptnWb9V+OdzfBgsC4mN55X4gUI7DLrcUrTsPHTBEfkDt2u2CWahrkCbnackYC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxECRYFe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxECRYFe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B99B1F000FF
	for <soc@lists.linux.dev>; Wed, 23 Sep 2026 17:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790185139;
	bh=X3Dz7N7QGHbQwYa5WsCw9yQmpC/vJhoS5WH6xkTIDi0=;
	h=From:Date:Subject:To:Cc;
	b=KxECRYFeQk0mtr3IwnYW8h2AGOyQOTAZkrsJHeSIZYYLmi7q97DUGkVinv+Zgi/VQ
	 q2d/i/QLf78Ksxn0ol5iV6P2n/lzFZDwTvgvtwZrGECcP2kb1w+pJTq9+6Kn1elmKX
	 MQE87bNBrjlIIPimvDyfA4LZmml9ZrgFKKntsYIcHS79ceGNu0QkR1HJRRGGAccQxf
	 YTX0j46Wtle6cnQvxbUdG0hD7iHuJW56kTwEhZXH3eX/8nxqJVuMP89H44iLl6mPhd
	 h4g5jLEBn5XJgPVblL4AHjKg4YW+nwRw2FJEJPeqDgDfKyz29q39lBAxtuQhnKvlsd
	 fz+39Y6Hp2/bw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c7a1aeecso1020024e87.3
        for <soc@lists.linux.dev>; Wed, 23 Sep 2026 10:38:59 -0700 (PDT)
X-Gm-Message-State: AFuF++k2PCAAnXurJqCxQUqeWP1PXLBAANjprWABkW8MTB/sh/PprlmY
	IqORKx9/oF6PambTtiAEFDwu6XVuQ0SM5kTs73V6pWbqmfNXM4kv1Tf+V7+EyLmFyHYsIyQGdBD
	RDLlWfMLrLPRtmsdvKp1JKvP1OsNbQ/k=
X-Received: by 2002:a05:6512:686:b0:5b6:421:a8fe with SMTP id
 2adb3069b0e04-5b8d89879abmr1148004e87.30.1790185137896; Wed, 23 Sep 2026
 10:38:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 19:38:44 +0200
X-Gmail-Original-Message-ID: <CAD++jL=vbc7DM1RB8_VfzWJhT0ZSGYegKN7NKJLbBB7bgFio2w@mail.gmail.com>
X-Gm-Features: AclHuK-PElKFo5r6uKqq1C1ypD1sqrRiCmOg_F9a7RVZb_GNAFVamkjOTfqm4PQ
Message-ID: <CAD++jL=vbc7DM1RB8_VfzWJhT0ZSGYegKN7NKJLbBB7bgFio2w@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS changes for v7.4
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

please pull these DTS changes for Ux500 for the v7.4 kernel
cycle.

Yours,
Linus Walleij

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-for-7.4

for you to fetch changes up to 2eb92e6b94b612eccb53366f65018ae5e8d072d5:

  ARM: dts: ux500: Add Samsung phone audio graphs (2026-09-23 19:26:12 +0200)

----------------------------------------------------------------
Ux500 DTS changed for the v7.4 kernel:

- Make panel regulators have unique names, duplicates found
  when trying to use the DTS with U-Boot.

- Harmonize the GPIO key names, as U-Boot want to have a
  device-neutral key name to look for.

- Add the Imagis ISA haptic feedback to the Gavini and
  Janice DTS files.

- Add proper regulator defines found when working on the
  proper power domains. (Bindings are in the regulator
  tree.)

- Switch the audio to using the generic audio-graph-card2
  binding and drop the old custom binding. (Binding patches
  are ACKed and will get merged to ASoC and MFD trees.)

----------------------------------------------------------------
Linus Walleij (9):
      ARM: dts: ux500: Make panel regulators have unique names
      ARM: dts: ux500: Harmonize GPIO key names
      ARM: dts: ux500: Add the Imagis ISA to Janice DTS
      ARM: dts: ux500: Add the Imagis ISA to Gavini DTS
      ARM: dts: ux500: Add new AB8500/AB8505 regulators
      ARM: dts: ux500: Fix up regulator assignments
      ARM: dts: ux500: Add sound DAI provider cells
      ARM: dts: ux500: Convert HREF audio to audio-graph-card2
      ARM: dts: ux500: Add Samsung phone audio graphs

 arch/arm/boot/dts/st/ste-ab8500.dtsi               |  35 ++++--
 arch/arm/boot/dts/st/ste-ab8505.dtsi               |  35 ++++--
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi               |   9 +-
 arch/arm/boot/dts/st/ste-href-ab8500.dtsi          | 104 ++++++++++++++++++
 arch/arm/boot/dts/st/ste-href-ab8505.dtsi          | 118 ++++++++++++++++-----
 arch/arm/boot/dts/st/ste-href-stuib.dtsi           |   8 +-
 arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi   |  14 +--
 arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi   |  10 +-
 arch/arm/boot/dts/st/ste-href.dtsi                 |   2 +-
 arch/arm/boot/dts/st/ste-snowball.dts              |  10 +-
 .../boot/dts/st/ste-ux500-samsung-codina-tmo.dts   |   1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts  |  25 ++++-
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts  |  61 ++++++++++-
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts  |  11 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts  |  59 ++++++++++-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts    |   5 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts  |   5 +-
 arch/arm/boot/dts/st/ste-ux500-samsung.dtsi        |  77 ++++++++++++++
 18 files changed, 506 insertions(+), 83 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/ste-ux500-samsung.dtsi
