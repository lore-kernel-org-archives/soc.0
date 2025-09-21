Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5783518EB0
	for <soc@lists.linux.dev>; Sun, 21 Sep 2025 21:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758488531; cv=none; b=kTFjhH7povXq4xrvMbHSLs9sN0QAZulgoi81logsYoUor8iEf5J0rb5r09Quv3yFQVdaBuW9GT1Os0J0WsFr4Y+I4/zE1FdVTUpUSkD1qICg/jpuSO6u86/kljtf6pybOq4iF9kmR8zYYUm5eaABG9ngBLMtPlRdGh3qhs+qPDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758488531; c=relaxed/simple;
	bh=85MFflyqUV/iSBBFhlXcAS4wuLB4uOljAEpcLajUiy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=StKjat8p7EkLdO3ZEFUNHukJLVR3KzWREdLQ8SFSbcPnBc1ghtFPiFDcbfXhO2rDdqlWpHJtPyDugry4Iw7cJyQVMpxOK2rmdJPPa/Qtzwc38hUUs9ScvgLU4DWbu+OKQ1GBikrGnDydx332TR3frMEytBN1UpCbh3Z0jYdBUII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=yeMChb36; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="yeMChb36"
Received: by smtp.kernel.org (Postfix)
	id 0571DC116B1; Sun, 21 Sep 2025 21:02:11 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39CC5C4CEE7;
	Sun, 21 Sep 2025 21:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39CC5C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=gp/wZE0fDakAICLTarIzJLK2I+Hr8K7LrcHSpG0GvCA=; b=yeMChb36K7dkO4z2vnZJtQClrS
	hGJYFGSy9y2EgFQWXC8jsN1QTAOIIh40d7dK9kj4mdTqOy3aG7s3QrMzUX0MWd6z/tPYCKdtVjCHr
	lLQ+GwMMoth49XBHM9ORoFnAPquOXEcInzpK/9kPPRUGuQGcDA1qa3dnO2R7Vg1+YbA7T3cmzk6HX
	3f3hVUBdo8GV5S2SHeT49yuhuOlYw7tPSJVrFPVZyGKT7BrycNoId065KpH2vyXKWNdsBapdbQy0l
	GUdi+GHO1REIFU9UiSfAXzKSgEE91V0GGQXQietNje7eaC5Mwes0YY6jMv8dqgdKnNKXLwg4Lm+XU
	29eq05OQ==;
Received: from i53875add.versanet.de ([83.135.90.221] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v0RCC-0007dq-GS; Sun, 21 Sep 2025 23:02:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip soc32 changes for 6.18 #1
Date: Sun, 21 Sep 2025 23:02:07 +0200
Message-ID: <6025175.zQ0Gbyo6oJ@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.18-rockchip-arm32-1

for you to fetch changes up to a1b20e062245571c128ec521c4df56ad1bff9bd0:

  ARM: rockchip: remove REGULATOR conditional to PM (2025-09-18 21:05:39 +0200)

----------------------------------------------------------------
Commit d1bef995f61a ("ARM: rockchip: force built-in regulator support for PM")
introduced the REGULATOR if PM dependency for the suspend code, while
commit d1558dfd9f22 ("ARM: rockchip: Force CONFIG_PM on Rockchip systems")
later always enabled PM.

So we can simplify the REGULATOR dependency by dropping the if PM.

----------------------------------------------------------------
Mikko Rapeli (1):
      ARM: rockchip: remove REGULATOR conditional to PM

 arch/arm/mach-rockchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)



