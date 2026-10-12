Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D08C372696
	for <soc@lists.linux.dev>; Mon, 12 Oct 2026 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794408; cv=none; b=nddn52IQhs4pyRkSlu7IvXmptfkZSHxcFcv/J9TKJeMe+oCWx2tpSgpom/fbSDPUunwe8dc6Gv78GNg/bm6v94oG0TlibvXLN2WljjDnqu2fz0ioFCixXm96kKBPY+56jD27vbVQWtK5K6x26VV/VUS4JSQvMgcwyltEX1gS4Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794408; c=relaxed/simple;
	bh=QcQGmxgVIX+D7b8qiCs1XE8yaLBtOPV+EEZ15TWVx2s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=e7pzj37K9s8c+NlWYCZ3pLh0MeDMwb0DmiZu/ZNufE7GRr3ibd5VXfFveRXw0i6COXO8VmFpAIMHm7HudlAobQDRyH1Aq12d5DKWkPvZsvyKYzKzbXdo9Lwp0JY/KdSjIhdpj6gLB+DTSA+XTzr/7PuLCFw+AXSKqqjtfGxT8zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJ3wZs+z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJ3wZs+z"
Received: by smtp.kernel.org (Postfix)
	id D29641F0089D; Mon, 12 Oct 2026 08:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4A81F0089C;
	Mon, 12 Oct 2026 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791794406;
	bh=84t2fygEF2UmwI9zvsyajDZKot1DypgnZCaPU1wpUxw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BJ3wZs+z1B+asjzIGeZwA8wi3YxCN6gvWlLhweG782mNilwJzkwFE+8fdWKSmyH/9
	 AKBBbkmA6mp8TwEZffn62SR/CIanp882nUx1oPfZOtAbjeXLX1sLTNg4+sOc9euIJ4
	 fkK+M6fVMDc++6YLLOqsqM4oVVkEkjM6uHCLsXI6UWJOMxfzjxJ2ec4MYoOnDSRS5w
	 u+pHTBoIU68Rz/WrpxSCU8STPEUBF0+P2K9zQUhmvyh0QecgbZoEhHPPZuO3y7bgeC
	 wa4u2qxGslcC8lzxa8TGwIZqRPzo3kPtm86ETNwtYlJ7dhYBUhpAKymR4/WW2PUUiw
	 wjARO5oEAuIXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43163811A4C;
	Mon, 12 Oct 2026 08:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: OMAP fixes for v7.3-rc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179179440538.3278488.11886343050486442954.git-patchwork-notify@kernel.org>
Date: Mon, 12 Oct 2026 08:40:05 +0000
References: <7hecedb7mv.fsf@baylibre.com>
In-Reply-To: <7hecedb7mv.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 28 Sep 2026 10:36:24 -0700 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/fixes-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: OMAP fixes for v7.3-rc
    https://git.kernel.org/soc/soc/c/182d918a68f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


