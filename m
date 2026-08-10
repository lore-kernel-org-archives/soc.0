Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8755739A04A
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352487; cv=none; b=pVuxbblqbmtT0QdGzF1qWZFBtLRbppFD/eAv/AMw96cizfKoTF42WacQDFUIVQ5FFXg1ZWxX9PxJbAN/weQMIZeQzZCaHZRlKOIb/Z4tnBaMhCa3c9CF59V1n6yCslUzG+aOZyyqlmF2iOss+mDjN+2DcrUOjDNISv8zRJTxkIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352487; c=relaxed/simple;
	bh=9LHlb1a1ZPpMWjuXd2VT3Yl0uA/3wsVJrazQJJQhFic=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FX/YhSDonbgrWLZ5b+vXt0p1avw4GLaiEYwzRf5wVcrTTUgZAlEmbeKrvc/yuMCHlx/yWYpoPdRPo4zsVKGn1Hj+xPgN7aghEkTIzUyGV9LaD8VvNdDeLwa9YY/Wv/665+Ewo64e1k71XwS7hfxeOlZE25ia/1Gl5BlBjATUqjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxQuihJk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxQuihJk"
Received: by smtp.kernel.org (Postfix)
	id 4C9121F00A3A; Mon, 10 Aug 2026 09:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A5D1F000E9;
	Mon, 10 Aug 2026 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352486;
	bh=xFHKE/Tsivgiz+HimXJPplb5g/a23c4ZSkr4ULwpLtg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZxQuihJkOAngiNWiNWrbnJ6LjrpsPhsqW8ry74CboCu6muj4PMnQ0+pUDUMYhzfnW
	 3Lzzp9v3qNF+ChcSNPuaPNQcxio1ZK7KdeRMdG+cg3ZLEzlMyvB/IAGVmoZdPe/ZKS
	 Xrt0+UQr6aAAcee8z+r2onG0ZsImKea5IBZCM1UoeXCfyf92vgxV4g1+06HJxQWrUl
	 Put3AX7zZsWubzFaYFs0rI4d8Vu9iOZf17ievklDwXgnM8rJ5q18GZ71a87HbEgJcw
	 JtrhSzHB6NbAhfRqaIkzc5eKUN25qRUUGEyg+/B6h+3/YdqBrSbL0lQN3u1ivE/bvM
	 CudUUc1vNlznw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569263924FC2;
	Mon, 10 Aug 2026 09:00:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178635244288.3658557.8905369080314610670.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 09:00:42 +0000
References: 
 <CAHTX3dKTNZJjcCVeAKA4KX-JcoJct72S1t2XuycDhcuSvOMhgA@mail.gmail.com>
In-Reply-To: 
 <CAHTX3dKTNZJjcCVeAKA4KX-JcoJct72S1t2XuycDhcuSvOMhgA@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Aug 2026 09:39:00 +0200 you wrote:
> Hi,
> 
> please pull these SOC changes to your tree. I have applied Jay's
> patches last week to
> see conflicts via Linux next but before creating tag I found that
> there are missing links
> that's why I have updated the top 5 patches today.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: AMD/Xilinx SOC changes for v7.3
    https://git.kernel.org/soc/soc/c/75fe716d0770

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


