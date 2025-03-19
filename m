Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B6B20899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422316; cv=none; b=BgVscuTogRyR9+352rdRQ+kdEfwgUTi0mc9Rt0qmDwr+G5E5XnyZ8hvbMK7CYoR8stO4XPGB/pnqY70rIb5MpLFRJ3yTvjpUlRlkkLzdUNoaq4bRsmtx/O5p+Tv1ryWquIR0SmDShDYOgO/twqitUK0+RtIAW5YklXu53+511sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422316; c=relaxed/simple;
	bh=47RfSGpEwIKdhQBNyCTzAQh2wDpVGkIv/9kldqdL3UY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=m0RoJgLygXqprp/tc1QqvyjTSFRYqfntAgInkzXa/WCiCIFQieZQeCf5IAoh+xJfFgqYx9peFoKgfCRyPBsH/kdciYlYkqrHpAC3eNUO2WVIyAeSWmdYzOSiUPtlm/el1W6wMAuTRWURcVrk9ZH+8c/rOcmsn11jGnXiZuK6cEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cf0ah5n7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cf0ah5n7"
Received: by smtp.kernel.org (Postfix)
	id 50763C4CEE7; Wed, 19 Mar 2025 22:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A35DC4CEEF;
	Wed, 19 Mar 2025 22:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422316;
	bh=47RfSGpEwIKdhQBNyCTzAQh2wDpVGkIv/9kldqdL3UY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cf0ah5n7ex4ga+5W35aJKIXCKuUEpqmwNzkupqak83DlR3pyCLGBw+iQ6/E125Drs
	 0erWSQHV/1etDDLHB85/mg25xl5ZkkaBe0JCGBmxvYWGSNpB8mL3uOclGNz2GPOhfu
	 4pkLdDr75u+YODrBWZ+dYS4XsbVsN9YR9k0QI+plDhYYE/7bM2sohrk1pfWxNlDX7N
	 BJ1bfDmYj4lImOUamufAT4neYhJTS51dmH6kwI4Jp+q1CXcNFQ7OoMgPTvzq/Osd3H
	 UpJJCdDQTakjqpFWySONLStLs5sdF7YWTSmakGM5/FpySNPjqS0LlUcRxa2LBEJC3w
	 BeNWFIW2/TFiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BEA3806654;
	Wed, 19 Mar 2025 22:12:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: ti: Driver updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242235175.1211847.3700217963838462885.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:31 +0000
References: <20250312113826.ka63nijuftgs6h52@mocker>
In-Reply-To: <20250312113826.ka63nijuftgs6h52@mocker>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 12 Mar 2025 06:38:26 -0500 you wrote:
> Hi,
> 
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: ti: Driver updates for v6.15
    https://git.kernel.org/soc/soc/c/aed7dbb948a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


