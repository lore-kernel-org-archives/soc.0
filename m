Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD251B4F09
	for <soc@lists.linux.dev>; Tue, 13 Jan 2026 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768311966; cv=none; b=Fl2NsML6ts1jjQAGgCh2HpMEAgpFT7d3uWesy2jKazDY4OfxMl6kWCovzqy0xc7FUko+Xy2/NiQB7/Dh9Unq5+Jr585N+POFt783KISqNCctboSZ3UGlpI+5T1+SpOpI0YBF1/rREljQPlmUIz6rExemcUptPSreRDthrWSIzp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768311966; c=relaxed/simple;
	bh=SV1dxN2MD8QtpSbeIgyq8yQ8qkUxQW8hQyk2vRuGq3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ma41HcJYj03Riq1oKR00aKSQ/Qq0Tt9fyhP/rhsIZW/Cg3Ea55NOVecUsvwy32n0nx63R/zmwPvCtp4lftNZbleQEyiDHxpb0sh8L4mawUWf8io4eEto5zMfQ9J25m8+j/lHyOV2S4M8eeF37Z6S+nGkHYcv0dGenSNdSr1AWFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=vj1Hf5q3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="vj1Hf5q3"
Received: by smtp.kernel.org (Postfix)
	id 64F63C19424; Tue, 13 Jan 2026 13:46:06 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3669FC116C6;
	Tue, 13 Jan 2026 13:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3669FC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=n3qCGV+st50jJBNwT3OnLSRel5DXBMwwRtV/6UeHVwE=; b=vj1Hf5q3sAy4wnFzhIegdHZT/p
	rwbQ8YtNixl/A5XqGD4RrgPwzmINjkvJPbE03ErsHAgmGQgkYQUqOur3xXtAtPat3e/PN4Ei/0Ujf
	iTLxJ4dDpy0+rjDEy77bvLdRWtZe+0nuLOfg0YKgPxtkpnmNUww/fV86O66PXwvYz62P85O8z6qoZ
	ud5mZIaAt7jV6ISJWm3nrgNrIsOR9QmSLhP7s0DWzjhBsYAnLhpqSF9rKZjJYhljobjMZYjz0waHU
	xkpMcFsGKCMlIPvRuMBXniGrxbMB6TWOiPRMbBShLJ64CQ4S7Lol8noiDMxOUeOJoFW5AfCiaH/Fs
	kAO6GRKQ==;
Received: from i53875b63.versanet.de ([83.135.91.99] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vfeig-00276T-Ma; Tue, 13 Jan 2026 14:46:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.20 #1
Date: Tue, 13 Jan 2026 14:46:02 +0100
Message-ID: <4560446.MSiuQNM8U4@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.20-rockchip-dts32-1

for you to fetch changes up to e74470cf3101da79666f20186c9406192223e9a8:

  ARM: dts: rockchip: Add vdec node for RK3288 (2025-12-15 12:21:05 +0100)

----------------------------------------------------------------
HEVC decoder node for RK3288.

----------------------------------------------------------------
Alex Bee (1):
      ARM: dts: rockchip: Add vdec node for RK3288

 arch/arm/boot/dts/rockchip/rk3288.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)



