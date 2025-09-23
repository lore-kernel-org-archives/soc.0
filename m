Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115C9265CBD
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662477; cv=none; b=bIGQ+Fwfp0Y3Zj943lo2t+PjOuQgl/wnZNlo1pwCOCpZrylKzaszWsg7tsoq7pMusM2Q+++cvZC9qTh9S8hP4dGnKE7bmmMb3rrTzcmfB00VA3L7QXgxRNxzLfSjuVn9R+a/38xssrcJKNzaa+9zRTxicf0HxpiOaB86iqXcTsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662477; c=relaxed/simple;
	bh=KB/2F1mwHdCdWf6p7atkTVmULwWR0AoSKjh9TvOt4u4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WPB3blDEbxLuYHir8OpPXOQpb5Gzxr6hOVWNdHk7vrKWpoyw9eGrCkFXrkRxVBagvmfEf1S5sydhJ/uwGwnrEK5BGiO+gmuRcEJbRKEg5Y0UR2X0SS660kMfoCQV1fbxS98MdG9S/utXqhRbejUk/SG7HcoJ95IF2pGO0WiLjp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jtE+f6+I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jtE+f6+I"
Received: by smtp.kernel.org (Postfix)
	id 07836C4CEF7; Tue, 23 Sep 2025 21:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64DAC4CEF5;
	Tue, 23 Sep 2025 21:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662476;
	bh=KB/2F1mwHdCdWf6p7atkTVmULwWR0AoSKjh9TvOt4u4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jtE+f6+If3siVcBDDPti3q2NKXKwXFf7jEcEYeA78rVk+gxF+QgqoA83IjYvC1pgX
	 8sNClgsd0W27eUKiqU10GCic0torAbLumq6yxaxO41JjFrlxX4BRqrMZF2vlwNTsyl
	 pcKJKGp6ouukDl1q/LAJO94ltKMOULiaL0uuzeSqJ3HPf/z9CxNpQz1IQLJjiMEuw9
	 KZVJ+5vdrsQVmp6U33PZakhr80kojN5ZCIZxY2n0fImls4w4+n21rVaJWIt5SHupan
	 ftPSRSJ2NXzYbRVXmjV0Hi9uR6ssmf3fCKxM+3zSmKcZCfthK9ktodvxWM1RawV/gc
	 kiUl0O8hKvgAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CF739D0C20;
	Tue, 23 Sep 2025 21:21:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: apm-shadowcat: Move slimpro nodes out of
 "simple-bus" node
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866247377.1926563.16983535669308264670.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:21:13 +0000
References: <20250919161509.1292227-1-robh@kernel.org>
In-Reply-To: <20250919161509.1292227-1-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 19 Sep 2025 11:15:08 -0500 you wrote:
> The slimpro nodes are not MMIO devices, so they don't belong under a
> "simple-bus" node. Move them to the top level.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> I made the same change on storm, but somehow missed shadowcat.
> 
> [...]

Here is the summary with links:
  - arm64: dts: apm-shadowcat: Move slimpro nodes out of "simple-bus" node
    https://git.kernel.org/soc/soc/c/676af08386e4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


