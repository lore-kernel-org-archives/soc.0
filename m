Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D306386C30
	for <soc@lists.linux.dev>; Thu, 28 May 2026 08:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958106; cv=none; b=Gp2uHxlfa6j6hTbzAlU0XNLA2Ak4RGKR3H7RSbWK0Pr5Kg7MrBiRl3HKLTNtQYOu6zLKqA35cBAgcmfuTUN5IZ4vNcwjJc0wXgXRfYEcT7UV9npQLKH7rduTScFmLDN53KNwaOf/XXHyN+AnIh7NLyv+K8aOH+LzsMElDUIifWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958106; c=relaxed/simple;
	bh=vp+mRKbsL1NPgicjfURTD/SJ5L1J+o45tzrNrNb1JMg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AzMMLVi+jr8cjmmwvVswAWRgsgRiK5XBT3d6xVX0lugIO4ZomTXKgnHiKmOFm5aNAU6M/bpU8d+//7+EZcSFeMwSTLZSjexT4C2DFxkNJ8qAHsGV81oXFCdrhH85HGIQleoABbdtr8lb4xprau+ut7mY6hc5V77ffvHSTVruNhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QdMpBHCg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdMpBHCg"
Received: by smtp.kernel.org (Postfix)
	id 44E0F1F00A3E; Thu, 28 May 2026 08:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8561F00A3D
	for <soc@kernel.org>; Thu, 28 May 2026 08:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779958105;
	bh=6+phZfXHAAOWSe43jY4iEDeIVY0auY/gXg2dprHrXHY=;
	h=From:Date:Subject:To:Cc;
	b=QdMpBHCgV3zBSc4CYi0AvkmqhfL5trfwzCVmnb+gReek/lD/Q87OfHeiOhSRvNDu1
	 Ht03cZGnYqH8kqFZe+kC8HJ+m6aeU/9CjqJpaCtHoSYDZSKHrETHQOtIXHos9rPe6K
	 P80y/jcsReNrqKMfV3ALdfi/L+RqYu4XZu2aqSXRA+2wKgNEqoQv/JgUJaTBmkiKWz
	 8dCh7mqAgVbx4ENNUBvD+9iZdQrOiBEdtw3XK7ARVod6IVM2Xo5tQobAleVHM9uzIM
	 IfBCBHpSAfZoR9wD4szhG+Uw/7sc+HWFP7Ji/E2le6/0ZesTAuqNFNpzCHL8PSmo2L
	 xj4zTAbL6yrSg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso12316729e87.1
        for <soc@kernel.org>; Thu, 28 May 2026 01:48:25 -0700 (PDT)
X-Gm-Message-State: AOJu0YygT973xdTAwx1w2RLFJQg9tyVfvRW3vCJlr+fJyKAFKM/1h0ZN
	dMdec/J3d+VFqqiqHaAiegdToB0jQlo8atqQncqKdXqoqw9RIX0/LNb0qXp/WqZOOMh52OxC5n1
	YgnSxxyoXo34Qkib0JvCbZyNbIa9mW8U=
X-Received: by 2002:a05:6512:159b:b0:5aa:2a6b:c0ed with SMTP id
 2adb3069b0e04-5aa3237096emr7698159e87.10.1779958103957; Thu, 28 May 2026
 01:48:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 28 May 2026 10:48:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLkQ8FEFL4fbOgt+pbT3orGm90Xt1bFeGCKyB-Th=qOrjw@mail.gmail.com>
X-Gm-Features: AVHnY4LYV0NVvQ3b1yFPz2ZhtORvQzKWhrCgwYSUKdkOvBfUgossOMgOPO5x4Vk
Message-ID: <CAD++jLkQ8FEFL4fbOgt+pbT3orGm90Xt1bFeGCKyB-Th=qOrjw@mail.gmail.com>
Subject: [GIT PULL] Gemini DTS updates for v7.2
To: soc@kernel.org
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

sorry for late pull request for these DTS changes. Had too much to do.

The changes were posted to LAKML here:
https://lore.kernel.org/linux-arm-kernel/20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org/

This pull request is rebased on v7.1-rc1 and ACKs picked up,
otherwise it's the same patches.

Please pull it in.

Yours,
Linus Walleij

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/gemini-for-v7.2

for you to fetch changes up to dce8e0cb88fb12d068459b75f299ff2242172257:

  ARM: dts: gemini: Correct the RUT1xx (2026-05-28 10:38:45 +0200)

----------------------------------------------------------------
Gemini device tree updates:

- Add two new devices: the Verbatim Gigabit NAS and the
  Raidsonic IB-4210-B, including ACKed binding updates.

- Fix up boot device for the SQ201.

- Use the right LED trigger for disk activity.

- Add the SSP/SPI block to the SoC.

- Fix up the RUT1xx device tree.

----------------------------------------------------------------
Linus Walleij (8):
      ARM: dts: gemini: iTian SQ201 need to boot from mtdblock3
      ARM: dts: gemini: Tag disk led for disk-activity
      ARM: dts: gemini: Add SSP/SPI block
      dt-bindings: vendor-prefixes: Add Verbatim Corporation
      dt-bindings: arm: Add two missing Gemini devices
      ARM: dts: Add a Verbatim Gigabit NAS DTS
      ARM: dts: Add a Raidsonic IB-4210-B DTS
      ARM: dts: gemini: Correct the RUT1xx

 Documentation/devicetree/bindings/arm/gemini.yaml  |  10 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/gemini/Makefile                  |   2 +
 arch/arm/boot/dts/gemini/gemini-nas4210b.dts       | 205 +++++++++++++++++++
 arch/arm/boot/dts/gemini/gemini-nas4220b.dts       |   1 +
 arch/arm/boot/dts/gemini/gemini-rut1xx.dts         |  18 +-
 arch/arm/boot/dts/gemini/gemini-sq201.dts          |   2 +-
 .../dts/gemini/gemini-verbatim-s08v1901-d1.dts     | 225 +++++++++++++++++++++
 arch/arm/boot/dts/gemini/gemini.dtsi               |  17 ++
 9 files changed, 470 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm/boot/dts/gemini/gemini-nas4210b.dts
 create mode 100644 arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dts
