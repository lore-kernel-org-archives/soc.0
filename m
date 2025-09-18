Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BD131E0EF
	for <soc@lists.linux.dev>; Thu, 18 Sep 2025 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758235171; cv=none; b=qbkAKhVXUjb6ctUM+1UBxAtvLdwcSlfM0INyQg3Oz01HOgnWZYsy2JmPTPWiND9DPBojUvU8fd1ibDQFW/q7zGq4EW5l6/kvGSq+zkSXpjEQJRO86mkHwORINCZ9AjowHe8pwjUIy2cqSuRUW2v+0PzgaGMuVB/pAXv3FW+a5RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758235171; c=relaxed/simple;
	bh=R2UqKHWz3MxkF20gXnX3FyuZKAkt65J2tOR3erAk+a8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uD7qGhHQ610wseqKTJA1r+X1710vU5/SHzjJdkj9izxGVTu0MnSOLfKR3LiMIfiggp9A6hOtHwJxxlrnbUA2kxKu+2jIR/8olT50QTSRD6slBUPwcxCs7YGf3Sc5cVTiCiaExLqeGMCJuccDKl3XjoSH0y+zI0z2f8gSolCYxB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=nmBvBb8M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="nmBvBb8M"
Received: by smtp.kernel.org (Postfix)
	id 2F81CC2BCFC; Thu, 18 Sep 2025 22:39:29 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A219EC4CEFD;
	Thu, 18 Sep 2025 22:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A219EC4CEFD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=EJL03UeAI2MkW8nRH1TGaiM07JjptxXrtsAZoUIIZvg=; b=nmBvBb8M5yGSFVx9suUCrgqTAE
	x6taqWnY2oAJF22Ve1ImuWy2ZpBKTS32rP5tcRu3mfRllEUFwt1mfE1bTXHHFqjrZXDdBZ1ivwt+o
	Jxe/t4akB6OY8ywKPh69Nf+ovMZyswDA6YiksTRDDscmw+xGON/KyYF4XhVPeX00/HYK5tOclWttB
	l231R2mvJMPoZuxvkYib5w4dS1zgeJEuRPPp1Yc+13FZvXQ71VqNcBzodxKGzE1/kO0ohK6L32EaG
	Cvf6TDHGTK4tec8wdQnDbKFJkdePbhzH20IQKpRBwsugW86J251dzrXfl8pdSRExOms9kM/CUYXom
	yjRtb5Pg==;
Received: from i53875b0a.versanet.de ([83.135.91.10] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uzNHb-0003zY-6Y; Fri, 19 Sep 2025 00:39:19 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.17 #2
Date: Fri, 19 Sep 2025 00:39:18 +0200
Message-ID: <21709561.0c2gjJ1VT2@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Arnd, Kevin, Olof,

please find a below some more Rockchip fixes for the current 6.17 release-cycle.

Please pull

Thanks
Heiko


The following changes since commit dcc6785caffad27f2ea601fdd2f9782036e1faed:

  arm64: dts: rockchip: fix second M.2 slot on ROCK 5T (2025-09-02 08:31:50 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.17-rockchip-dtsfixes2

for you to fetch changes up to 0f860eef417df93eb0ae70bbfa8d26cb7e29244d:

  arm64: dts: rockchip: Fix the headphone detection on the orangepi 5 (2025-09-07 19:20:40 +0200)

----------------------------------------------------------------
Another missing supply and a wrong headphone gpio level.

----------------------------------------------------------------
Jimmy Hon (1):
      arm64: dts: rockchip: Fix the headphone detection on the orangepi 5

Marcin Juszkiewicz (1):
      arm64: dts: rockchip: Add vcc supply for SPI Flash on NanoPC-T6

 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)



