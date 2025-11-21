Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DACF272E6E
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756562; cv=none; b=awnztywsuzIL8rgCeKd0ZagKnX2X+Thd5PKGISQ7hF6J40YrQ/CVHyQIS8igJ80BBko8366oSBlGW/B3/YaLY0wEPIesXgDW9QOdqJbFroy4gpRSvDD48g6slBQuqDTHlCjjS2Y6Oe8z6O2nY7+ykGofdhXawgPd53PfE2mtY9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756562; c=relaxed/simple;
	bh=85thMsFhxVSNEr6KJN9WcVITZBjLd1koMsFE/UwcWTc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qYiIu7jUcFNjk/ckKct1I8aYdgKZFNM+y3iUKNDHtMfZp8gENFEQmU1EPwaY27jrqnHaV2gQmzLlwCRzzTM4U6G0pydND0EbJQfjbPuPh/ZGRMYyHXgC4l5eQifZnUT9hQjvLqf010HXac+910ajhQOmsHGdCm3BXbeD8TUFZvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ic5LU1Wi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ic5LU1Wi"
Received: by smtp.kernel.org (Postfix)
	id 330A4C116C6; Fri, 21 Nov 2025 20:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D66DC4CEF1;
	Fri, 21 Nov 2025 20:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756562;
	bh=85thMsFhxVSNEr6KJN9WcVITZBjLd1koMsFE/UwcWTc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ic5LU1Wijld++AaCRhGjbGZRyk1x0QgwYQyMs20zf6Do/Gg9awJyQtzMAGuYZzMI6
	 SlVQ8ud9/2ajrPSpPhELzcaTiUwA2v50l9TSVTbwwzfFynn7ViikC8Ma70PAWqPyJI
	 uAjjzR6x2VppofeRTBZXtrv/WUDyW0RD8aiJ6u7fFoLkbFKRGxpFd4Zr6JI/I+kzbG
	 bvFDP9Yaw/sB8VDHGUjpk9jDbv5AlcTscquYTR0nkaVyEimsSgLysJTc/hZKQA0m0H
	 NOh8v2LnTp+RQBUZs68Bonyb065iotMNF9TSa3CY7yJmdRBVUXpNxSjczLO6K6RR92
	 IzoQHSqCFxyJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0493A78A68;
	Fri, 21 Nov 2025 20:22:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375652648.2571237.13033399416409362150.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:22:06 +0000
References: <cover.1761905410.git.geert+renesas@glider.be>
In-Reply-To: <cover.1761905410.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 31 Oct 2025 11:43:29 +0100 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.19.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.19
    (no matching commit)
  - [GIT,PULL,2/3] Renesas driver updates for v6.19
    (no matching commit)
  - [GIT,PULL,3/3] Renesas DTS updates for v6.19
    https://git.kernel.org/soc/soc/c/156c42c7fce9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


