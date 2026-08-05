Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB4A3D3D1D
	for <soc@lists.linux.dev>; Wed,  5 Aug 2026 17:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785951815; cv=pass; b=iS4iM8uAJOa+dTIxG4wdWFRc5yg9XW4BRr2zFM95PwUslgcbR9Pj028Q/VaHxE1+gBYoc2C1hB23fVlkZrU6bSBp9Da//91E5usbGChtyHh4vn8wuWrYy7pMw/gPsg3hQJr8B8I+H0YDswHAHcWzDXhN+u17BMaaZwlP53TLLZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785951815; c=relaxed/simple;
	bh=0yk0R1AuW4LISGAjbnj1tBKDHfdHJlcYGWAtDblh9ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bMI7cX8tpjuUF2jmIGSPaV9PQ34INTn6lU9TsGtDNRfx4s1ix7vXHx1PhSALBFuEd6872ljWHmkCqN/ZZ3FI/oNNpfc+ednn8D91lV5lDAI3FECLQAkLCI6J/dIq0swmojeNPhbfJ0DjL2D/x0WJJGQwf3LDr6OL02MaABRLAHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=O1doOVf/; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="O1doOVf/"
Received: by smtp.kernel.org (Postfix)
	id 568CB1F00A3E; Wed,  5 Aug 2026 17:43:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785951811;
	b=ii44KfG/Ibu0tqlBDNxGtaMfkDvnwj2ssdhsbQRPUIl0Dkq7wO3hZkQKNmaGFVofA8rU
	 dK0umKAEJRrUTmq6jR+t0L8o/ubUB5OiW+u9sBYKfQXBf2JrghDPduMaHmP1MhJuF1k3X
	 SZ1ssRwV6jDWlCOmAwakGVGnn4fu6PO0KEEjDysPBDChQPGQ7AbxrewTTjtFwsJG69lUC
	 yIV4EtYYrOu6b1K+Bt8h+gyHB1TxLxz18TIpZqudmn/EtJtYecaDrLpcPlXQQsEReKZYK
	 akyrcBjSAXii3tJRhMVXXOoS5jOJYTQn5LkwKKtBxzqn4lr7NLjJFGW5dQQlpM3shAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785951811;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=ig4HxOQjnpmoynEQayIeEsifMuFOLWzyqUkLO0olbbc=;
	b=ASQ4eVTtAUKuAtsDb81Q8S2fhrMEUKeRJXN6AlAMZcQhZnJlTORVaXx46TF59yo8tIiQ
	 QYxE3csC5udV3fiKmniTT/Iegq2M8gu860e9I32npY56A+kFOSK9M6QKsQngn81CCA47s
	 s92bQGphXuudSuIn5scV96s1p2UE3zAM3GxuL9SgK85n0a3GxlBf93Lxyd/IE/9M7MswV
	 Eut7WDZGGt0LLTtjmNDKYSk6AJMi63X5STmzNQ/cJ3HXjmUYfQlnkl/vghg6wtHY93UJN
	 FVEOgFnEz32rASAxe8dq4WTn1mQCvk9VGWSCJwsYr098O44CR7WQRAQd6yld4zEvH4Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b="O1doOVf/";
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E7D51F00A3A;
	Wed,  5 Aug 2026 17:43:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=O1doOVf/
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7E7D51F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=ig4HxOQjnpmoynEQayIeEsifMuFOLWzyqUkLO0olbbc=; b=O1doOVf/XA7nC1K1o+6KDQQwQC
	VAHI5m6Sb6Av7G3Q4Ah0sLDemgPfsD+CVZAeFwOGN2sVazwKU03TUHHqe8adWZztVlT/70F1RDnSo
	nMvkrdT2s4sNye184r1qc/GeM/OcwU/XJ+yu28FG9LHFG4Y6RguDUilQ9gGscEa/fSI4afhzh8Amy
	wrwCBL6Ph2nREed/kgfmnWGHXK9uzAE7e7/OaKk1mJF37wu3FVXPrIVp7cXCwckRCZJ0w60DRBOYX
	624mSnt3ikmWSsVf+ni/zQtmWRGeboTbd1BBQUYOATa1GHF4i/rksPuhikMrH7GjtTnUIbsQYznR9
	rXD5WuQA==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 7.3 #2
Date: Wed, 05 Aug 2026 19:43:26 +0200
Message-ID: <6604532.5fSG56mABF@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

One lonely patch with whitespace fixes below, and there is nothing
more for the arm32 side pending for 7.3. So that should be end for
this part.


Please pull.
Thanks
Heiko


The following changes since commit 44045aa7a9a9e6484617f44f77a3efb2d8e78565:

  ARM: dts: rockchip: Add Alientek DLRV1126 (2026-07-12 22:03:41 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.3-rockchip-dts32-2

for you to fetch changes up to 1a17f391c139567e2fac6894c6b43f5978e915c8:

  ARM: dts: rockchip: Correct white-space style (2026-08-02 20:26:21 +0200)

----------------------------------------------------------------
Whitespace fixes

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: rockchip: Correct white-space style

 arch/arm/boot/dts/rockchip/rk3188-radxarock.dts            | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts          | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-evb.dtsi                 | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi             | 2 +-
 arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts          | 2 +-
 arch/arm/boot/dts/rockchip/rv1126.dtsi                     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)



