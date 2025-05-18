Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808F320F081
	for <soc@lists.linux.dev>; Sun, 18 May 2025 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747559716; cv=none; b=WwuOwkKGhjg5DkW9Ue24rb7rCaGTuNc9ob/AcAZq5R6yFceQchXeRxUMFZZgWGrG96m5vL4zNaA7ZQ9jyDNBKigAuK+Qxj+88WjkloeqRIQrDoxKcLbcUWcuLEgxtOwVqRFYAgTaL1f0Wak0SHdTAvI9p72eiJEKODsu/kQAbOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747559716; c=relaxed/simple;
	bh=nmqRMwGDwIAzf7oxuVb4ehLEyae1Cgg5NZ958obQhAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h/HMpg1nexFNfKu1jOsf77LOmZnwcwTF3P/n9Mt96OmDubozqPuySl0lfXJB2BlQkhg7De0PWdYPsQILh8Lt/65hgkddgVnwJxVXNynC9fEKULc+lO/qKuCe4ze2SR3XJetFOPhkIRNqDOnIzOevy8FRhJMqxn/+0THDuYwRLLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=w9tEFaiT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="w9tEFaiT"
Received: by smtp.kernel.org (Postfix)
	id 082FAC4CEF0; Sun, 18 May 2025 09:15:15 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B5B1C4CEE7;
	Sun, 18 May 2025 09:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1B5B1C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=W4J6qUCgr2xFYUK7thE18AVHm/Cu762gWUY6fTaYNJ8=; b=w9tEFaiT4dteQGSpwYYmLs5Xbb
	HKUsH305X8MCwTLUqIJQiNtTAepiZwtePWW1yMxNf64NWZ2/ZnyFIlFS5P0YlDfLKxoCnF+erhkWR
	nB2yrZaWsl2r/SshkoPvPtEUAQQvIxrZY8kSktzZo1nddNOHiXe7vurpOeeIci6N0NP2c90yf/DNQ
	g2o2QPuor9IitHkliPq1RpDKhiQ2VmvfH+03LOrT5/gnP8D9/e/oNT1V1ZjN+S5I2LqVhYqLk3ZK4
	l9xD0S09NCdYtbLGTdEm8e09BEm9bvyrwWjifZP3y+G1dHm6skvjnu7ccTC0fDPcIR/z/5WokSOP6
	UncFSKrw==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGa6x-0002Gp-VD; Sun, 18 May 2025 11:15:11 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.16 #2
Date: Sun, 18 May 2025 11:15:11 +0200
Message-ID: <3652020.5fSG56mABF@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The following changes since commit c895c32bf1ce90839fc525c5d23cbf867ebe519a:

  ARM: dts: rockchip: enable Mali gpu on rk3066 marsboard (2025-05-05 10:20:11 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.16-rockchip-dts32-2

for you to fetch changes up to 9e010737dd434e3eee1fa75938abea0dc2fab8e2:

  ARM: dts: rockchip: add rk3036 usb2phy nodes and enable them on kylin (2025-05-15 13:36:29 +0200)

----------------------------------------------------------------
RK3036 usbphy addition and two Sonoff iHost adjustments.

----------------------------------------------------------------
Hao Zhang (2):
      ARM: dts: rockchip: Sonoff-iHost: adjust SDIO for stability
      ARM: dts: rockchip: Sonoff-iHost: correct IO domain voltages

Heiko Stuebner (1):
      ARM: dts: rockchip: add rk3036 usb2phy nodes and enable them on kylin

 arch/arm/boot/dts/rockchip/rk3036-kylin.dts        | 12 ++++++++
 arch/arm/boot/dts/rockchip/rk3036.dtsi             | 35 ++++++++++++++++++++++
 .../arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi | 14 ++++-----
 3 files changed, 53 insertions(+), 8 deletions(-)



