Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BDA30F815
	for <soc@lists.linux.dev>; Tue,  2 Jun 2026 11:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400418; cv=none; b=IKmx7wEsA1FmU+Om0cYMggVTkDPkll2th8zLJMkFLgAeE1genomReM7Ma2sfJ9BFavdZ19zKLI65hWmU1HHVHj9/IvluNdtMAhdWFtQICmavGJwJ3xJ8BHnek/8M3Ijwu3KOJpKUPNeMXseLSHJyI4wSYcJ2/7cgW9RPFAG2/DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400418; c=relaxed/simple;
	bh=42XmU/cndt9O9LscRXC7LvoGZAHlGpN4rBuNOfC34w8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FMgKkgysTOBMvpmBYuOMdxEZeyqMcNqYWeptwWVSqX1wRyrqvbtAlW7BVdsY8n1Ung05T9dt80oS2fIdOZurEKiG+gNS0ODIUpvoFgC1m4hVlljMI2fR9GyiSDOug3rz6EFTh/ve/uqlOSTBCrOouoNXdTBNyrKG9/clMlL87OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ar4wwdMe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ar4wwdMe"
Received: by smtp.kernel.org (Postfix)
	id A901D1F0089A; Tue,  2 Jun 2026 11:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936961F00899;
	Tue,  2 Jun 2026 11:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780400406;
	bh=fBG0Y0cOXMiSc0FC5/d3S0c2RkOI0uAAJYDQihmrcyo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ar4wwdMeclAVB5UsnOTTxroDiGTyKi/NlUVN0lSbynGbRWxCg1DYJcEZjBFRiGqvd
	 fXcBwb7KKgtwu8BzG1JXE3BxjVg3yU5a1/Xf+Q3v9cA8nvLJjZo/dGbBGW5fKds1Lp
	 YT2i8qoLed/iSiA5JrkVVlrryEORVxcyNnTPWUMJfCuUrQCpAUpu7qpwmxuAELTxHl
	 oeWu5EcHfhQFp8K560KUsf/uGC9jnUgq1nr11eAKUmvWcwtpC0oOtawRAp7XbKTU27
	 2uuRaj5McpIckN95UwvmEgfcKEqASYesOshcBw3lknLcjNcuwz6nVhvwGlnsrnsIiG
	 OTi6B6oyYuH0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09683811A53;
	Tue,  2 Jun 2026 11:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 7.2 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178040040865.402603.12144289920463377636.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jun 2026 11:40:08 +0000
References: <14415443.zAa99ISigo@phil>
In-Reply-To: <14415443.zAa99ISigo@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Walleij <linusw@kernel.org>:

On Tue, 26 May 2026 23:17:09 +0200 you wrote:
> Hi soc maintainers,
> 
> please find below Rockchip ARM32 DT changes for the merge-window for 7.2 .
> 
> 
> Please pull.
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 7.2 #1
    https://git.kernel.org/soc/soc/c/783257245d71

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


