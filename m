Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3C72010E3
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450715; cv=none; b=hJm+EEu+wU1YzM0F5tU5I4eoslD1bJNDgHHxbIqlAmHVRb36imGX74Q3tLis/ftexskTBT97a1ZElzAr9/8pwtYYQzZ2yZY/svY8B2ez9I4cQ3I8lNwuPTho9CiH5VZvPMAt6LS0IUVdyMQ7HZycC0Ogc47P6OY8Gk/OvVzt3SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450715; c=relaxed/simple;
	bh=V8SfoUG3K5G3i/UheJ7L4kl3/cHaEN7xLKwxsxHJumE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=X6UBSwMxaHpWhDe3jNwkY3o/m3XyV+1QPA2NaZdqOIRGFb+zvyLMftg7l4Evvx5amouKcFaMSIVndFYgV2YuXzX3YjktA7XJd7Rq7p1oAHEmmXFNT6KT0ffcLpPaeShgTcy6xmAneJK3A7HqUQm3tR+SEVRY76m7M9rEUVvZ26E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXMy+cL7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXMy+cL7"
Received: by smtp.kernel.org (Postfix)
	id 92CE3C4CED6; Tue, 12 Nov 2024 22:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C33EC4CECD;
	Tue, 12 Nov 2024 22:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450715;
	bh=V8SfoUG3K5G3i/UheJ7L4kl3/cHaEN7xLKwxsxHJumE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kXMy+cL7TXidP5wP4AyfVCMTDlvfFAp0vM2W53RfPobaKhwJqyFgI5AxcU2SJ7gQd
	 5sZlXau0FkAXRyapuegEfnaZPvuPv2uw+2APH/PPdtMCKNiSFyItiTglWE07/lNYBl
	 mqx6tLNds6UgsQmcS/DD7j8o84XM0GlgLwMgyg1dzjIui5nDFL8WFjtNJXBd3KI1dq
	 ZLUuVoSlD+j3ry0610Lh4sYJsmWjx9/aaDjKLH+ZArwsozbeyYMYO3Zkq8CCbPjzbY
	 dkOvm3DRPX8+Z6WNFwdkdrGEnSOR49pVcN162lN5KKTdLM6KsvsKM5Jqc4ewx6WlKx
	 XPWBxyoa6L5JA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD743809A80;
	Tue, 12 Nov 2024 22:32:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145072545.694695.159985963155662642.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:32:05 +0000
References: <20241108-washboard-material-6b9ff196063d@spud>
In-Reply-To: <20241108-washboard-material-6b9ff196063d@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 8 Nov 2024 09:37:55 +0000 you wrote:
> Hey,
> 
> Please pull a handful of changes, mostly for StarFive.
> Branch is based on rc3 instead of rc1 as I'd usually do, because rc{1,2}
> was not booting for me.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.13
    https://git.kernel.org/soc/soc/c/6660a1236fbe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


