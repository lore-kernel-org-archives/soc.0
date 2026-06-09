Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC3A416CEB
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 12:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008232; cv=none; b=BAMdsm4FI6pP/VzriB7zDOu6wmMbm0dkWXUbeSDxO3ZttsbFAcoNd7KB40G18A0P3M5p7+yOsxNYobxKwHlOTablquB5D3CY5iK83CJhzZ2Tm9+qTwYjI2O30peyzHMU6DFghS8yobJ+8YR/kuJbSLZY4OReZpyw8G+bRaMZ/1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008232; c=relaxed/simple;
	bh=E1ae7ZQS8RJUSLRikG7NT1coJcrsI10ZGDXfq9C59Q4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=t46bBygfPamqEGql48/pXskDEIYMdCiiVGaBXqgJ5YImbm9cDVWqlKDfpdkW5C/FnFOGcVwQkQZDblAa7iCd3R3Dq8vVkMfWUERVVl3WroNRW3o8f3FK+46c7Ka5E/NcYpFEvjrC3f+QGgnSN92qrpIdCg3JsXBL/NaXTGOFe5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LL6Pu1EC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LL6Pu1EC"
Received: by smtp.kernel.org (Postfix)
	id C011E1F00898; Tue,  9 Jun 2026 12:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96601F00893;
	Tue,  9 Jun 2026 12:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781008231;
	bh=YSf6+ZQVeVm2RS5OuFWipjc0ys7XKd6+IT0r8+OKjF8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LL6Pu1ECNhtij8e04Dl6zmpV/4WPXqAaKVaiJO93685ru2aJH07X2DtuvzvhS0gQb
	 E5xgzB71/GUvqobbR3xBidiWQZm2NUJNYapatpIImgU3bw5FbNLTAYPvyDEuwAvNAD
	 p40/gktavxXEfgmDPBY6JyBKoF4VMExMCe4q6VRBorH8gv0Mk7Ywtji9S5BMw+Kycu
	 Lc6x+jvUpLflJ6LaFTGSNI2SRyagN2OiSSs0FzIfI83eCKeVgnaamIkm/6MPkM4nEf
	 P39KXy8+HIYJB6u6QueD4DnScOgZMEFn2jeA1W1cmxXH4B7r46bw+DL4G8LkusHlHE
	 iAJrtVQHnarBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568E739308CA;
	Tue,  9 Jun 2026 12:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178100822993.2001790.12062044070498210737.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 12:30:29 +0000
References: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzk@kernel.org>:

On Mon,  1 Jun 2026 11:12:20 +0200 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts64-for-v7.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.2
    (no matching commit)
  - [GIT,PULL,2/3] MediaTek SoC driver updates for v7.2
    https://git.kernel.org/soc/soc/c/adbd66a8f7cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


