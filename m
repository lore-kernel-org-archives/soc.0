Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549763218B3
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080223; cv=none; b=DTPJtlPYO+PiiCVCuATzT8PC5HHwB4Sw7FBGsHjDbvN+UOL75PwzqwrRm3LSmdVSSkGDzWsouWZ7pc54TiLLXBUvlmhKgZl72JhctQ0xuvCTuocG/L8nEkuC9k0WRZiZsXsglHo3xD+Uqb0FKa8Wt/Dmba6nMeh9EBKY/6YDLmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080223; c=relaxed/simple;
	bh=pLqb6wp3hpFs31N5Oj1dE5IZlz/kh8uu8aT79p7gKKA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CgMyoFE5xs/ju61T9qN+AUW3K2lmBo6fhee7hig4EIXGuSQ2A2f5Udy53xpFVABGRC9u7VyhGGo9rIxqN21+faF4Cf5khTunFTFIft2ax/qqvq11J8nQuT0c0Vlgu8NH1QfvGkcnVoOw0oQn0/HQgkLcRBDBf7v/TyIW0VR26pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrYJesZP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrYJesZP"
Received: by smtp.kernel.org (Postfix)
	id 1B83AC2BC9E; Wed,  1 Apr 2026 21:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D28C4CEF7;
	Wed,  1 Apr 2026 21:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080223;
	bh=pLqb6wp3hpFs31N5Oj1dE5IZlz/kh8uu8aT79p7gKKA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jrYJesZPjbiEp0SvjpE1AywVDNc88EB6XwBZch/eeOphj3tzLpCCwq/lriy92pHw2
	 IzPTsL2Ru/D/LqYkcAgpaKDpSew5DEoXQd4z1edIN7ln1dYCBHyw9OMkhusJ+HOMTG
	 QJhoKi5e486DTY+mkXiviCKvIhS378JXhwSoYa45iRbSxfEUfmUDOmOiUeu3MYwnKQ
	 SlQt+7m9eMS2GmYyalwsZvG53PsV+ow9Oj8NEZ0b7RKGVJOn1c5ah9DDemsb55cpWT
	 Abidrv1v+ph8szVsJ5kqyQZUQAmveclps9UhFlJr3vDZ6/erK/xaBX4UMh2TTKg+x4
	 e9PZIEUOL5xPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D2C3808203;
	Wed,  1 Apr 2026 21:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm Arm64 DeviceTree fixes for v7.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508020579.3876275.4518948344836917948.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:05 +0000
References: <20260331205318.952913-1-andersson@kernel.org>
In-Reply-To: <20260331205318.952913-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 31 Mar 2026 15:53:18 -0500 you wrote:
> The following changes since commit 2c409e03fc04b5cded81b7add9ce509706c922e3:
> 
>   arm64: dts: qcom: agatti: Fix IOMMU DT properties (2026-03-23 22:31:40 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.0-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm Arm64 DeviceTree fixes for v7.0
    https://git.kernel.org/soc/soc/c/b986e98ccd0d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


