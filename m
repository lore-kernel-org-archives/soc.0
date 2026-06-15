Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3FB2D8DD0
	for <soc@lists.linux.dev>; Mon, 15 Jun 2026 17:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544611; cv=none; b=DC1pfK5B3+RbaveR7D+jiSRUmzKofBBUMARXSUBvhgVsUV4opoGkTXT/5EUg90e9Jg/b6peIK1+KOSckzRZj7mTufDqnjjLgavu++pdhj4LezqT3CJlu6tUnY3ZLL12eKG/V5HGDSnBrQ39AuZEWqJ7tg7fIkockJJsbB27NtHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544611; c=relaxed/simple;
	bh=FJvDP1m9KeK6x9EE8xmsBxpSolW3EnhduhtQsYzbajo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SP8G7484IMmvZNHRcJCE7wwEYEtL/l2/s3s4ckbIc/Hi51sARcQJLS8OS3LNdF4zt8jR5KBdgVlsSlnSNjWcA9pQ3a84X3CDESaGrtWhzcxp9p3+t8mMOSucIZmcKXvsZ3aCQFR1gqyyQVe6m/YL/yqmwQPFEorUq6+YhjEl8mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iY8OM2Fa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iY8OM2Fa"
Received: by smtp.kernel.org (Postfix)
	id 141191F00A3E; Mon, 15 Jun 2026 17:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14F91F000E9;
	Mon, 15 Jun 2026 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781544610;
	bh=trDSF5TiGKfjmlmKcoFtMN/HmWSKaB5ylxdZJKuxUG0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=iY8OM2FaGfIJMYjje1X3ynu09Xcdn/itZe/bpkvZdMRdTFPCEjv9beJ4ffZt5BI0V
	 yFsZYgpkJU64jJg9e8wl+abKLotVZz11OQGDe/nNOiTYRPzUkP/CDyXA7n7hXPAi+u
	 Xb3PUCuM7XJfjHeo74VmfAlaXuT7yfOK1XdGcEfkmB/p6o6Tc4oipqi8yE9GhoiF5y
	 PS+JW80cjCGg3nboVr5xHT32IHAz3iZ+exJgep/rQCxSv7dMbHQpSP0kKpSU/Mh02A
	 wpjK/nRxDBsO6C6VXeMVa50ZtyRgkHrKi18yI0yztJlaTJbxXFumaiBoHbjlSu5WwE
	 Y2OSgyrtwDWNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569643824F27;
	Mon, 15 Jun 2026 17:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: late drivers for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178154460489.216722.5896405145667042601.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 17:30:04 +0000
References: <20260615095001.83933-2-krzk@kernel.org>
In-Reply-To: <20260615095001.83933-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 15 Jun 2026 11:50:01 +0200 you wrote:
> Hi Arnd and SoC folks,
> 
> Late pull, on top of previous pull which was accepted.
> 
> These are two improvements and one fix for UBSAN report introduced back in 2023.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: late drivers for v7.2
    https://git.kernel.org/soc/soc/c/c7437fab2f22

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


