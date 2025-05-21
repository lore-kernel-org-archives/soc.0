Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BE3221732
	for <soc@lists.linux.dev>; Wed, 21 May 2025 17:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848031; cv=none; b=jcNNKoQqecK9eS3rOLYhpXUnX3tHLmrQbgZ0tJNlfSxdpV5bP/oxS3nvVLWxoaYM0yr45+CczVhdWmQ1OuHxpVKhKamJdJGyYDuqnK62e/ze3bCQONWVyOgMNF9+okwA/o50jLpaGk47Sj5QF7PN1e/gjgY+H3kBDb9YSjZDZQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848031; c=relaxed/simple;
	bh=5tjIwY/YJwU/coQS+gvEBF7Tblk+n7fq2/CPNgxZdfs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hDdeA+9TJ35Ba5jjoDgtnT2Z+r04lBax4/SUOWTAY9aq6nPq8Sd0PCAF6cghiwXA4n5u7c1eXxbZVyHozG58z1NmbbltV1wvP+FhQR/7/SQ/r7Jlj8t7ZnUFhwqL1lE5DtUIjewCgBVcpDQU1645+ibyjuU8C7nH8bK1w/OhOws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWVXLEdT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWVXLEdT"
Received: by smtp.kernel.org (Postfix)
	id 213B8C4CEEF; Wed, 21 May 2025 17:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF0DC4CEE4;
	Wed, 21 May 2025 17:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747848031;
	bh=5tjIwY/YJwU/coQS+gvEBF7Tblk+n7fq2/CPNgxZdfs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JWVXLEdTJhkhxmG3G4bIFowqvE0RZHYKKgaZAKPY726CT/2gMRrJu1e4rbRbnCEbn
	 PB7s/76AHNI/anMiXs021BppQrKjsmFLF+8/woSKMFSYWkH0cNkOg0UneY+ahSJNf2
	 PK8Qkgul34NLu2HqfCvtvQho9f5Ur+Ya6CmUIIspmhWRsbTvAPU7Z+CZWxUdMSJtUS
	 T/M/tbS7J6iyrz+0G2PMV6mu9PI/MC9RpkEq2Hw/+8/4KaqZ3pRvlDzr3v6MvqgT3V
	 nLoJm64sm1Ct8rbgsTS2yIy+AHxLnxPewfn6YA3HCgud1cLJii3Dj0xNCYXmrQ7NwI
	 +D70U6kwORMZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAECA380CEEF;
	Wed, 21 May 2025 17:21:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] arm64: dts: Cleanup DTS for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174784806649.2163178.937235278326782386.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 17:21:06 +0000
References: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 May 2025 12:42:15 +0200 you wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.16
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] arm64: dts: Cleanup DTS for v6.16
    https://git.kernel.org/soc/soc/c/816a748bee7b
  - [GIT,PULL,2/3] ARM: dts: VT8500 for v6.16
    (no matching commit)
  - [GIT,PULL,3/3] drivers: soc for v6.16
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


