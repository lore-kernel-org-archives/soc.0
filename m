Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EE5429822
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380693; cv=none; b=rW7B5XLU8nnhnd1iq7gDtvub3c992Ssqj3F9cTQdVvV3reUJ5pVzBjx3SAOYd+dMYWDD6l+HJ5J6d162IwSWQsQJjzoEJriqHsVm7pHzSP9mRz/AuySwPD6Q7mxOtk1022AUhRSN5/IVbl5ERR+bsEtRdFl3Aoy78oh/WVE5Srs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380693; c=relaxed/simple;
	bh=0WZI63IkeoguWnM9jmCyH8RbWGeo1ihhPCuSDAla/bc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=U4VP2ttlnpe8L8IcdwgFklqLm5JsNWiDX1VyoImfGlolnjtZYvXGfbTD04vWwsSX7p5D5tv5uRXJAiKtdKf2hcEbO0Jpok1obuh+qdz2kMOc9RuTtTw2bBFB5cFnzdAlpNFI1v2W035i6ZtL5DXX3hBYpdHBOxviP+tsTPqommE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXwBbGzk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXwBbGzk"
Received: by smtp.kernel.org (Postfix)
	id F0A671F00A3A; Mon, 10 Aug 2026 16:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7531F000E9;
	Mon, 10 Aug 2026 16:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380691;
	bh=0klyqgCuVYTaBJhAVsHMldFyXhoC1Y09veadqRGZyfQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GXwBbGzkxdXa23zDu4/1ydYlI8FM1ClD6lQL2UIe+M+U03KUO0fAhj3PcWTR3qHHy
	 P2qmleLxq2ePVNemJ6hLxI19oCblk/RRr/jdYSZHCA+LtlOWb8rTGkTlvS3Iw+qmzc
	 7QPaIK1+DWnnNPgfe+X8uYVOQGRneC+jSex0TSsWZf12UJ7Nb3QHw4kZivZM6jObHP
	 Lvy9H5nQoC4c5B1j3RQ5BHrf6sxYGkkieYxUd9cnblSsKTveTBwwFR1Ptb0bmZea1P
	 hXuk2dtL2j5dVrXrvSfmpstegJNp/RZVSkxpBlukQ5Y0Ep/y1+Zg1KFGBscuAZgRyT
	 vNhkOgE/8PVUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D098839253F2;
	Mon, 10 Aug 2026 16:50:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DTS changes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178638064844.3872609.4492190876298119810.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 16:50:48 +0000
References: <20260807161840.6011-2-sven@kernel.org>
In-Reply-To: <20260807161840.6011-2-sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  7 Aug 2026 18:18:35 +0200 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git apple-soc-dt-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DTS changes for v7.3
    https://git.kernel.org/soc/soc/c/e23817c994de

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


