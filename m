Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080E63806D8
	for <soc@lists.linux.dev>; Mon, 23 Mar 2026 21:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774303109; cv=none; b=ieE7/JOiRm59L9RQvP+l1NSSc5skZOIyoO6gyRnAsdd1gMKCepyRBStncPX6Jz4LwAK9LIK0AMn8iNkC/N81xHWdCaJKsIAVjK8sKvVnX0d1v2WXsDnbUiuNox9iZagkCZFByCGgndW9pcYLocuwtJ7FLnIOrunSNo51tbFHvlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774303109; c=relaxed/simple;
	bh=vPN3WGnmq41No0tsAs9XyjOR3VJF06YVISvkQOyucQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nZq6msmVAMt0YltzD23clhUhWwrzPaRvbPILq7IJK9Q3/4YkUd6uq9hkjxkO0wiuiWvhjhcwB1m1/mGYdv5eaNnmfz5weUgbTE4p8tpmalGPiPGXGaSq7MjUiFmLV7iuQoeHKq1JgaDrs/maJg9ugIM0Ct6VfZUWf2VGYs8okT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=fYnCXAOY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="fYnCXAOY"
Received: by smtp.kernel.org (Postfix)
	id 0188AC2BCB1; Mon, 23 Mar 2026 21:58:29 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E6D9C2BC9E;
	Mon, 23 Mar 2026 21:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E6D9C2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=lKibSiaGto2/xLCXJNRfo8lYxMCoZ0ZsNgmqb7Kzbys=; b=fYnCXAOY8tEejWvoaP03EBSdXk
	Ih63aNmwLCAvfAx12lE8ySuBFghzfiDa0ujd5Q+Splhfb8oHZraD3qqK/xiYKiXxEXxqHFeKPmgiA
	wa9R64Dh6sXQKUUQZ4Ls6p1gb9ZhyyDbiJ0rrzW+nLAV8sBikWZAsEnVEY+Fe/3aqbvMXG4wy+Ly1
	zd0KIX0mi4Msx05CmgIQWyxXqYMbJWLpUauof2nRPhOBXObZlu9foUf+mnh584PYAItbp4rpRko5y
	tTw9V6HwgaG+cp5M8W2xfp+7JZljbfdE1hTdTrPyKWgaKVZ9Fp9H6cA1HyUv8KpMPtK934NxDBZhE
	D/F4aSHg==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] Rockchip dts fixes for 7.0 #1
Date: Mon, 23 Mar 2026 22:58:16 +0100
Message-ID: <5057236.GXAFRqVoOG@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi SoC maintainers,

As requested by Krzysztof, here is a more condensed PR.

Changes in v2 are that I dropped fixes for dt-schema errors and fixes
for commits introduced not closesly to the current release. These have
been moved to the current branches.

The Pinebook regression fix actually also is for a commit from august
last year, but fixes an actively tracked regression, so maybe carries
a bit more weight.


Please pull

Thanks
Heiko


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.0-rockchip-dtsfixes1-v2

for you to fetch changes up to 29d1f56c4f3001b7f547123e0a307c009ac717f8:

  Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro" (2026-02-22 23:28:06 +0100)

----------------------------------------------------------------
Revert to fix a regression that breaks Wifi support for a large part
of Pinebook Pro users (multiple Wifi chipsets).

----------------------------------------------------------------
Heiko Stuebner (1):
      Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro"

 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 18 ------------------
 1 file changed, 18 deletions(-)



