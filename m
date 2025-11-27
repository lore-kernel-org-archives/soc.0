Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8322AD37
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 22:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281596; cv=none; b=ndv96BXrutpDqXum1y6OQmIec5iAQf+mnc2oRHI1H0kb3G5oavtBI2K3uo0Yx4lSjHFcVdTr7aHupMaLVyA/jvRAEfEEDE7wmdG00Nh+V39Hm1dddLzCGu8EwfkBhb1Sqg5WvZM4cRUVsOmbb7s4tv5OVOQLacqdl9ASZACQyLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281596; c=relaxed/simple;
	bh=T1ZYL0G/Eet2Iav6vWFfzeBH/rhAvNvvgki03pN8iyk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=W6nQNrlWLrMTv46sZU6BhbBCfUMP1nQyKtkuHXDdOhf1pkqigJZyOgcKWPwWsg3EgVbLT+5lgWrJ33RZ4DvwaLmiLxjrjT6wi0ZsPKduEhfK3rul0SHevXWfjlOgau1mnl/IyHJkMe1Xx3UpKmKwzww+9BiEIw5MKM7pyCgf9m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVI0cz/X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVI0cz/X"
Received: by smtp.kernel.org (Postfix)
	id C579CC16AAE; Thu, 27 Nov 2025 22:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD8EC113D0;
	Thu, 27 Nov 2025 22:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764281595;
	bh=T1ZYL0G/Eet2Iav6vWFfzeBH/rhAvNvvgki03pN8iyk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rVI0cz/XKXSaq/Q8phY+G+GiAQAjsHPR6T/3f4tRSzZf1SQJ++0lxkjNB5LkBC6TK
	 N55U0eWbPHXd0Zd3D9hOkvUG6eIGZZECu29ZiHcYGqy8w3S6SI56qXesMs1Lshm9fL
	 OTMFpnB1VThWd5vlp+8iqDR4Vast18fXQCvM62adOroHds0RJq/NUs3n270x99gwaM
	 z+kXVSsv/M2mrP/qSDOByZ4RSlTzQDDtNjkbFsyZNkYQqmoaBcOLPUsvOrexwKk9D1
	 mc84Z4zXi3vAr8jO+e4GJ/LZyYxzTi/BZEXXA2OX8yQnL180Y5sMDV6lxuOstcyZxe
	 +bQ9n7X1CdfQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B6AD3808204;
	Thu, 27 Nov 2025 22:10:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] standalone cache drivers for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176428141802.55019.1881786725895939782.git-patchwork-notify@kernel.org>
Date: Thu, 27 Nov 2025 22:10:18 +0000
References: <20251127-facelift-revisable-772b117a799b@spud>
In-Reply-To: <20251127-facelift-revisable-772b117a799b@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 27 Nov 2025 17:10:11 +0000 you wrote:
> Hey folks,
> 
> Please pull my standalone cache driver 6.19 update.
> The base here is a wee bit odd, I forgot to fast-forward this cycle and
> didn't want to do a last-minute rebase when I noticed this today.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] standalone cache drivers for v6.19
    https://git.kernel.org/soc/soc/c/8e2baac0f2bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


