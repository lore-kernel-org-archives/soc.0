Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B205927A92B
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 19:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753211423; cv=none; b=B4+2ZMEIVcM5VOf3gsHXrSxAvEmi3xz4E4eya3SXLomksbxPUC9LKyE6EgsLcYLRc0oJI9DxXpDxtYjwjEEzbmu0ik33McXdFZamVEmxFKKi2xpTeY0J3uXEdzyyTXiIMYqgF+xGJOec8GBGaDvMGGmmeN9WheNUA2coca2XD9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753211423; c=relaxed/simple;
	bh=SdugJy50Q4TMTrjMhlSAZ994LuuvER2A06jpAWhGgJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hvaWhgDNZjguKET8yOZyYE+2LszAoOpsbyhdx4Y4NN8C+N+8azVh6owpY5Xkloka1ov/uxgCAYHYm25qYcK9Kfi7VHnlC/qC+G4CP3uE62KjeKotb+r/n8sqOeh8X+aSMXaqCi7Tz1jE/pBFWkfpU15y2Q2JwdevO6ZI1GpeB3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=a8Qktq1z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="a8Qktq1z"
Received: by smtp.kernel.org (Postfix)
	id 5D486C4CEF6; Tue, 22 Jul 2025 19:10:23 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 803EBC4CEEB;
	Tue, 22 Jul 2025 19:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 803EBC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=9frWBqg+9ABHbKCRSF6hDwgCj340VYF0PN8eIRHYKXo=; b=a8Qktq1z7Iyx92raGpzD4E0N1G
	LQF4L8yD+Q5WzmxTbpmX6ltLOeo2Qia45RVqu70ZGrdtSBBBwOhs2tzVE35do/p3QXgcq8R7VMiwW
	/03RfQDkxo5tLQQri/W54X8dnDx8JvOELSkXGZqp+da4/lHYBQ8Pr2tOf40jc71f71WEk9ywgkXB3
	7G6nQzlSPAC8pGubLCxxEV3rLDTmnJniDMPtjaS/kDd0MI2DLXixqmH6iwUo3TrDzL132G7O82jHG
	xinQELQB0nvB5LDv5YOUvHTiua0+pOD6L6mHFn1Z0KeMF9hYRYbhZUAVTDRZgQI6vr0c7avo43FOU
	F67p7Q5A==;
Received: from i53875ad2.versanet.de ([83.135.90.210] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ueINX-0006hu-IO; Tue, 22 Jul 2025 21:10:19 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.16 #2
Date: Tue, 22 Jul 2025 21:10:18 +0200
Message-ID: <1927555.tdWV9SEqCh@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Arnd, Kevin, Olof,

a somewhat interesting issue came up, in that the added netdev
led-triggers seem to cause lockups on the board that is using them.

So while this gets investigated further, the default trigger setting
should be gone.

Sorry for being this late, but please still pull

Thanks
Heiko


The following changes since commit 9037532ab893635a46afe88542cd747a4a846497:

  arm64: dts: rockchip: Add missing fan-supply to rk3566-quartz64-a (2025-06-30 11:08:36 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.16-rockchip-dtsfixes2

for you to fetch changes up to 60d89a256079895a154d0f714caee8c64de586f7:

  arm64: dts: rockchip: Drop netdev led-triggers on NanoPi R5S (2025-07-22 21:01:21 +0200)

----------------------------------------------------------------
Drop netdev led triggers from Nano Pi R5S.
Came in today and it seems the netdev led trigger causes locking
issues and has the ability to deadlock the board.
So while this gets further investigated, dropping the default
trigger for the affected LEDs

----------------------------------------------------------------
Diederik de Haas (1):
      arm64: dts: rockchip: Drop netdev led-triggers on NanoPi R5S

 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 3 ---
 1 file changed, 3 deletions(-)



