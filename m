Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFBB1F8AD3
	for <soc@lists.linux.dev>; Fri, 17 Jan 2025 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737116412; cv=none; b=JBv1AWJqL/row97+J23l1Xv1gvLG1jPTRBWUyPTHbxZBpKCHfglDr6rltt78pl7gzxMSau9N9z4hLuLYf/EYJ65xtwKx5ICFzQL5mCx5BueWY3GECfpH4y6Ve86wIiA0IBtJMKntNBsoVtFa46nb6XucIiIr8sRu45aS6upf30o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737116412; c=relaxed/simple;
	bh=o4GlFb0t8tw/cYpqwg4JZtvLb/F4bi1lRwCqQSAzQzs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=mT0WPiT3kARDyCApCGnRxtZFsm0TFaae2rHrsjAOXYII8qATWghpT+ViGYgGDjx4I+hn3Da869D40JubnF70hB9p/5tWC+NB9Q32XDNhpWKXfiqSr1MXo4QFBOdJQP1ZkBEbD5lrEGDT9v/S2jv5i9ENXK0lxyQVbkQ869lCUHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPPlLkPA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPPlLkPA"
Received: by smtp.kernel.org (Postfix)
	id AB76CC4CEE2; Fri, 17 Jan 2025 12:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95384C4CEDD
	for <soc@kernel.org>; Fri, 17 Jan 2025 12:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737116411;
	bh=o4GlFb0t8tw/cYpqwg4JZtvLb/F4bi1lRwCqQSAzQzs=;
	h=Subject:From:Date:To:Cc:From;
	b=NPPlLkPA3b9Rnh/F6o0W2puVJ+btNL8O1yYciOkz/7Ow2E3bxTSjZiSwyudkvknjC
	 7wcqjgYwWK3EgYB2ZZnS0cOIyIlzUx6D3G1Prg8eaiY0M4lNBDUZUhP1LZ9mORE5jl
	 Lj5Ye6JwRU8VCTg0a5g+tMc7CzGqfeeJ66QU2gRNC4JQAUDUCUTFqrSD95hKZYRRmk
	 caG8NsEcayxNIApe+9M8LY5TXBZca+8fp+2f0Iyi5MGY4pMYud2YfnJGHwWN48wdIT
	 ltQ2I/16IA8fwrTWMDC+EzWKoQu9Ow7A2r5l2KlV0cWWlLd6Npar8WCMTxgSYnggDY
	 6Y33GMRup1ZMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EEE88380AA69;
	Fri, 17 Jan 2025 12:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173711643443.2108892.12827941981843321329.git-patchwork-summary@kernel.org>
Date: Fri, 17 Jan 2025 12:20:34 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Microchip AT91 SoC updates for v6.14
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=922803
  Lore link: https://lore.kernel.org/r/20250107081424.758980-3-claudiu.beznea@tuxon.dev

Patch: [RESEND/GIT,PULL] RISC-V SpacemiT Devicetrees for v6.14
  Submitter: Yixun Lan <dlan@gentoo.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=926299
  Lore link: https://lore.kernel.org/r/20250117004911-GYA25021@gentoo


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


