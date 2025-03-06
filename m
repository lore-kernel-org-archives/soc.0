Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574962135A5
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 16:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278705; cv=none; b=aiLA7uB9Y7ZB7FEFGFcYfvyetFkuZBs1m2MsrKqAStbIBJ5F2yPV+6lBMuTUovNppKYb7JiuiOF53BeDdoDcEHwJ4NxZ5Un3z/CEhJbP98oxjw2Y5HYw+iRPSTM8RnOZNcQZTll6u0drfzN31zG+3udCcGsKOgBCduqL2JUdNJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278705; c=relaxed/simple;
	bh=Qdqp7aMPSFhw0yldw3u/ZDlGCglv0dhoAtw5qqgthYs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AVoPqKrxY4LqRtPoP9KUfpQGSBlJcG18L2VkgvNrlA5z8mIJvcSN7P5LgzKvvkJ005oHlY2usovZrBrhahbUbPVzFuM7NL6gLcCosxR8e/vDFY41uJt6FmJhhqaYu4blNTOsgW3peQrERkFVc/B2KHk7ZzauXNRK9zypYyDftTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbwB7vdH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbwB7vdH"
Received: by smtp.kernel.org (Postfix)
	id 3FB6DC4CEE8; Thu,  6 Mar 2025 16:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C07C4AF0D;
	Thu,  6 Mar 2025 16:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741278705;
	bh=Qdqp7aMPSFhw0yldw3u/ZDlGCglv0dhoAtw5qqgthYs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RbwB7vdH2IuohGUCREWGCHDma7fd6tu9sO32NXGgpjylMTbj/WR3CxPO9NjJdM2Ie
	 wbuVqQpbVLo9lGPayHIbAaT3+7rKzNITlhgnS0t1MMDBny+SPL14V3kjoyTF8cCznq
	 VBakbLV0ZsTvRr7z+X9zCSIeYwxI/JXQIvu7BqBNODWdUFJVwUKuj3+6QtxxauxSbi
	 Q8VoBjwY2lzlRiBLNfsq0GqhwS6AX/kKCyv45bNoNnTDhHCktl7Y938bbp5wpuEkbx
	 F3BU0+IL3TH6bZ/bLMUyPwcX3J2179uyocjeexiZ0/LV/dphpJa2fDn9pyUmBVWizy
	 EADojDGnzHhbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0E0380CEE6;
	Thu,  6 Mar 2025 16:32:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DT updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174127873827.1655995.6874038127102318388.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 16:32:18 +0000
References: <20250209135558.8243-1-sven@svenpeter.dev>
In-Reply-To: <20250209135558.8243-1-sven@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  9 Feb 2025 14:55:58 +0100 you wrote:
> Hi,
> 
> Please merge these DT changes for v6.15.
> 
> This batch adds device trees for Apple T2 SoCs used in pre-M1 x86 machines
> as a co-processor and also adds cpufreq and PMGR nodes to a bunch of pre-M1
> Apple iDevice SoC device trees.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DT updates for v6.15
    https://git.kernel.org/soc/soc/c/5ce45ab10387

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


