Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75453E762A
	for <soc@lists.linux.dev>; Wed, 29 Jul 2026 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340848; cv=none; b=AWvaYu5Fem1SniGn/I3hZFK2NlGRQBqGk7I0chS6im/kvuJuYQeSCLLOwbMZWBDCXFi8mjFzmUX/TWR5bV9DL4+9qMUsU16shv4GKAX+oIaWmAgq8JPtw0KV7bGrldYQT4AFDuLFdACMqhU5OA+zkpI7JgjXdml7qKZme4W/G6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340848; c=relaxed/simple;
	bh=71/WQLApyY4muzexrkqFLx+Gbts8wj+p/nkFY5wiSR8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OILEiT38HUFNo3ewRtG3GhafIHnn9xeoNx/SsybFuJWzxnbyZwkhFkiHAf0smxKI06wfP5mC9dBPij1MXe3DGEdS9om7wao83Ner+dwuEjzYan6Nmv5/qNMK9UjDTPC3ebysTcFzD/iI9CGVNFu9dj4Vjr+rf4qtbcVuIrOwD+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DU3KCFmm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DU3KCFmm"
Received: by smtp.kernel.org (Postfix)
	id 5C49E1F00A3A; Wed, 29 Jul 2026 16:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C801F000E9;
	Wed, 29 Jul 2026 16:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785340847;
	bh=zDVqtPM+Pn6121A2MfjdpuUnKFSnqONKIl7nVUyUO4E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DU3KCFmmRKsl0hB1fUCdIzktT9Vqem3/zUfY/yyUMGoWw64qhcaN1QauQXcOviY7R
	 xTkNhR0K92SgSI0PIvRflSL8ggAO0mCMMpug+ZwkDYn+7sTiSSVOGKjvoKcyR+VAE6
	 qyeDYbl/W1hCqMBNo6Rz2//Qjj1DenFX+yvKy+9VUUiynQMBS8GuJcHjOjQEQWLeAu
	 QmVIN+wO/l9jNetkUtKCSiNs4WzyGzVg3ouPIXYbHymXKCBaHRFu+2ERJwHUKl+1WL
	 7AYQ96h3/D2wTFWCULNRjyzhGFm7vVVLM0i5j6iHcY5O3+Z1FxYlwxjZ0C0gnKirWO
	 rrFr9R560jsow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD7439253CF;
	Wed, 29 Jul 2026 16:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178534081149.3143403.9998921913251059306.git-patchwork-notify@kernel.org>
Date: Wed, 29 Jul 2026 16:00:11 +0000
References: <20260727190758.406132-2-krzk@kernel.org>
In-Reply-To: <20260727190758.406132-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 27 Jul 2026 21:07:58 +0200 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v7.3
    https://git.kernel.org/soc/soc/c/41cbe7ad14d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


