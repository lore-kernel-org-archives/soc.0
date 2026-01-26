Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1AF347FD9
	for <soc@lists.linux.dev>; Mon, 26 Jan 2026 17:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769447368; cv=none; b=N3WyZUt6dO+4WNfboumyy/XXJ7ch+lycUxXRfS8Fx+HkIwBNK2s5zBy18meJ0YJyca/T9zkNp/wFMFMDTi17H6Ed97IwQjxGVCx3ZtQK9c2Cw65ostOAdLRSrhnZ1MlYM0ZZuhkPmEPyMGVh/O2RC9AAHggL+rUjI0tTcs2hYtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769447368; c=relaxed/simple;
	bh=rBmlWg0JGAeH8lrNkRN/Y8VNywEhZ8uUJLVQT1oMQ9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SFJDoyAd/zJM5KHQkchiiI3L9EFA2HDNvNRf/o+wdWcZ3f7OIUMZbG581pytMio8sQBCis/15AQJh+3nZurHcB7hZlGdCNxViQCslZCs+JU4CPpdJaOZ/naVhuetZkYoX/TZPr5vPCtDf41OHrTfRb78/mbulA1nhTy7l1TbQzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=yqWvpZyA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="yqWvpZyA"
Received: by smtp.kernel.org (Postfix)
	id 97029C2BC86; Mon, 26 Jan 2026 17:09:28 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98137C116C6;
	Mon, 26 Jan 2026 17:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98137C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=Gx2hHd3TOe3OKxkk01HpI0TbAkMwKeVhKaeUoemS8VQ=; b=yqWvpZyASVZ9mYizcEvwvcMYbd
	iao9Pcf0sRYxYgo/in6jmJoQkN9K9PleC+1eKHnFvWvT6W4ivUH6Aj93dFseBHg428zFxDQnIF10O
	uQSX/HyEdB23nynA6MPnVVBAusJK8r0F+ol8TwRK5vGi9McN3wEfwYIKqA2nAQdg1fCmsBppIjnD5
	XJEVajKCiIL9LoeNS6sOC/nnoGP8IIwLzAWM7fyhQyYLXs4VN6XUItIkDuRYMewpoo1jkiG8hksaS
	i0iqnVeCtdinuktN/D4lsWGFtSOhjmLWDsJM8xugLRSn1+xljjt8dMqv7IkwnxndAUCC0xWD0QBcW
	zwlSCZcA==;
Received: from i53875a0f.versanet.de ([83.135.90.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vkQ5d-004eQS-4m; Mon, 26 Jan 2026 18:09:25 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.20 #2
Date: Mon, 26 Jan 2026 18:09:25 +0100
Message-ID: <9936542.NyiUUSuA9g@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The following changes since commit e74470cf3101da79666f20186c9406192223e9a8:

  ARM: dts: rockchip: Add vdec node for RK3288 (2025-12-15 12:21:05 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.20-rockchip-dts32-2

for you to fetch changes up to e546c69ac54e907d0c33bc1fde55689db301981f:

  ARM: dts: rockchip: rk3036: remove mshc aliases (2026-01-20 10:51:55 +0100)

----------------------------------------------------------------
Removal of the obsolete mshc aliases from RK3036.

----------------------------------------------------------------
Johan Jonker (1):
      ARM: dts: rockchip: rk3036: remove mshc aliases

 arch/arm/boot/dts/rockchip/rk3036.dtsi | 3 ---
 1 file changed, 3 deletions(-)



