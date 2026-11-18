Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017615;
	b=2zPyyWQJ6c/RQUKFlQbdxQ7srstwAazU3SAaVob1lCOpxOBKZbq9zIasYDduF1nQxvP4
	 Cdm57zoZGu6hvi4/b7lBdElP0n6HtSaAPkbCAjNdCeufY6wRDs/6yhAmQWnJortBViSYm
	 INuyL7ZjCP6Ziezcy3cT9idre382UMHQ6ap+/qU984wOjE05tfRSm7QTurK5KDpb4FVd3
	 c8cHNtzLd+Bw78GsLR6GzKcBkD30gj2ylCBQgBELQonqZZpnWV+PttlhJUK0LjzaPxDV/
	 YVMemV9MYOkbgPfS86dUoiOqdKv3vOnkh6I8b/n8cC0O3RryJrYv/ACY8W+isNuCuYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017615;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=rvExNHiORnZ2rLeEefn+i3Ypq8W2TlUeiEoLIIQUcV8=;
	b=ROsyNdKgS4whXQVsj0iPmEdtn0DiL+/vv6DqmO9TvimErVobARWHGa21pONnGUx03O3Q
	 Fv3Tg6C6Wdfvu/0Vw5Hfdm84ux/U7aCkEwwhmkjLvo02pCxNRQC57rRzRaRY99RgQ4Y2z
	 bWABkBavarpMj2mPzrCdkV4FdaHaXSjUIWpBZOvEAirWym9RiKwze/zqdDYaXLOwWJc5T
	 rWLzfhqp9RG3OREw2/cq+xZmCHi94Iuf+v5Qu/FN8fejkTe/dUHsENJHliHx/i+U3xf19
	 Wm9JqHgyV1mRBX7swkrd+B5McBoICy6Vq6zZN1jJDYGQ1oZnVCZGEz2fXAk+Y+ObaQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4n1c1V7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49329606A33F
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4n1c1V7
Received: by smtp.kernel.org (Postfix)
	id 225141F000CC; Wed, 18 Nov 2026 16:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEF01F000CA;
	Wed, 18 Nov 2026 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017615;
	bh=rvExNHiORnZ2rLeEefn+i3Ypq8W2TlUeiEoLIIQUcV8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=n4n1c1V7veWA7oGxRzax+L1g610lpvxrOextGy2fPvyuio6tqh7eI9zVbYVSntuil
	 RxUA3252u0Cre2G76PFgfHhx6Mlt24sOMRKjC9cVdIyn0AZzioS3KP/p+H9Yr2E8sJ
	 C9N0jXWvYiMNSMlg+KbbJCX2TXhPPjmKNflXev8pZBAHa5r5aOa3w73Hdt20ByciuO
	 2qsHIz+w0KkGOKKUFFm1E/5bGcgwmTzSCsQs79+OlAGrozXrhJM4MqwSP6o0JCzIi6
	 XaL3SWF/5m4FX/jkZjGVkQrA0eJqT4NPEXhno7PlYaxDTe41QVorhj8h1qFM1z2zPM
	 xZGKU6bbzT1hw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15423808210;
	Wed, 18 Nov 2026 16:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] iMX fixes for 7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501761352.1802028.11743199632845277441.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:00:13 +0000
References: <20261116174947.2957972-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261116174947.2957972-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Nov 2026 12:49:46 -0500 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] iMX fixes for 7.4
    https://git.kernel.org/soc/soc/c/6730eb7d5e6c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


