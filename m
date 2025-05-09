Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD72A2367DD
	for <soc@lists.linux.dev>; Fri,  9 May 2025 16:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806995; cv=none; b=QiE7HiDITVGoDu/tMH5vK5NaAiV2KVSuXisrefqLaB70IdxGj6Z5qKxH+HjXphSNBoKo3G/Qq9cZcN7s2+HOK1SmE285YpiLewkT36xkpyXrNSQdVQZSaYY6XVcYD1s4l6iqqgcEPYu7x8y4ntCMT+C8loOuATXJxONqxKh2OUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806995; c=relaxed/simple;
	bh=gprJHc+muNKC15ISudQdSVsMnMKVKtrgEn+W32MUXR4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OPi7hyGkYdBtd1iU0O2r1AfHqGHvCaCwMThm0UsbLWZhCsmA6trVVZvmgsvKJeLUpJzFvgOXWFDpWwehbWVgr0upKgkSK+58MXviXZuApyK5JB+b0o0ZTewiU9bKdGkFrX6L8TFCBtZ5geIMX0rfMN+MuIHXEeoodo/bnzlijzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeoJPhqu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeoJPhqu"
Received: by smtp.kernel.org (Postfix)
	id 5E829C4CEEF; Fri,  9 May 2025 16:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E0AC4CEE4;
	Fri,  9 May 2025 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746806995;
	bh=gprJHc+muNKC15ISudQdSVsMnMKVKtrgEn+W32MUXR4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GeoJPhquLC9TIkJ4Ki7jdWNqB6KouKl1Al2Ylz+NSPqXRk2VyGChG4D3OpEt8DMEL
	 s7HSo/3pT9ScBZSGrkYNJYRUQ57a/p6QmgJtNFDf0fuZcXmQhVQJ6ERbfdBBx3wBEU
	 43yxf4Vo/udbzAFmIV+qwVG4MtaEgn2HfN4ZgBCzQhCkUAB++W0e05X7kBs1Xk78ck
	 fyhz8hoo93PWoxrTp/DXL9IlsSOkOIgl/0Hq+hBZa91Ngu5ANdU1aYCdwbvtpXEXpl
	 jDO9HbiNeIHSf7+9VagGvs3SjI7OcO9pYBjHPfIs+QXyA9spWJtGrZR6tSaamVF0LY
	 t6lA6V9Sy7lRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB011380CFFB;
	Fri,  9 May 2025 16:10:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC fixes for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174680703376.3673480.5615425199483773589.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 16:10:33 +0000
References: <20250423145047.3098-1-sven@svenpeter.dev>
In-Reply-To: <20250423145047.3098-1-sven@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Apr 2025 16:50:47 +0200 you wrote:
> Hi Arnd,
> 
> Here are two small fixes which should go into v6.15 from our side,
> see the tag description for details. They've already been added to -next.
> 
> 
> Thanks,
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC fixes for v6.15
    https://git.kernel.org/soc/soc/c/33e79299f921

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


