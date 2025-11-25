Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F90ECA5A
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078673; cv=none; b=mcrFk2ylKrI3GnfM23auNGMcWnYoeUAQmgOABmKqPdRfXrLBiXZT8cKjDDZnwx/zuNbWf7nK8LOwcqfobNGtsBPMCaPLMTOixVpKcj7PFHL0MAtro0kS/MBxhhmCnob22scLFHHKwpjGqT5jqPT0LIeWDsPxrMe6SjLQ4iCnlt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078673; c=relaxed/simple;
	bh=mlbYA4pOg6f4pfK8RmgdWuttKhtE6jQvWdRHnwy3P4w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mjhNk08LWsM7r99xIgZI8VtgBnbi7JYgzfKZttkb0PAn9BQ8Dtbx6276J8NbziJm0LgO6DlC7hmZ53btZy/Pw1Q/vdvkHsGJP4AIXnZzgL+7Ni68xE+59owTd07jClDKd4dbWMvWDohQ/swL30Nbnru7L48eJzdmV24iVIR/F+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDvKS6k1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDvKS6k1"
Received: by smtp.kernel.org (Postfix)
	id 4D1C1C116C6; Tue, 25 Nov 2025 13:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B55C4CEF1;
	Tue, 25 Nov 2025 13:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078673;
	bh=mlbYA4pOg6f4pfK8RmgdWuttKhtE6jQvWdRHnwy3P4w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gDvKS6k1SeZieALZLOcLmwdX8Pf/JaLvExRWEVjzvudLzPHIcS/y+Avnm2DF2kSD0
	 UCaKMLVGvg3dLclVlYvudutGKWxdaygeC5i4DUx3gPlO4axZiwIT7+zt/hjMd8XLMh
	 zfgpRbS7utEiuang8sESaq65dws6Gaf51u/idE4G/0LaKCDOJw9LclWi8sJc2/BjiC
	 5gPoRrptzNelY7WPddI9ZleRYx0mVhD19Ioy+/+EA+DsufwaGRKVtecKP9g3LgwWz6
	 ENdz5M83GaTyCeSltbH6xdbP18v8qG++0J3LO732M4LbFpzxmwd4OSsNkrIfdZDBkQ
	 N0/7mQyJHoFTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EABDE3A8D153;
	Tue, 25 Nov 2025 13:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.19 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407863574.736376.8704683801581095574.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:35 +0000
References: <2244391.irdbgypaU6@diego>
In-Reply-To: <2244391.irdbgypaU6@diego>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 24 Nov 2025 22:56:06 +0100 you wrote:
> Hi soc maintainers,
> 
> please find below some more Rockchip arm64 dts changes for for 6.19
> on top of the previous changes.
> 
> Please pull.
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.19 #2
    https://git.kernel.org/soc/soc/c/feae664d3afb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


