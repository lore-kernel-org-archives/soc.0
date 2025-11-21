Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3005B1DF72C
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756537; cv=none; b=EDNPTG8zjgnkd5dmAnLk2Ie4NUIituj/rUeqT0OMhlMoDmfFUC2tiSy/+BISGrLY8EmEBr8NFXbCJb2xHgQWv4xZJyXvrTNP2CPQaDbzb2mblvMmM3ZqdHwXlgUvPlI+Bic1KKMi9VVQc56S4AsujXiRXTPfAZJoPuHWjwpWQnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756537; c=relaxed/simple;
	bh=uhtPBxmG1bJ+jgqFq7Qse2bozicdX3SE4E1h0NP+Jr8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lJdcPXfUO9ErOmDihcls9HWDmBtdhXwH+lkK6F58bPzdf3TH20Cns4FQpP/VargNmkuzKw8574+Ga9FqD6qqE12CJ9WMt0iHJIUZ4U5eA3/g1ZS33k7cT/PdtFz4usN4+ayYkxZ3/ebPTmcry34LixAFJgwy5DUc8nts01NCUyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HH/Tn4P8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HH/Tn4P8"
Received: by smtp.kernel.org (Postfix)
	id B60C5C116C6; Fri, 21 Nov 2025 20:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF88C4CEF1;
	Fri, 21 Nov 2025 20:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756536;
	bh=uhtPBxmG1bJ+jgqFq7Qse2bozicdX3SE4E1h0NP+Jr8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HH/Tn4P85+dZsDcc8L2Rx8lCiSS3lSugmoGBD9QwlOt1fcRPxfZB3YNWUWMXk8xQc
	 cNbGsoytNV6WbNlWedGq0PucSmCqV11ep+3KAu2x2yb9t/1vkkDUccRou0wt0e6hyx
	 59lzI8Co4WABJctBYa+KCo8huauTNDkGNoNnODrfiaSjjS+wE0z6o/P5cyzF+2mXdR
	 Llk2Hyq92R6Q9Z4p3CVBAci7ql2VCHnV+gjrd625o/SiSqIijiXs0EOVqzVgiPTuYM
	 dExykoBByRy/g4gSq5M53AAuuTPRu09igdUpLueh7ZmU8h9cl7XxnLZ1uSIWoYAzl4
	 RLSgP8EHWmCgg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E573A78A68;
	Fri, 21 Nov 2025 20:21:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/5] MediaTek ARM32 mach updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375650124.2571237.4661584067027970224.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:41 +0000
References: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 11 Nov 2025 10:55:36 +0100 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-arm32-for-v6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] MediaTek ARM32 mach updates for v6.19
    (no matching commit)
  - [GIT,PULL,2/5] MediaTek ARM32 DTS updates for v6.19
    https://git.kernel.org/soc/soc/c/c4aee1ad4125
  - [GIT,PULL,3/5] MediaTek ARM64 DTS updates for v6.19
    https://git.kernel.org/soc/soc/c/3350e81c6286
  - [GIT,PULL,4/5] MediaTek driver updates for v6.19
    (no matching commit)
  - [GIT,PULL,5/5] MediaTek defconfig updates for v6.19
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


