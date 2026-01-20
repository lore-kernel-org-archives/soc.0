Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384F231D36B
	for <soc@lists.linux.dev>; Tue, 20 Jan 2026 17:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768930207; cv=none; b=Jx3cB495aY3BJWz8NUpfQSZCL5M1vnSwrmENtVmT2srDVYNA9o848D/LnqYmO+mXk4CyrLKTdm6s5Lf5kZOHoSwtJWkLSNjcazSCHcXO+jX1mw59n6N3fhce1/D7z0qqgko4+IvM/1b0Y7BCtVLQydRSefhB/AHhgKF9/0tkIUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768930207; c=relaxed/simple;
	bh=olV9BoaJSLlCHQuEKOHhvtVRs5P5zTg9HD2SglGgNi8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XkACrauy/QJat/oF6BGGtwYZ8uQc1X+m2GTVm9ljiGNMzmhf8DWnZh1m4mf8cQwaSqBOJNIycrWGASsP+zX3ClbHNXgiyfsBoQCcVq4AQwXlS/R2vM2nOI2epnBOrrpL6U4ss1xLXbHBHyiP3Na6iTta2H1eHif9NS2UmMgVvhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNid5cWA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNid5cWA"
Received: by smtp.kernel.org (Postfix)
	id 21A0BC19423; Tue, 20 Jan 2026 17:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B18C16AAE;
	Tue, 20 Jan 2026 17:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768930207;
	bh=olV9BoaJSLlCHQuEKOHhvtVRs5P5zTg9HD2SglGgNi8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gNid5cWA01HXDL6BtO9pg+U1GGJBxIM9Ytect8a5D7j7HInjvLqSGwZHZhjLqtHyW
	 6ae+v2Yrvz1AV1C7FLPJYjXRFzM4G06q08buPCVdfF7G7csxZOyLElOQ08pn3tl0l7
	 001BHXKHgCPqLFPRAPeWWhEZVvNfuyfgQELIjtZLcLxcZoBbcFZ6sfFrvKnB0+rfM8
	 JcW43Mlo3k9klvgoyxt9/9yM4bIpdLcPb6QgkmzKJQ+jDtXudif6lYZdFrT3vPTeOJ
	 1Og6zotXYmgqKMxZ8xBCfOSjS8jX4cJZB8q9m++7UaurCfTYBT6jGM1SUaJh0qlWaV
	 Kz6yZto3jPB/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C89323810935;
	Tue, 20 Jan 2026 17:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Add Andrew as M: to ARM/NUVOTON NPCM
 ARCHITECTURE
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176893020460.535807.5470424345171074477.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jan 2026 17:30:04 +0000
References: 
 <20260116-npcm-arch-maintainer-v1-1-4abecbe1dc15@codeconstruct.com.au>
In-Reply-To: 
 <20260116-npcm-arch-maintainer-v1-1-4abecbe1dc15@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 Jan 2026 11:29:56 +1030 you wrote:
> Nuvoton's NPCM SoCs are part of their iBMC product line[1]. NPCM arch
> patches have historically gone through Joel's tree along with ASPEED
> changes due to their relevance to OpenBMC. Commit df5e674c7a99
> ("MAINTAINERS: Switch ASPEED tree to shared BMC repository") does what
> it says on the tin - we now have bmc/linux.git on git.kernel.org, and
> I've picked up the maintainer role for it.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Add Andrew as M: to ARM/NUVOTON NPCM ARCHITECTURE
    https://git.kernel.org/soc/soc/c/400928d01fb9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


