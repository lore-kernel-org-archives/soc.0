Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F04F18C00B
	for <soc@lists.linux.dev>; Thu,  9 Jan 2025 23:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736466068; cv=none; b=EYmfOSIHXI1JZVpCU83mVDuF5KCyYBDq5tkrkhnIug7/fipEU0OtJzzGYyoIcTnH84ENHulkwJ9W0CGzLY/ntGJvj+lG4h223P/Jh6Dh7c8qUvCiUjU6llBybwrDAEfUaW78DYF9z9QndmFhdV/jGNmu3lw8MqDV9Jk6fkuI+mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736466068; c=relaxed/simple;
	bh=+xLexml2y2jXbd616OCPjh1TUwIXUe3SR77Kv694wnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K31hxS8/rF8FnDTe40MzSwjv+3uVH4QLnpOR3Jba0XQAtKctZaH3iS4y+8SrtcOl+mkizexeMwu6/9XhxTS498knAwz7C/gjwaSZZMWdFNE6LfsB9cnT280kO/4Eb5nr7u0ggYsHe9xrbICl9QbI//ObSu0REo8dYwrcwW+weLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=lLLHsxoM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="lLLHsxoM"
Received: by smtp.kernel.org (Postfix)
	id EC7ECC4CEE2; Thu,  9 Jan 2025 23:41:07 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5361C4CED2;
	Thu,  9 Jan 2025 23:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5361C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CCwkpfXDoQaZgZ8Xc4UlCtB7f0UuyMqkC2zDaBf0+/8=; b=lLLHsxoM89bgqclLNxeeIxMlOc
	RwoYePVicTBFPlb2nT3YmPYkrEJqFQbjs9aei760XewYqXQvGjvzPp4hmWQNdLDOQAeYMfv6DB/hJ
	5Fu0o04u9WfbZZE+BX+QyTvpkLANiXC32WyWEvJmbZJhdC3CNITRor/BD22YrboYcxUvmHDAFEsjY
	wwW5R6PKKpzwfMoSZlIQzgm95QqlSWdH9hdN03U0IYWhnPf3HbgoJbQ5gzGrP2dH4Hi541gyXmPYc
	cLvms1n6PhPsG+xaHA1XqbEWARuF6GvjMEyO9Uv7wN7yq+MrxmwMteeTSf13JyrBZJCGZxoy5ml5U
	ALFn0F1Q==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tW29A-00065u-1D; Fri, 10 Jan 2025 00:41:04 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.13
Date: Fri, 10 Jan 2025 00:41:03 +0100
Message-ID: <2914560.yaVYbkx8dN@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find a below some small fixes for the current release 6.13
cycle.

Please pull

Thanks
Heiko


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.13-rockchip-dtsfixes1

for you to fetch changes up to 3699f2c43ea9984e00d70463f8c29baaf260ea97:

  arm64: dts: rockchip: add hevc power domain clock to rk3328 (2025-01-09 16:22:49 +0100)

----------------------------------------------------------------
Fixed card-detect on one board and some missing properties added.

----------------------------------------------------------------
Anton Kirilov (1):
      arm64: dts: rockchip: Fix the SD card detection on NanoPi R6C/R6S

Chukun Pan (1):
      arm64: dts: rockchip: add reset-names for combphy on rk3568

FUKAUMI Naoki (1):
      arm64: dts: rockchip: rename rfkill label for Radxa ROCK 5B

Peter Geis (1):
      arm64: dts: rockchip: add hevc power domain clock to rk3328

 arch/arm64/boot/dts/rockchip/rk3328.dtsi            | 1 +
 arch/arm64/boot/dts/rockchip/rk3568.dtsi            | 1 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi       | 2 ++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts     | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 1 +
 5 files changed, 6 insertions(+), 1 deletion(-)



