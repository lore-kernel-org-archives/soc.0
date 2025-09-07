Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A7C212FAA
	for <soc@lists.linux.dev>; Sun,  7 Sep 2025 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757263686; cv=none; b=PX0DLXEAA5K0GId0mqw1Xjr3EHDlP5tPa9VyI4mwTCDJ7YMEvP4IW8Ssp2aHJ6C2QAhZlC+D8m6pU3/PA4U1Cc4rsI7uV8NkmdxkI58HnpbBReAET5PJvgW8BsQ612e7/jhqgsRsTcQ8v3fLDwK7pz9Wxt9PJju6gL9nAihEKvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757263686; c=relaxed/simple;
	bh=SrjZCWNVE55S9UptOsTG5HXxZY9WB60n4CrnSoXeS2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I79tsQArgXB93S1WA6ixdjZww04PDlfBfuCGnUMJsxDDmQE85xyv5xdMfrdiOZoIxiPGxP0yDOlXXP5s0zLWbmpMPxE758f71AZIq2PuEGeVRVNsmSqa1AdV8RuWom+O+lxhARvXO4roBUOYfhnGZSiReA64qLRz6hpAFto0cn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=d4Asq/kE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="d4Asq/kE"
Received: by smtp.kernel.org (Postfix)
	id E1114C4CEF8; Sun,  7 Sep 2025 16:48:05 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37AF4C4CEF0;
	Sun,  7 Sep 2025 16:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37AF4C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=v7A9UPoEFzVjGQq7Qwoob96FGINY41pu3fhxh//oR8o=; b=d4Asq/kEu5j+gUlR3furkmGZEb
	b8GAEQ1bmF7A9ChhOqgVwRlleVlXAHSAYDUgK2rq39f45N+CmTGMTqgmq99aLd8IkRRCqd23uI19f
	MWrnoqqUDbFam6NyOYyUc0SceKTpTb28e6fSZpezjikBuRTxrcWRXWWakoX1CKHbpVILhQMpKVH2m
	GrdWAiFfqCPObhGedqzRUlFtX2c4e0rI5H+XXTMeTn+cH7qRcXe4aUlXHJ8aF4cmrF5xg2BccZuOp
	vfeSW//O91iSIcTz8Y12LTlXvtLv91whFDLnDK6V++Yh8nSoPjlLMHuWgk5aW2nbItpt0vEf7uhVb
	CL/ANDcQ==;
Received: from [61.8.147.163] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uvIYc-00049p-Cr; Sun, 07 Sep 2025 18:48:02 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.18 #1
Date: Sun, 07 Sep 2025 18:48:00 +0200
Message-ID: <12138356.VV5PYv0bhD@phil>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.18-rockchip-dts32-1

for you to fetch changes up to 2a91dcd5be9dde3239c87e4309f5878d3e4fb9d2:

  ARM: dts: rockchip: add HDMI audio to rk3288-miqi (2025-08-30 14:37:24 +0200)

----------------------------------------------------------------
HDMI-CEC and -audio on RK3288-Miqi

----------------------------------------------------------------
Alex Bee (2):
      ARM: dts: rockchip: add CEC pinctrl to rk3288-miqi
      ARM: dts: rockchip: add HDMI audio to rk3288-miqi

 arch/arm/boot/dts/rockchip/rk3288-miqi.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)



