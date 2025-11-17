Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A319A274B23
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 22:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763418167; cv=none; b=ZdKkCKSdVXPfsaxcE4RUme4TtdnGQsvETMS9ilWjRm1AtCA8SYTuhO/Kiaxn58pphb64yuA2J++cuZyhFmBkXFLMyviVjTGceYzdxlAoRjp2f3fYB3hgQmNBNxKFVyLfve7fq+IB8w37nA9lLKHFytskTk6557mwLDUIsv6Rd0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763418167; c=relaxed/simple;
	bh=D93mLi0PgelXICOsAVgZFXmd4DWSlztA2Gw+na5Xdhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PmjpczGw6TjvOstg62DVvgL8eJ5By+h+0/EGwB7MOY6OvIXCDlO1a2q0iQlZpDoYcSfRyq4XlJhEdTj1uDJ76EVekx3tOA2MquP3NRfdZISLL75R8iaGTK+md7V76T0AF/qK0SZWGa/83J4CHTexm+btqLxmbzvr/0OE9aXUhNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ee/2Qm1b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ee/2Qm1b"
Received: by smtp.kernel.org (Postfix)
	id 79237C4AF0B; Mon, 17 Nov 2025 22:22:47 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5288C2BC87;
	Mon, 17 Nov 2025 22:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5288C2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=o8tBdG1d0kXx0ruU+UfdbqfEhRqEOVLLuj+mA5TRVzc=; b=ee/2Qm1bFDdrGoY6saTjofHXiR
	9oJa9nYtYAoi9ZD0pOBj1RUb7l5KRTvi+cDsBX2qtZO3pjf4OxPBTz5kjL3Ul3+zgiYnDF2h3b0bE
	n6GQez0Mpny9goGYhCa106gZ5I/AbJsT9doUnwB7poavY9ApjD0xey9Qa8bIj4WO9pZew1veS3wcQ
	QHrwDJ27yEsCPnig4KfJwUpOHU5n0uAcfg6mDRn61NxaGJEGW3gMTQpNyLX82itu91X5CwxbLjGdW
	VlDeKVW9BUf3lAAwipvt78mtWc+795Zaz94VEZbHmZf4MWMoPuAkCwCNV4jmGKWZEmrTfqCB9t/AX
	i7FT+s5w==;
Received: from [31.12.4.86] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vL7cM-0001RA-FB; Mon, 17 Nov 2025 23:22:38 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.19 #1
Date: Mon, 17 Nov 2025 23:22:37 +0100
Message-ID: <2311720.Mh6RI2rZIc@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.19-rockchip-dts32-1

for you to fetch changes up to 10712ce694a67304a99dbba20f8cb146ca5f4fd6:

  ARM: dts: rockchip: move edp assigned-clocks to edp node on rk3288 (2025-11-13 23:52:04 +0100)

----------------------------------------------------------------
A number of cleanups for older socs.

----------------------------------------------------------------
Johan Jonker (4):
      ARM: dts: rockchip: Adapt tps65910 nodes on RK3066 boards
      ARM: dts: rockchip: Remove mshc aliases from RK3288
      ARM: dts: rockchip: Add spi_flash label to rk3288-veyron
      ARM: dts: rockchip: move edp assigned-clocks to edp node on rk3288

 arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dts  | 34 +++++++++++++----------
 arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts | 34 +++++++++++++----------
 arch/arm/boot/dts/rockchip/rk3066a-rayeager.dts  | 35 ++++++++++++++----------
 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi    |  2 +-
 arch/arm/boot/dts/rockchip/rk3288.dtsi           |  9 ++----
 5 files changed, 62 insertions(+), 52 deletions(-)



