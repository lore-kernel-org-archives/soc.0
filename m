Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3122EF646
	for <soc@lists.linux.dev>; Mon, 15 Dec 2025 20:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831533; cv=none; b=LmfXv8jWByq4uIly17vgodavBws3u2qgRNv4YoWIudfhjnyHMsStcGVMpMAfBK3Yjas1cgsAjBijiXc9TWfzHFzgyHCwYYdkRwx2PCG9HJ4j9uUtWK3vZ2nniEyP3xeA9+MMshjesgY2879f3AjpwMAmk1CD14T2LUKmZxc0M0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831533; c=relaxed/simple;
	bh=fBpDMMdquzz3gDio2riadGdWhzipFb4ZRBzst+n2YBc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FmflPR78TuY3W/OgKIb89/3Ijb6+j940gJdu9hdy/KKXYt+jcG75cKds1WHs5bJcl2/JHC6qfozp5gpqXDDfQFwXI0M9I7N48h1DpbxTM4ihZxG0L1t/HSvTPCitF3U35u1lrsTIajFqYwBbS4U5s07f6WlntdXkFtv1k65AZhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNynM8z2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNynM8z2"
Received: by smtp.kernel.org (Postfix)
	id 2C65FC116B1; Mon, 15 Dec 2025 20:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175A0C4CEF5;
	Mon, 15 Dec 2025 20:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765831533;
	bh=fBpDMMdquzz3gDio2riadGdWhzipFb4ZRBzst+n2YBc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WNynM8z2hcO/GqUxAva453+uBYhfcqUb09qhhpW3k5DCPIj+RC/RyYT2TKGU28TsR
	 J4xeiiiEW3C8+7Cf66/xbRzPPlCoSyn59txB4hmEEU+QdNcfXrrvipgmVRCuBiLMwo
	 KR1iMBgtUGsGTlxv+PPfXCgHZhWtAuBO3/1pTJ+AJ5cbWA9gyA+CSFRBIvTelBJSHa
	 sdZ7NwQRtirJOIPAJw+OorVFwotdTJhzjixg9EGxiWsKbxEyQiTXUpDT/6ylF454x6
	 JOXOsG+5bKA7ST0j3zRrywjCBDk5O3HJsKSmLKn+eJO3FeRQKmCDEepFtSG4IXRucp
	 x09aeEWL2ZtTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 789E1380AAEC;
	Mon, 15 Dec 2025 20:42:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] samsung: drivers: second late for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176583134402.289481.12480663124321721973.git-patchwork-notify@kernel.org>
Date: Mon, 15 Dec 2025 20:42:24 +0000
References: <20251203175942.296554-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251203175942.296554-3-krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  3 Dec 2025 18:59:42 +0100 you wrote:
> From: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Hi,
> 
> Second drivers pull, but rebased on master/6.18-rc1, with late fixes.  Would be
> nice if these go to v6.19.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] samsung: drivers: second late for v6.19
    https://git.kernel.org/soc/soc/c/68f9bbf4dfc3
  - [GIT,PULL,2/2] ARM: dts: samsung: fixes for v6.19
    https://git.kernel.org/soc/soc/c/79edb7f596db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


