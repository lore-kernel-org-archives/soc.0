Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE6F3164B4
	for <soc@lists.linux.dev>; Sat,  8 Aug 2026 20:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220511; cv=none; b=UPCmPV5wtjnnT1wKVjgj5xAiPnK1bphlUXKe9Ckzz4ayEPwnaEMX5IUVkZzRcUmEIjc9izSRKpmUoFlZcwLITuQycc53LFtJv/xUiHCiNXJ+7YcuDMZW6X5F20C9Tvy9K2aITQdr6g0Di7fk7zYURyLaBLxI9+3mbj+DxTxgX7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220511; c=relaxed/simple;
	bh=fOo289VoS6md7jjvwwv6yEqU+kIiQhkHxe4oTiR+CKA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=frNwGYzOhK7CtUrvZsJKgtdtPdA1EHBv9os8COQkxO5LgM3j08RwweXiXFY4ce1F0/f+VwXtcUj4SijflfQQIuOPbYuSZsfZOLh/gAvHi70+t2svMx9g7vjrLHE9w6aF+Guv+k4xJ/bDngh1argPorcB6AoxYL9oUax5o00mrQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kwk/GGDB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kwk/GGDB"
Received: by smtp.kernel.org (Postfix)
	id 899BC1F00A3A; Sat,  8 Aug 2026 20:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730A81F000E9;
	Sat,  8 Aug 2026 20:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786220510;
	bh=BCOmPYS1XO/rcojh2S2FB0vgNBvxNetlMU9XFfGkQlQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Kwk/GGDBbnNtO6Rpga8z1G1mAdmOebFS0Wf7+3qM2GUrruwNIKvCybqSaD8kel+9L
	 SOC155bbdgD8xkrLG9uzL8jl6QzVot/DH2dU/NyiZOLvMp+ku7D71fRDLVgnHxUylt
	 xM7nH0IMV1F6wqyOX0t1z0UfXVdp4wzfv2BcktJasloVmWIoPv0XmBd/IEg4jrEYaY
	 +cymI7GLk9g/7aptRmfXsv01mo6RORnPLoeefyO2EVXDV9fhjtJd+jeebzoJt9nc2P
	 uUouCu3nUukHg4ZYh+Ddy/WYWHEQzz3q3qPo1faV0t4ztYlnm9YItwACTLdw4thE3u
	 PvDcE/g52hehA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939C2380CFFA;
	Sat,  8 Aug 2026 20:21:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178622046813.2748994.18269482851351795868.git-patchwork-notify@kernel.org>
Date: Sat, 08 Aug 2026 20:21:08 +0000
References: <6A6C59A0.4070501@hisilicon.com>
In-Reply-To: <6A6C59A0.4070501@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri, 31 Jul 2026 16:15:28 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: hisilicon dts updates for v7.3
    https://git.kernel.org/soc/soc/c/82a2eeb8b8b1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


