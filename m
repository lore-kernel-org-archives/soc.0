Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017612;
	b=d7pgEgxOeuZb/u5H6b+VT2OhVMPMLU94RP1M1nMARJP6zC2Jqt4IM9pSsm3Z/4m9RP7x
	 jI2cMvOePpTzlAr7hTFtsMQEflV6R1liy9LE4m6zfzcRdKogWv86hzECW+tTHQfZOUfSN
	 008IOTk8wTRn3FKNSh5Ak+rNF1wWI4G181CBEx9oX7fMKYSnvur7CisuCXPICPm3WbNYP
	 4r8AD0X0ONxmehyB9oaIgd4cjYz5rH4JiMfvmO8UWHcSNj8XguOcCZ++73UiVCyQgQMy1
	 1cixqpfdYg3G1d2faCcpbBLoMOTN0LEEX+7K2cPuKPs3eTHFPaMhgwQ0CvmyA50zTpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017612;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=2k+Gi5Qtz6JqMt7U8nr7Y1AChYir7Fk1DGgilRy0iTk=;
	b=aKukB/1/iJwziNS1m0HWA+WTQXC4tvMDDxkmYzVxOOVeZ5igOpqyKoKX1kvRKKrMzZ0s
	 ifIrmD+TTizv1Ewq8vkBtIZI92LtQJQpg/zPg4jDZoOFk2xjQKnG0er5fXsIAtV5ovfpZ
	 FeyEM7CwixUOil/vtxXMbW2vJ6JDhMiEZHrKRbldr9v71CFyAVFUbkVXM+48jObKUT7TM
	 lJu+Hb9QHEe6yF4KpQxmA2dW/zox+tlAplvtVca3n8TKUyu5AKUtN/infCe+3prGOU+O1
	 ZxBYiv30Q9Z9cOkEd1noooOvAlpx7x0LLCihjhY8Z//TBAqhFZSpKYXj04kXrVeVa/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJr2l6sO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CECB606A32A
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJr2l6sO
Received: by smtp.kernel.org (Postfix)
	id 1E8141F000CA; Wed, 18 Nov 2026 16:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07AC91F000C7;
	Wed, 18 Nov 2026 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017612;
	bh=2k+Gi5Qtz6JqMt7U8nr7Y1AChYir7Fk1DGgilRy0iTk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FJr2l6sOPoTk8Mdq9f5WIFAkw2TzYupCCQt7CdajHYALBKYTHHaqcrrj6/5uvYM0Y
	 iOdVY6xgo1KKY63RvPyR8JPnM6Z5SvgIqjRAIUIMj8qFgRDmxzyan9rwI7h3jPKYvi
	 UrMs3O/yqtS84D6IA3zx5Cr5rbbWdy6hOeuQpAY7ZdMakMXOY7gViDLXLOLWAq4/sq
	 TBouQAoHW5IaoOi89vHrVrfCpjS+yZ4N5ydOnS4eHtzmnT+2sS7uufQloRJ7mjvhv8
	 2lwuo7pubQVm/LWsyJn7wWKCDL7XlMtKfxgczMezmcceiYkODE1u/VqwvlImFnKYnq
	 3w0hidZn7IqKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15BA3808210;
	Wed, 18 Nov 2026 16:00:11 +0000 (UTC)
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
Subject: Re: [GIT PULL fixes] ARM: dts: samsung: fixes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501761068.1802028.2617147129612729086.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:00:10 +0000
References: <20261113071751.14775-2-krzk@kernel.org>
In-Reply-To: <20261113071751.14775-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Nov 2026 08:17:51 +0100 you wrote:
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-7.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,fixes] ARM: dts: samsung: fixes for v7.4
    https://git.kernel.org/soc/soc/c/523d92e96d41

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


