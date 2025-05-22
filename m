Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7843236453
	for <soc@lists.linux.dev>; Thu, 22 May 2025 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747912800; cv=none; b=NG0uHTHV45Qy/tYTyv2P+K2u04MW2T5E64Ps5LSyz+1E5wDBeU5nMmKz1pIUsuZ1P2oczfKnZ54oHE1CnOmQrtnnQ0iFcgfVVUgkybBbrj2X93YvZb5N22OVliohmyuu39gHW4v7wKbwn6yFGPVdbaOX0v2FmELxA6yunJwwtNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747912800; c=relaxed/simple;
	bh=e2zOknMOkk1d1kFwnCy2I0qrk6iaA609SEcr750SxYQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mcfl7gTVqRR9T38zKGY4G2951eiD/S7Nwi4TPnK0997G8ZzlI4Jf+rgYz7DJ9cY1Vgn/QAKB4kO8iLPnGA3Kigs337/6RoFizd5xfHRQ72mfCuEEwHIzG0rz9VF9F8WerPkXIqAoUNKsogpCRnji8KFH7xkVb9OlQQJa0+MY1qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLfIhljC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLfIhljC"
Received: by smtp.kernel.org (Postfix)
	id 58368C4CEED; Thu, 22 May 2025 11:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6F3C4CEE4;
	Thu, 22 May 2025 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747912800;
	bh=e2zOknMOkk1d1kFwnCy2I0qrk6iaA609SEcr750SxYQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aLfIhljCKBd/0RPNLmKPqSYAzwDMkC4SsqZi1JjML7oXeWm1huhA/kJgOLpK8W+Dp
	 SOcdNUHJD2LeOh+J2JabTX9xxmNLONTPGTXKksfd4ULjOGfvYVIh28unEBoJnWpGQK
	 +cGObg729TScJAID1EWyb/ReMRPGKK/ka6nIMkr33j/nSWkqDefLa1PZSJgC+8dJ4G
	 ok+c8k7AJXIumBirWG25vMj4pl9VLfn5RkmNCop0ungWzmVjGcfg8BK6+Bjf23fMFx
	 TIHu4DkiAbQcaFgKmO+X3m07ElbMXCwfNVDRdiSGlVuiaL9n6nt+VPA0wHToi9vbpf
	 hz2aWDTc6CEMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFE43805D89;
	Thu, 22 May 2025 11:20:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/2] Additional MediaTek ARM64 DTS updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174791283574.2837630.10962175722468029753.git-patchwork-notify@kernel.org>
Date: Thu, 22 May 2025 11:20:35 +0000
References: <20250520114356.1194450-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250520114356.1194450-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 20 May 2025 13:43:51 +0200 you wrote:
> The following changes since commit 1fe38d2a19950fa6dbc384ee8967c057aef9faf4:
> 
>   arm64: dts: mt6359: Add missing 'compatible' property to regulators node (2025-05-06 10:35:45 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.16-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Additional MediaTek ARM64 DTS updates for v6.16
    (no matching commit)
  - [GIT,PULL,2/2] MediaTek defconfig updates for v6.16
    https://git.kernel.org/soc/soc/c/5c9876f9d1b7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


