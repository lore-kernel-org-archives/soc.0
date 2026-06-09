Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB387352C2C
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 07:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989607; cv=none; b=uF5t80U9BxtX/KwBDTZll5uR8P07DnkNpdRcM5z0FFPR9pG9uGVObs9r8yPZWXcfm7RQ0lagQXLcNlN8rVSKWeb/XiFx0njoWFeJqPMojzO1bZgzcIhxhj44tQhPD55YPSeL9wxND9Ri74ncG3TRHtp0/+V0oczuy3/5jZJEhuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989607; c=relaxed/simple;
	bh=Z/MSSIXgzapVvV7II2ii1O5r8ss8oOAPUpNd8yn2vB0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fs3EVqhbFR58TqT+ZACfc9E4wjKQAP8PX261TEYoYh2M6pau821NsWLl6ZvDlCZRO/kT44w+hntg+B1FsIxDDyPbILSV4nDkR3iwwajSORdVpCayyV3LvW5FHSStIuUu2UTkmRxa2Z16yUYmeQMPhEuuHdtEMJ7XsGBFPxAt+5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzVXaywv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzVXaywv"
Received: by smtp.kernel.org (Postfix)
	id A525D1F00899; Tue,  9 Jun 2026 07:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB731F00898;
	Tue,  9 Jun 2026 07:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989606;
	bh=d8odz5PrFl2bLN6gCDceIV2QTyfHu6ws3fTZpdeg+Is=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KzVXaywvXzkzVqQJQVBfczJlYKtdGBqzcCsEt3ndPCj0vyeUdlwfhWT8rHxAqr8/M
	 xMaSOj5Wy5cYziSm3NP/LPIJRTv6F6e+rgNA85s60V1kQG2yoOryxpi2t6FFyRm5GG
	 lbkiHUPaixSShUYSPsrumY+u+BTqPedlBGn24G9aB2JL+ROCqQ5dOsKZPmWQvGkMtC
	 q1LMY/7IS75CmdbFfSp6KHrm15U0w6UT/eLv8SMOjJoVDuB4fSYk7a4kqC8Unlyrn2
	 qu3pzR8HNEMFX3KH1GOL+earEN5QUKAG6SFkbXJG/0XXUzrzP+13J7AOKWNDK72NHs
	 pWr1Fk6KN4iKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569CC3822E08;
	Tue,  9 Jun 2026 07:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip arm32 fix for the current 7.1-rc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178098960489.1848550.8448058856311926048.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 07:20:04 +0000
References: <4474108.o2A3GueYyp@phil>
In-Reply-To: <4474108.o2A3GueYyp@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 04 Jun 2026 11:27:34 +0200 you wrote:
> Hi SoC maintainers,
> 
> please find a below a fix for an issue in the ARCH code for 32bit
> Rockchip SoCs, that appeared with 7.1-rc .
> 
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip arm32 fix for the current 7.1-rc
    https://git.kernel.org/soc/soc/c/9c648f355492

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


