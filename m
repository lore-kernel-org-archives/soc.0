Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2967631A56D
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 22:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081426; cv=none; b=CnOZ5SpNHyh2/QXBcuLea5i559fT/THTn2ZfShBI9ewpPtAIeKslf3PFcI8qx4CdNeixBFqs6O4LvFPBEfonYSeNkDXZf0EXELPEqTb2RmV+2EFCSIpYiO25z/iAHQAZI79KGKsRIMFjvl0G5coUq559KT4otlQgB8UVDdIM+sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081426; c=relaxed/simple;
	bh=33+EiJpNIXEax71Y1ITJybjhWPqLpA4QbbaPda3DFd4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=A6cAI9DPSxvYMwzSisx+U4dQDc8NbYilBBuaIPcpKVYlDdcDEZ6oZJn/zS39qSS+qOLZ0+NimHkmS3pZsBrHZivojbqBfMzxbiPDEbSxgVVx9ruyNtJeTlmHLeEyivsrK5ViiH/feLrfuVVaW3KQgI3SwoEi0zXGeWtLt4JXCjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7ft2GXp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7ft2GXp"
Received: by smtp.kernel.org (Postfix)
	id 103AAC2BC9E; Wed,  1 Apr 2026 22:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF78C4CEF7;
	Wed,  1 Apr 2026 22:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775081426;
	bh=33+EiJpNIXEax71Y1ITJybjhWPqLpA4QbbaPda3DFd4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=b7ft2GXpvfPZKGtGN4Jmzi9Gkd3296rKU2TthNyk0x5P5dpKbrH9jXPXbjpYNtyZF
	 wKFqtTmHth7AN8RG2M+mnED8AhRHqTyyubF5cJp/Ut3RwTVAcY6uNFgeXamT3wo5ON
	 WDdQCVEQBumwdcHRJ6d8Ft8KpLxUpU+7sELFk1yxsEIVevgdul0yadyeLIOhIcvBaN
	 zfWtbLZ5FqFjGykkUV8ZD/TB8u4y9bcCLoW1PthDSmo2po0ueXFBpZfWXAE3ZeG4GI
	 OqU5D7nmuJLpFBnzZV8PdlrgHpvR7d7qPzYVBJ96ujl5GjlWTIxdiZPV06fnduzeo4
	 ifE0+minsrlgg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DED3808203;
	Wed,  1 Apr 2026 22:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] samsung: drivers for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508140879.3882930.10433124042415138465.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 22:10:08 +0000
References: <20260324125821.59728-5-krzk@kernel.org>
In-Reply-To: <20260324125821.59728-5-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 24 Mar 2026 13:58:21 +0100 you wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] samsung: drivers for v7.1
    https://git.kernel.org/soc/soc/c/fb5fee1cbc29
  - [GIT,PULL,2/4] arm64: dts: samsung: dts for v7.1
    (no matching commit)
  - [GIT,PULL,3/4] ARM: dts: samsung: dts for v7.1
    (no matching commit)
  - [GIT,PULL,4/4] ARM: samsung: mach code for v7.1
    https://git.kernel.org/soc/soc/c/23e4b0532da6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


