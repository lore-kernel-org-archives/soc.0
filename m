Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E72318E20
	for <soc@lists.linux.dev>; Fri, 18 Jul 2025 21:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752872605; cv=none; b=PdN1QdjL4bS9pwwezQt0NcGJt/9OB/2QPK92c/NU85wG3xA3KeCXryXIhAZFHk1d+PGWB/e7vaHtSendnOK2kyy1WeKzZIrzzGC0UhQksYOJ9i6BvBFtgdGu3UYvoMJzuyIbTH0wpD+1CRXOp0YjlaN1Z5l8L9KpWlgPrQd6fCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752872605; c=relaxed/simple;
	bh=P/HYfOWXdhBxILLYuYXNYjKpc148//W458zcBIlxh6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tNjcHvAi8KlWsjNFxTvSyL1iYDpFO1SZrRieVHtqQZiFn7DTmbm6XVZHAtF2xVuvSZTbNzVb+mjZ8/nS9qjZ4HxEVZQvTty1oXwwy9nx7W8wbsS8Mqn3yRruxIqJ8mjgOCz+cFkEf7yZzhJWKRi9Sa3cTJJwVkNWmqwOPyjNC38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=LZbrMmDX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="LZbrMmDX"
Received: by smtp.kernel.org (Postfix)
	id CC949C4CEF0; Fri, 18 Jul 2025 21:03:24 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3B61C4CEEB;
	Fri, 18 Jul 2025 21:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D3B61C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=UKVVkG8oAn2+Yzx4pKYdU5ZNka6O4M58XLvVY0uPoBU=; b=LZbrMmDXvVGufpouCEFHzJFaUe
	TBSDm2S/n6MEwsbZINE5GCPSQNWX14+NGZ7quPcECYcobv9fiFQC/LS6cMyaJGi5Y1IuQZOItQ1QY
	/07KDmbfBm4TRTkZ94H5dvz5wag5oJIUPGXDJtRi8fpIJGpK9fYFkfYtKxSpYkooTaQ1HDhlHQEwj
	5nCTU5mbCGb0sZzZ5UaYXQP9+hEWd+bShGrbY10kcGP4ptPKUPPbiuYLSLB1rkgPhiUNnr7CoX+H7
	eC7F6h3Qxq9EgFRj0fTwPO86E2z7JLPJrTMJBlYVLjs0Fp1EcMADsRlmJeQMwcDn4AT/GDNS9k9bu
	lTxQboMQ==;
Received: from cst-prg-35-241.cust.vodafone.cz ([46.135.35.241] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ucsEd-0007FK-1P; Fri, 18 Jul 2025 23:03:15 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip soc32 changes for 6.17 #1
Date: Fri, 18 Jul 2025 23:03:13 +0200
Message-ID: <12434765.CDJkKcVGEf@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

After a while a fix for a possible kernel hang that seems to appear
seldomlyv it seems - on my boards I haven't run into that, but the
change makes sure this won't happen.

As this is for old arm32 boards, does not seem to happen very often
and we're late in the cycle I'd consider that material for 6.17.

Please pull.
Thanks
Heiko


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.17-rockchip-arm32-1

for you to fetch changes up to 7cdb433bb44cdc87dc5260cdf15bf03cc1cd1814:

  ARM: rockchip: fix kernel hang during smp initialization (2025-07-14 15:38:40 +0200)

----------------------------------------------------------------
Fix for seldom hangs when bringing up arm32 cpu cores.

----------------------------------------------------------------
Alexander Kochetkov (1):
      ARM: rockchip: fix kernel hang during smp initialization

 arch/arm/mach-rockchip/platsmp.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)



