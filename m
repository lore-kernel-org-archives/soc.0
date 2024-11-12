Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E31B1FEFD9
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450696; cv=none; b=t40YP+tk0vgpWA7X3GLOUMVXjbyveSm8nkPLqw9zHCuLgiKqaAK68+8SUffZKdmXFF4fwOmMsOaDiJRnP10AhjZmx9QMvDltS4etwiw93Au597GF+Aa4/uaGVjCKc98f5HSiBRP9PVSyRuWccswCppalrsiAgt9SzqOjiz44+yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450696; c=relaxed/simple;
	bh=geQNUxpxZxsR4kMdDGNutMofLoiLyt9/CSi8mLovfxA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rDQlFNV2udqhkrCNemrvg/P8HkIG877IBQJLlybtL0n/rwRxXnc9vRSsW3lDxDLsJSfCgldnBr82enMase8be3vwSAlVLZ2RwLgiuXXDIiuBAun2k11u7p3p2nCeSmQvuS1cEZEbEQiUojapTRi6Cc96NJoElVP+GsJleFQhr+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYczAeOW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYczAeOW"
Received: by smtp.kernel.org (Postfix)
	id CC537C4CED7; Tue, 12 Nov 2024 22:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A5BC4CECD;
	Tue, 12 Nov 2024 22:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450695;
	bh=geQNUxpxZxsR4kMdDGNutMofLoiLyt9/CSi8mLovfxA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tYczAeOWFW2SalweOXh4yUZ7EqAqqxh/jUiud50Pk9bBOjByZAn5EICOtQWQ9xcJ4
	 3whkEg9jyHvB4VTYXfWO4TW3Mw+0QQPmGX26WKg26374IUqqpWxGY8nGWpZaQJKVDi
	 3Cdvv2V5HG/QF/LY2usfDCze3EUIOdS9paIkl5LiYdDH3oDdLqg5YGRPiV9c/bv4GP
	 WuzEKKNqZZjlv0pLFcRLUpJKKxGwh/nZ71I7honh0Mh64lsrkAOLL/pSi2+lXoM40Z
	 CmDMg5LBs65o+BMchRoUEdIvSritkzoW046C65eCFnZCBqYgtf3mjj8BR+DCygItUS
	 ptxG+UNA4+Xnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D193809A80;
	Tue, 12 Nov 2024 22:31:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] samsung: drivers for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145070599.694695.10773085202917151309.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:31:45 +0000
References: <20241029081002.21106-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241029081002.21106-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 29 Oct 2024 09:09:59 +0100 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.13
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] samsung: drivers for v6.13
    https://git.kernel.org/soc/soc/c/16023977b9e0
  - [GIT,PULL,2/3] arm64: dts: samsung: DTS for v6.13
    https://git.kernel.org/soc/soc/c/c78a5066ff4a
  - [GIT,PULL,3/3] ARM: samsung: soc/mach for v6.13
    https://git.kernel.org/soc/soc/c/269e715b9924

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


