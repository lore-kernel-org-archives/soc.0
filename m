Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E851553BB
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961189; cv=none; b=gbwkftlXSNm9kzByuwYt1aHvt57U3isiBfhWgTQBdh5E+vLl/+4DK3QH3KKAi/0yzpFlT0c16I9JvLi2PES3FOiOiQazbilu2TQ+76cwRt2PvqVrutGhjmUWIqXg76SCg92Y2sXNQjzpsQHy+CzUcpYaqyXr8XipKPPuGB+Sgd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961189; c=relaxed/simple;
	bh=BbtMF7VnI2LmMSnCk+I7Hb+qZIxW61HaLA3ptm3chR8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PRa+Cs5FGAvvQ0fmSkqU1GC6cST/L1MtvR47AuYGJHu9mRTGskwhMA3n3KbzM7BkEZ4JwfYOe3lOCJihWWtooEuBgKQASPYJNIvcbOcGaYjZ7ofm4lidmsrQ5aAT/2kpzXnN+BlerSbylV2fQp7fcBbR3ZCrSX/4nbl9HTU4BwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kx4wpU6f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kx4wpU6f"
Received: by smtp.kernel.org (Postfix)
	id 63F67C4CEE1; Wed, 15 Jan 2025 17:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D96BC4CEDF;
	Wed, 15 Jan 2025 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961189;
	bh=BbtMF7VnI2LmMSnCk+I7Hb+qZIxW61HaLA3ptm3chR8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Kx4wpU6frx/NjgVsbV7CMd1P8Xk1g8OJ5ho4WLxJmvKt5bhesxc6+lA3Zg01OiQJ0
	 z0sChNpJx6/JliZyzVF0rukcL+Jl/uD16PQgLXfWwZi+fl0sW53ysVD+URG06UktTH
	 +m2lO/wTT0u/cZAFjT02x5EXKn6UD6LdyfIVX1p6NXMlb1hpt1xysc5P2Gt+7MHL7L
	 4QDPI9WIFN1gGjSMoaCeoWynBx1jOZ1BwWZxSujgjie3RJqVyyWy4omqCc76bulIXB
	 U5fn3sI9X9U3+ZFV3vdWVyoWiz7AoYpEsFoQvO3KR9tDiZQRsLF25ZC/aKfy+1nGiq
	 RVPVV6KqnNXoA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CD3380AA5F;
	Wed, 15 Jan 2025 17:13:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V config for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173696121198.809051.17534794136692136019.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:13:31 +0000
References: <20250113-colt-retired-6f95df3dc197@spud>
In-Reply-To: <20250113-colt-retired-6f95df3dc197@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 13 Jan 2025 19:39:25 +0000 you wrote:
> Hey Arnd,
> 
> Another small one here, just a single patch.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V config for v6.14
    https://git.kernel.org/soc/soc/c/fa8592f24944

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


