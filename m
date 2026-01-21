Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E54528D8D1
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011228; cv=none; b=jrzgyupQXjfnmwqhurmdMXmY+LiW7K16HLYjDW/7xwQzoOrQ+bydxs5EJq0xcT8zDJ4mwtuMxDKXpyW/lzRKr9ci0QHwFjQXTOkkPxuaQRGbxAFJNEJIni0U2r0HtksKDqbdvzC4oJDSC1J3pDeiLxSoCbn0P+KNipDtYd6PDAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011228; c=relaxed/simple;
	bh=BX87ssdOwZmtHqoSNf14IQmO5aB96h2Th+Q2sLdXx8s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mBA4bomrAceiX7xMeMl/NR45NswPnTEVewOUoohR+OuytPU+oZXcWHYBz1CFsAX+p5CZkdK8HZIwLCvQr5mZoatB1s9DVx2SLBa7dDOjlGrgPlJDLu1vZGqhb2kZ461vOTQoiYK3rn1eP0KQMZDk0Gep716xYpSLeg0d9hoFOu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Enm30Rk9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Enm30Rk9"
Received: by smtp.kernel.org (Postfix)
	id 572F0C116D0; Wed, 21 Jan 2026 16:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E9DC4CEF1;
	Wed, 21 Jan 2026 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011228;
	bh=BX87ssdOwZmtHqoSNf14IQmO5aB96h2Th+Q2sLdXx8s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Enm30Rk9uATo8kxKmszCzedAFLd6rGEuGMjcXgfhUoBa210aORm0Ybmb++u2QE53j
	 4Mm6yD26tAR7oW/HR3ljm8rLsmG6d1t2FssjFizChoKlQC4lSqWQCz8/JDePwAbFXS
	 F4KdvAcNslg+HNMNAd0X9MdFt7YotNalm5fHfo+2nxDlB0mrVMURn8fEaE0MuPTfuh
	 klVKqAz36I42P7xhJuHVJQeNIUXoEcC9CNsMRyW+5QoORcEYQkRfhPLRk1cT58P0Dy
	 XTW61kcV5+OjT9vYY+QUvtFSUC5QcBQPqfNd7dVtTg4FWRU/N1s39ixaiyZokeUOOb
	 Dm3IIGEWAIKxg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8B91B3808200;
	Wed, 21 Jan 2026 16:00:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901122509.951664.9650425535081155772.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:25 +0000
References: <cover.1767628163.git.geert+renesas@glider.be>
In-Reply-To: <cover.1767628163.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  5 Jan 2026 16:57:37 +0100 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.20.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.20
    (no matching commit)
  - [GIT,PULL,2/3] Renesas driver updates for v6.20
    https://git.kernel.org/soc/soc/c/4e2c045f1043
  - [GIT,PULL,3/3] Renesas DTS updates for v6.20
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


