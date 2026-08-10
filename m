Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D9242BE99
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 16:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380690; cv=none; b=Q/fRqcG0jC+5Ul3N5BvgyW30etKAvNBBDMcNJxsk1DUwd/Dnxe/E6B4VtJoIWvh7SJDjkwHys4N9UQ0KZsvKgMPcrbiUtzGLMsO/b5jAVNMXBVQyFyC5GQhF5T7ciVbf02uLMYbQ+jZRTOMGeBJmuXFeNya4gsq7M7nOJuP7ioc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380690; c=relaxed/simple;
	bh=r5lvCKOpEgM5DeEQav8CAjVF56ZlRGiuMwBPh7mxE2c=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LLAsTBjGkX8muOlb14Kc2ZAWg5zWlckeNYkL1+A61ujKGgnTiMGCwpZ4HEYKtdSGYSVQhhHAXIlW82l+b6QEG4uVGrWwHI7zp/wTyav27eFeaWzz9QZnNczRj9zHvxE0DpviNdtJQ4d9AK6VRe7SeghAnNcerHlok/gvGXF5ZAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYHXmDxF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYHXmDxF"
Received: by smtp.kernel.org (Postfix)
	id F1D201F00A3A; Mon, 10 Aug 2026 16:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEBE1F000E9;
	Mon, 10 Aug 2026 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380688;
	bh=LBsGjBr2O5sf/FBba17qGQXh8Yxjf127nvlnf/kPkRY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PYHXmDxFdmRRHRVm7CVLTUhJzIsr7njAaOUTiSJ8vCECI1kI1XFDcsGlBZUr1BLGR
	 2Hcelrwi6gc1WEibVYVRaJCEUaf706QunLxDyxXyY7s0UiQH1LSuPa/I9qP2fL0ods
	 TDrfEdlKwmcmjtkiy2x++JPXXUviyiEgxAqiGbFEwg8KVvvP/WVTwronkSFC85aJHm
	 WwjcXhkupbmuHOQSJ3OM3V8yTUgm4gFJ78KLFSk7+HZ4LfhY68apJcFxtvZgiqW7bY
	 uR3RGMKKXC/V5Q4XbWxvgVWpqoyPg9m2GhHpbzqdPNe4LEts0E+POYIshb2li/yaR3
	 vv1pPI55V0hrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B4639253F2;
	Mon, 10 Aug 2026 16:50:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.3 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178638064538.3872609.3385012366276305971.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 16:50:45 +0000
References: <5318464.usQuhbGJ8B@diego>
In-Reply-To: <5318464.usQuhbGJ8B@diego>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 05 Aug 2026 19:57:31 +0200 you wrote:
> Hi soc maintainers,
> 
> please find below some more Rockchip DT64 changes for the merge-window
> for 7.3 .
> 
> My personal highlight is of course the Anbernic handheld - mostly because
> I own (and like) that device and am looking forward to getting rid of the
> vendor-BSP-based firmware on it.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 7.3 #2
    https://git.kernel.org/soc/soc/c/c26bfefed061

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


