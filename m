Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBB2370AFE
	for <soc@lists.linux.dev>; Tue,  2 Jun 2026 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400412; cv=none; b=JXKsPw9n3g4FQdZxrzhqCQZRyD+dfkL2mAK70FY9u1sE7k2i9ZMg3WHAagGQ9ByS7MrbC0j6VI3mA1FKwfsFUDygWHmc9YeKXFlvwoX+MI9CNOjG4PTZPZHAr9KNcicEKQb+1mLS3ZZkO+xdBkJueSQw4IPLtkrL0BSToNHn95g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400412; c=relaxed/simple;
	bh=0qaTQ7OJswHQLYVM+kY9nNV1Fw8utFSSMEaEsBtTclY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=VsG/Yc4JGYxe6lckWJDX6GX5G5IvWjzrTDpSuoZmPd09xuXtsJHwG1uRl+3OzATtvWp3iHZh/0E0/iT9mWuSBxjIbvGd7E/3akyuglAkYODVuIVnbDwRmpOElwJgAMfO4hqpLAVhzYn9/JYvdQbXV8FZMNeutsLhsnv6gt+uscs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgtoNGC+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgtoNGC+"
Received: by smtp.kernel.org (Postfix)
	id 7D1D61F00898; Tue,  2 Jun 2026 11:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B271F00893
	for <soc@kernel.org>; Tue,  2 Jun 2026 11:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780400405;
	bh=1EXUcImwYz/ctSLtoI/UMztk3ADXTdqAjvA0n/L2Ex0=;
	h=Subject:From:Date:To:Cc;
	b=NgtoNGC+PAKdI7MT3HUYmMy6hJ0GlzPSGgfJnd1UF5es9+2+flnaDblnv6UyNJcfO
	 6jrHB6ggJ82GFSQXB1H3WeDuLbx/WAjFQaO2eutFwjYN7p082aizeGYSbx10PGOB9w
	 bJNMwzLKKyTEtfArFU2v/wXv5TBd6jOS+7LQfdIx2id28e+LZzqZqmMz4uamLUdvqs
	 +L+PZSU2l10Qp8P7/vwe+xML8zUqarH4EIyncVR4pt3FNILPcim/WzoKBa51U8l1t6
	 yByuUfsgoNKjcGiDnp2t5WG6m+q+/rJjlngi2w0s762RiO1QFKmLod9HeOrYsjY18V
	 y5tz9NVbnM4LQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 965133811A53;
	Tue,  2 Jun 2026 11:40:08 +0000 (UTC)
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
 <178040040728.402603.16793509033197948698.git-patchwork-summary@kernel.org>
Date: Tue, 02 Jun 2026 11:40:07 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Rockchip dts32 changes for 7.2 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Linus Walleij <linusw@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1101271
  Lore link: https://lore.kernel.org/r/14415443.zAa99ISigo@phil

Patch: [GIT,PULL] Rockchip dts64 changes for 7.2 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Linus Walleij <linusw@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1101272
  Lore link: https://lore.kernel.org/r/3616130.jNaZZp9DzI@phil


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


