Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A351B2F0673
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163433; cv=none; b=Ig3PKd9vcNlapokSaagIS3i+wZfMxZ3U/FVfckLayhKQevefg+i67j0OamlqyOgxntFe8kRATbp8h6nY9LBDaS/ZaUaXBRDPdtooCHuexuK+efsZZnV3dIqf918qIwIpTALRBnxrdY8gTT5R+Ko8yuIQQKHpx/9fAsl4CdqcAE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163433; c=relaxed/simple;
	bh=xGJBmI/JPlr+xlOv0I/jxeQjN4KiYwYtbzqQNdzN2qI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=W4zeaEwLvV2qdcFIZj1IJnpHB7pK9mRgtmDKI/IvCozA6eQesBAwWW3dNOjhQWkVUf9VlI5ngHGxuDe77UYgLOXLxSst3Jm364OFCB3wKoTN9TTp02WaHghjteIcLPKwul+OJmFBW/k/FpAru58j/H/CSzzsEJd/akiMQ6of5BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOgUf3Tl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOgUf3Tl"
Received: by smtp.kernel.org (Postfix)
	id 971181F000C5; Fri, 16 Oct 2026 15:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811581F000C4;
	Fri, 16 Oct 2026 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792163432;
	bh=WoNRCclsT80wf0umVYogXLarJAFMtYecpN18XI6y/nY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=iOgUf3TlcW86n+/0kjTpPYqLCI+1LhwINAYHXGwc2mJCXOXIj9K7x3NqI9dgfaKAU
	 M/JsDxfRlqSqCMRyP6VfFlWzus5OHLhmDstqqMvXYuAqD3c+r9POtr468HfX5TvvPo
	 7RsfMcFXdchFAD5PyHompXSgbMEzjfQmmjFaRRiqLOqNngBfaGycqB0WxipSHkP2/F
	 XDxrRiZ1gCJBHl2I5aLuMvxevrzF2N9QgUjv1Gr1nDVKxwvlvUrGmIcq0gdZ0JjlQK
	 Vl+hYzm5q5y+83KZYoo1bo20uC11uuoXUbybbL1lXTlzY0ClltKiq1u/L2PkZ1SE9b
	 Ncsw5rHxH6hNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773A1380A966;
	Fri, 16 Oct 2026 15:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: AMD/Xilinx DT changes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179216343101.806834.6734024131521677143.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 15:10:31 +0000
References: 
 <CAHTX3dKJ9DKTUHOj+KvUVuePPXF25gmiLeaDJChTko9jV0DmFA@mail.gmail.com>
In-Reply-To: 
 <CAHTX3dKJ9DKTUHOj+KvUVuePPXF25gmiLeaDJChTko9jV0DmFA@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Mon, 12 Oct 2026 13:08:55 +0200 you wrote:
> Hi,
> 
> please pull this simple patch to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: AMD/Xilinx DT changes for v7.4
    https://git.kernel.org/soc/soc/c/e3e57716f242

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


