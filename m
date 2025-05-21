Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8875623BF8F
	for <soc@lists.linux.dev>; Wed, 21 May 2025 22:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866671; cv=none; b=OtzD4PS6VDKx4W3ily7/etJzw2jx4ajGsPNjVOJ85+jUEh4OE/u/n0hHPqFfOFtf0PqVf8xHCNrwHCQ3G+wbICP0zzvfP9+2c6n7SAtaml30/pMmrfrFYUHUgkwexHCR81hyzNTa7YDWZqy7JYPbpujSCbtBw7vdg3iBo2e0480=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866671; c=relaxed/simple;
	bh=Kw70fhTeSc6MzFNKqbv7j9zkOpP4WvhIBaJ8X01vfqw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=R4wp4G5trCdyhFdNPeKXcK/MDDbCsI0owFRBSFdz3F/rYvZlAo6uMAbTVzAQwjYc0kwDaSehj77ADpgzLCdckgoq6jD1I+KJRzWfwrCe5X2iaS79f1h4/wCprn68BzTgpixRVpkmP10i5EJtbw4qGDKwqv8LF35PhcIV/LTyCh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzII6CW5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzII6CW5"
Received: by smtp.kernel.org (Postfix)
	id 2779CC4CEEB; Wed, 21 May 2025 22:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11923C4CEE4;
	Wed, 21 May 2025 22:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747866671;
	bh=Kw70fhTeSc6MzFNKqbv7j9zkOpP4WvhIBaJ8X01vfqw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pzII6CW5c9lf99aqja+Rz07ZWsa+HHGakSFomxrQ6T8qzWNiU+7hIxp4p5HfTqCyU
	 jPWNNhyZgIXgGhnrh4Nh1FZ4C39Lqaejyb8nWMnD7lFznE3vWtcKJNW6f/lq/nNrZl
	 WL6VWlO8CUllbrlpRv9QLy8aw8EoenNw4RaxEW37og883mIbAzMs59/0hC8pJ5j/QA
	 8rIPgVjTss27YfY4dJa753XTRQToWrxUyOBWXd8ow4sFVdMmYmJpnPv7hPW54MU+AM
	 0f4jo0thzg7ZhzczVgT5hig4zpsHm0n0kv0xhjsUVMEOq3w2HTzKDcc314mZPCtH80
	 qdeE0fKvN2n7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD0E380CEEF;
	Wed, 21 May 2025 22:31:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/2] Additional MediaTek ARM64 DTS updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786670673.2299459.11302991674104570649.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 22:31:46 +0000
References: <20250520114356.1194450-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250520114356.1194450-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 20 May 2025 13:43:51 +0200 you wrote:
> The following changes since commit 1fe38d2a19950fa6dbc384ee8967c057aef9faf4:
> 
>   arm64: dts: mt6359: Add missing 'compatible' property to regulators node (2025-05-06 10:35:45 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.16-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Additional MediaTek ARM64 DTS updates for v6.16
    https://git.kernel.org/soc/soc/c/9896dde15a67
  - [GIT,PULL,2/2] MediaTek defconfig updates for v6.16
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


