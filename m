Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F74219A7E
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 23:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742428446; cv=none; b=r/TDqkRmF11ih0J9s3excYHtoy8aZoeBzim8YBrJAqYdiLsb4Hjo4fbNjspA67avmnnZPQ+gbcuZtNSXlhgIvhb3ylLF7e++UcYM2u414QmQXtw9cHyufWbSqjO+hk0D8CWgyAVlIjSDcYKVyjcsfG657SY7KRG1DYkzPnpGEYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742428446; c=relaxed/simple;
	bh=7RekwUfkoHYK7xoBSfoTC6PWgqYTLBcv9i3XxayHMrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AS0Ap4XH4zLXDrtrXRjSBbzw+UImweMFTTmAQ5M39SbE2AsnHHooFo7J1dnBsCxTzAIx+fyAmPoISEHSJgIfZhrYifNHgI6Gm1uW8UvT3l/BHQRijr2fhutjgnJWTYvZ60a91O4ITzz+8BruLjHuAKy/oaC6YPvT/N/hbNMHo0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=bOIei5bP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="bOIei5bP"
Received: by smtp.kernel.org (Postfix)
	id 4C2AAC4CEEA; Wed, 19 Mar 2025 23:54:06 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57340C4CEE4;
	Wed, 19 Mar 2025 23:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57340C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=SNQOcy+R7mQ4cPTc59VSSVwJu1ScZnlp/qvs/mXts1k=; b=bOIei5bPNo+tiyuP9SAapPEBko
	UQI5znglXHZ4wa4igSaIgMbcKwbIcJWZK/mpf9Q/R6XGEYpJuGVFYPwq/yV+OG/XfDuHm4+7YvTzS
	rbk6vgXu7620BldduyefDk0sdxXy3BuPuKUuHPKAU3VebZPe3NE0q9ZCtlQpj+9YRnR+7++/x59r0
	GB5IVyl/mGgxf8SIsxqEkw8xJMyEuP9qVyn0WvVUjNNyLjjwJCKya1X+oU5zRQ1Y0YzkdbYNdQXS0
	jAxHUVpPN/33+mMa+ZNS6uPriVepPGyMrjLEanecRrZUtih/QKsGQovmOG6mPLGhaD2FYpEYakXHC
	2Y6QVr6A==;
Received: from i53875bc6.versanet.de ([83.135.91.198] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tv3EZ-00021P-Bl; Thu, 20 Mar 2025 00:54:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.15 #3
Date: Thu, 20 Mar 2025 00:54:02 +0100
Message-ID: <5552256.Sb9uPGUboI@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

I made an error and accidentially applied a patch that was meant for
the mfd tree. Thankfully Stephen noticed that when the duplicate
commit appeared in linux-next.


Please pull.
Thanks
Heiko


The following changes since commit 73d246b4402c3356f6b3d13665de3a51eea7b555:

  arm64: dts: rockchip: remove ethm0_clk0_25m_out from Sige5 gmac0 (2025-03-15 15:49:00 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.15-rockchip-dts64-3

for you to fetch changes up to cee24bc73d4f3f47344a1a54100a69c72f1db061:

  Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compatible" (2025-03-19 00:22:18 +0100)

----------------------------------------------------------------
Revert of one commit that was applied accidentially and should instead
go through the MFD tree. It is already part of that tree as
commit 7f3e3e7228bb ("dt-bindings: mfd: syscon: Add rk3528 QoS register
compatible").

----------------------------------------------------------------
Heiko Stuebner (1):
      Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compatible"

 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 --
 1 file changed, 2 deletions(-)



