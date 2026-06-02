Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0423DCD84
	for <soc@lists.linux.dev>; Tue,  2 Jun 2026 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400417; cv=none; b=js0NFaJJA7Vkntk25vEVk89CVuFvQG6yiApfRMRNxlB/RBXKYDnyaTzlZbURLY3JVk4h3RdQu4ElqhdLsoENGaVZpu9ygRXH6CPTpg/OhN8EQkkoTL9wmbBTfN3XikIiq2pEploz2MJT7lsBqrt1E4ANg84W1LuUS+GqOMN01cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400417; c=relaxed/simple;
	bh=CmonnT5mjZdDRDKYxdmSf9POFg9tGetlNVBoeIR+/4o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Ldl847ZFkUciEet+sqlNd0pTuc3xM1KA1UTsQT7ZahZbLresyHEPjtH8RaTmMi7etdAd5utn9GPfnWr7M7wss/5jawYlUpnnbeKmgrmOihduNYkd7vq6vBi7ue+Y62HE1wJ1ejzskbgJ5TOIcg0qEeWSQaPSUs1+afMv4tIeYj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0zBrGIJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0zBrGIJ"
Received: by smtp.kernel.org (Postfix)
	id 301D71F0089B; Tue,  2 Jun 2026 11:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5D71F00899;
	Tue,  2 Jun 2026 11:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780400408;
	bh=D3SwBrVzYruG2UHKU61Peqq+LVW2PAvvFM6+/NDAYug=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=M0zBrGIJAxzkk9k5eOlEVHL/pri59OyoNjb289SfrIQ0lmOBHqJcIMqVevhAHBnFc
	 u4JbYw58tokTcU41m3RhjeKXeMKytmpFv+eyD5s98Km20lD2ynKKna0O7ox/C1vUJZ
	 Az6q5zgVNAIvm6kSewzZV4pXkKASJ/XgoHB7ISnyTufk4Nq00sfWWBsxgnZsbgfJW/
	 Qpdn4q78rnHkwZWB+YBdIQWCXUAY7kBkjUObNZ/PIXCPhV2wuaqXNMj7SwHsy02g4e
	 rOnzpKKrZkzm2TE5beBnIRi/YmVnlXFQsIm0OE8tawki64cW2DHt4V8jYvaYA9Leh8
	 qun+nZJUpLvTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5673C3811A53;
	Tue,  2 Jun 2026 11:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.2 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178040040988.402603.9024940232113525842.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jun 2026 11:40:09 +0000
References: <3616130.jNaZZp9DzI@phil>
In-Reply-To: <3616130.jNaZZp9DzI@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Walleij <linusw@kernel.org>:

On Tue, 26 May 2026 23:18:08 +0200 you wrote:
> Hi soc maintainers,
> 
> please find below Rockchip DT changes for the merge-window for 7.2 .
> 
> Please pull.
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 7.2 #1
    https://git.kernel.org/soc/soc/c/513edb149628

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


