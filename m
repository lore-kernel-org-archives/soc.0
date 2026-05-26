Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AEB33F5B2
	for <soc@lists.linux.dev>; Tue, 26 May 2026 21:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779830247; cv=pass; b=rqKTiFc0PaGoH7bqMhXsap585X9FfFFfEtU9luJz5JBtmYGWk94NQQ37SoQn/8p+CrkW5aO1tBuTH9TJwmIUnTX0BjRL+lHOnpKvaU6h4ZIApmp7x2D/WfuTVjljJaMUy1z2JOtGvT91fvl2E5f4zCkO3ANlNg7bReMhsROiKlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779830247; c=relaxed/simple;
	bh=g7tQWotYtxWvNUunu5u4DxiOI8aghTyRqsgsECoBm1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WbEtCM9AguDTPncSZO2JuqaTdmJ1sPNhjTfgxwPyayJ5mhSQo8kU2S4V4SyReCGMqaiYxJ3Wh9bHiyyoQAr885w440m5bnAlLSEXLJPwKRLJy7l1BjYlftoGUZUVzii90npZe1wunO0wWGYfTq0uRI+6Fjvb2ZsoHorajhZ7znM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=x3+eEEiF; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="x3+eEEiF"
Received: by smtp.kernel.org (Postfix)
	id 00DED1F00A3D; Tue, 26 May 2026 21:17:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779830242;
	b=xmzH70AAepU8V+MqKqU/G7RDJnZgdmgjki5985x0Zf5nIEJmwa71zUdwmLzhQH14Fv8K
	 uvO8TeFpgpyRQEIpPCPUyID2S7za8mtwp5wgUEAVo7heEOJZFSI+ZCzk45HuaHaZPpF37
	 42C32XN7NgrZUd/LcXHIlBxJqVUFLdZegc7IpTeRoBzMOfSZka2isQ3J/WS8JZg7hCGw7
	 D2jNuN6Fde9Z0feesCYcUKX8CU7zp53PLOpSYKyfoo0sAEWo7ewdFhFDBxtAKJFiLUbJa
	 4adDA022G10l1iAVjXn+6OYavvTpkhlsuLFNk0QD8DiXOh0vYRV+f48RSLz5rnRtHNg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779830242;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=ez8fFYJHo+p/fvCYM7xHQav/uAoCjVVTgRtYyWWnalo=;
	b=RCo/6v8oZJt+/rF3S1f2kBZrMgRRdDlRojsbncGs2WBY/QHEXpG92geVvVrku3M8Da6g
	 HKrze99qqvwWBHS15SaNDpzWbuSTurlyIMIZOOB1xV3PsXk57aUooDYxPMlxYjrbFiOPb
	 lAZF0MYDMnmInVOaGpXZsoeHYxaqo0nDQqcHaMJLgd6GJY3lgXZnp0T5ouOXhAwyK3jI3
	 Dufy6f4YcvDes63vI7yD/n6YNLo+OIulFafasH5A+lWLeIlr4hNgWMC/LKRRDPpd6MPr1
	 ce14+cqRY+Yrjum+1Zqw66SV/Bj+HCxY7+/wHhAOzWYzJp8nft9xAmpLHf0sDj87MwQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=x3+eEEiF;
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 965651F000E9;
	Tue, 26 May 2026 21:17:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=x3+eEEiF
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 965651F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=ez8fFYJHo+p/fvCYM7xHQav/uAoCjVVTgRtYyWWnalo=; b=x3+eEEiFUkMbB1GyVj297RuTLm
	sKDuJrenO565G2tj1/XhcIn1GLNitaTXRIAp2O+VOLMnI1Sjbx5PFH6G31gO7jjoN6kAfUnBx1+OR
	n/h022bMwUTv8XZQTy6jL2VRuoTMWVJEd+LYLA+V8xqmS+Dp4m7CrMOGd91YCflt/vum1xA6e7FQr
	1wErswHFTC7m5Z8LPkmygreBbEQko4QR2yHQz5k7BcpWuNLZQFichghPAJIUg68Q0kIZSYy+kHuao
	z++7ACFmxvW53cEVZ9zjxg19S/538K3UJ5gutcNcD0cS83KeVS4BG+9/6Jlob0WxyaNMyxudOTh0q
	p50zMWjw==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 7.2 #1
Date: Tue, 26 May 2026 23:17:09 +0200
Message-ID: <14415443.zAa99ISigo@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below Rockchip ARM32 DT changes for the merge-window for 7.2 .


Please pull.
Thanks
Heiko


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.2-rockchip-dts32

for you to fetch changes up to 98461edf564a35ee00a97a64f5463eaece586546:

  ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware (2026-05-05 19:26:18 +0200)

----------------------------------------------------------------
Cleanups for RK3288-based ChromeOS platform.

----------------------------------------------------------------
Brian Norris (1):
      ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware

Fabio Estevam (1):
      ARM: dts: rockchip: Remove invalid properies from rk3288-veyron-analog-audio

 arch/arm/boot/dts/rockchip/rk3288-veyron-analog-audio.dtsi | 2 --
 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi              | 5 +++++
 2 files changed, 5 insertions(+), 2 deletions(-)



