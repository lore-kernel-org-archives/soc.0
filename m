Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CB5CA5A
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078683; cv=none; b=OIf/KgOeaD7NT+zBXjiqScK4SmneyP0LWmzWYIb1eMbEs0S5PWMpTrNf6jZeNK3j3Vp737M29HU3E6mvq4lYwyws0TPT/cSPBuAUYEHE1lKgCdQi8SiGXXCO+tyWdb1pH/pIZul5MKyflxbjcog9/fyor+BNHVi+X+Vi5sqLmd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078683; c=relaxed/simple;
	bh=kLoCQ1yeuMq4H2rw1ilF6GkAX7AanWKiBUQoD2iJ+j8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=E2MfuKXK3qfXoW1emxDxsfZkWN5lXUiipsZSgNvvM3JfrQyiDxa0ezYyyCdSQiOYaP87/7io9yHEqyRDfArjuoHNoGhlup8dcw2cvY8JUwVrRUXCseuP0MZNh6gr1tL0nfS0gWzJ0j3YZmfr3vOi1sDRta7kR+OtIeafLaYDyoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5sIL2tL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5sIL2tL"
Received: by smtp.kernel.org (Postfix)
	id 7C0DDC116C6; Tue, 25 Nov 2025 13:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669D1C4CEF1;
	Tue, 25 Nov 2025 13:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078683;
	bh=kLoCQ1yeuMq4H2rw1ilF6GkAX7AanWKiBUQoD2iJ+j8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s5sIL2tL7A3SfSy5fepEskbplkg1xsC4fB2v8EnZHzXkymC/HLeWR8Sl24injmhAM
	 cdaegt29dCyKHdDChl/q1kibkd7CfQx9wWD//WTHa5MWenfjnQq4HUpMOQY/1d/ABV
	 LmL1J4F9nJZi9wXvybaSwTl202+SpoycKuinnfQa+DiZAxxEp6nNMHrit2dgWqMWwb
	 Zq5FwImcwteeLP4w9gjO7mFOtDqMcLfP1QuLcH70vxC754cJYn3/qHHc/vOsbL2hHV
	 jkc7fcRUTp7C5xXPOZzZWTEdTj7xpVkMwHLshan6CN6RAj24NclN7rnaX6o6s1b83x
	 xnH9+M7YWZMyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33EB53A8D153;
	Tue, 25 Nov 2025 13:50:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/2] Renesas SoC updates for v6.19 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407864599.736376.16313551629968973229.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:45 +0000
References: <cover.1763115230.git.geert+renesas@glider.be>
In-Reply-To: <cover.1763115230.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 14 Nov 2025 11:30:15 +0100 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.19.
> 
> It consists of 2 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Renesas driver updates for v6.19 (take two)
    https://git.kernel.org/soc/soc/c/9b26d16d790e
  - [GIT,PULL,2/2] Renesas DTS updates for v6.19 (take two)
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


