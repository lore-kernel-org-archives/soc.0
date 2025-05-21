Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA26C12E5D
	for <soc@lists.linux.dev>; Wed, 21 May 2025 17:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848233; cv=none; b=ur0VDiC/fYzDq4sRGT0D9QWP5Q7ozMniZduYcTy0F01pUwIzzqimgb3TaL4StXM0njrpPq6HIKGx0HA/BEnCqrhlz1B7sICx4+hpheZvNY+wJ/onmv3NUHPAmEim6lWO2u/U6RsJsgx4Gfdwjc416rW1KsP/vL5WvqpwEEBkttM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848233; c=relaxed/simple;
	bh=gN+J4ubiN4naZwhYRosCIoQAr72gcMyjo2CEbw7BN3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GKQnimydzV7XMoXDzuT5FlKhGmuYaMe3deaRcGAe1U6LmytgbY/EHq8lY23DMeGJ5oGDeuQjI4WTQICx5fMXzIEckR7pZzNt962O8LxjchJJWopF33Y/USFCVQ0gYTerUl3U7qJRePcbtz5HjHW6kg2xs2AVdmB97bJ/uZa59E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=zBzNq6oZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="zBzNq6oZ"
Received: by smtp.kernel.org (Postfix)
	id 9288DC4CEE7; Wed, 21 May 2025 17:23:53 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 037B6C4CEE4;
	Wed, 21 May 2025 17:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 037B6C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=6oSDxFFtYr+MnJZ3OE1HOzLnfG4kEMq0akR2q3Fp0N0=; b=zBzNq6oZPLcwPwlncO/qTqymQx
	IFeI2aM5VvK6Tk+st2FKUQTZjp+0m/j4i5hH+KhvH1cv4SdBEq/1YHknlQsi2mR8O8HaMl15P6N7z
	eKRgwyUxRv4zeA5cr2NcZSzTaQ2Eyp5Izv/5NTKQnqNdQwnVOqxd7vIgwn4PIrDdO4hUfnqEBZDfN
	lV223zMdxu7vtKRPFI566NFQLovur3Ukl/NxKkCcguu2som5vKbcv7/yrLmkAtrdg4Xhvb1kLY7tZ
	20ab3rCtz32koBqTGnI2YWMs0rL48AWJokZY5iCebBVfK0Sjuuh4GHVgJyB0so6Jdcj21RJk/Iuoq
	oor36pqA==;
Received: from i53875bdb.versanet.de ([83.135.91.219] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uHnAT-0001ay-J5; Wed, 21 May 2025 19:23:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.16 #3
Date: Wed, 21 May 2025 19:23:48 +0200
Message-ID: <4798229.ejJDZkT8p0@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below some sort of late fixes for some non-critical
things.

Please pull.

Thanks
Heiko


The following changes since commit 1631cbdb808963354ef6b6454bc617cd15f90718:

  arm64: dts: rockchip: Improve LED config for NanoPi R5S (2025-05-15 14:57:44 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.16-rockchip-dts64-3

for you to fetch changes up to dfab90b9580c2fbc4e8bb4ceee97cdd75832a6e7:

  arm64: dts: rockchip: move rk3562 pinctrl node outside the soc node (2025-05-20 20:57:30 +0200)

----------------------------------------------------------------
Power-domains needed for stability, dropping of unnecessary assigned-clocks
(handled by cpufreq) and fixes for dtc W=1 warnings.

----------------------------------------------------------------
Diederik de Haas (1):
      arm64: dts: rockchip: Drop assigned-clock* from cpu nodes on rk3588

Heiko Stuebner (6):
      arm64: dts: rockchip: fix rk3576 pcie unit addresses
      arm64: dts: rockchip: move rk3576 pinctrl node outside the soc node
      arm64: dts: rockchip: remove a double-empty line from rk3576 core dtsi
      arm64: dts: rockchip: move rk3528 pinctrl node outside the soc node
      arm64: dts: rockchip: fix rk3562 pcie unit addresses
      arm64: dts: rockchip: move rk3562 pinctrl node outside the soc node

Sebastian Reichel (1):
      arm64: dts: rockchip: Add missing SFC power-domains to rk3576

 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 136 +++++-----
 arch/arm64/boot/dts/rockchip/rk3562.dtsi      | 242 +++++++++---------
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 355 +++++++++++++-------------
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   6 -
 4 files changed, 367 insertions(+), 372 deletions(-)



