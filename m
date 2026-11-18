Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017632;
	b=4oDxNHsuq7Hz5uMoWWMqz54jY4NF4BxoLB8O1Xc5gXxur7qXHJPcjnWIgFyfxChfGTOL
	 w0spwPP7Ttd393wKQcu2ZxJODOHS1FfCz/sYeD9BE2jxzaAQarI3sC8WJUSHsaonjs4NZ
	 c339Cu/+cc28WF4YEgYPaYZvh9hgugykBdanZ8LLTsPArZLQvQF7vuS9PRrBTtsYLnBG3
	 FZs1mjKx7Ocun+Sz/rSfDO+xvdtbo8RHjc5tm5GFLFzSnBhiv4lr7JUVA9P4UPISs0geK
	 jGOszmYS0BiQQ4lpjf4wmjGHUwCvYKDt3/yKOkmeFKF+LQkterkqBnkjjfTNfnLoNhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017632;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=hU7s9cLf/Fd/AU61PaYRG5AgiA0odkjUEb19RsJmHAk=;
	b=uiB/1M/qPEgcAmGehlROru5ofpGNJ72aM7wCutpNdtjfzxq2rt7RQW8QVqT6z0L+8nYv
	 0U8cVVITIHRVIujX7AIfWbd57jkDM9O5BDseQOeKOmW6/fHaB8vmbAzxxpa9iQSQbTqtl
	 5MIriwBu5Sb9EWLQP1bKCQgkZXRol2cI7ai9eFSWAUvePrsfaZlek5ELiHjXMCnS7z0HZ
	 h3kMpikJrus6xwbnXkBLkble2hoFrbk/fvluhzhtS5bloDyVwcvMOIocJdFXw+A67WnSP
	 BmVpylq/SjtGTNoklYA/VTuatP9ePxXde26Tu3nmMIJqN9SIhK3DPLnHO741VKsWMZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UaF/PlwR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FE2606A335
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UaF/PlwR
Received: by smtp.kernel.org (Postfix)
	id 5C1701F000C7; Wed, 18 Nov 2026 16:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E661F000C4;
	Wed, 18 Nov 2026 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017632;
	bh=hU7s9cLf/Fd/AU61PaYRG5AgiA0odkjUEb19RsJmHAk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UaF/PlwRVJCD44BcLxiaS3ZdWUeQa8hStSNvo6kE9IRQJvItJT36J02SS4NhpDy75
	 WyArQyW/F6+GOUvpREJANNBQYKYYS+w7G1hvsLCa/rfmXEoVVmxMJ/HKXWtUDsE06k
	 JYFAOluqSewxnTu+XoDbcjYe79oRVxasPf1rYLQKkwuoXwnvqj0KulPB2OWaymzoEX
	 HCRamzYKVivlgDLC0rcSY9cX2Ij/yt7pDofNGvnOTwTCJP+s8pw06DtkvMMsOlnrSe
	 WwVbY3ykXBWiBwRWBSkwi2hEN82pfQJMOmTZjTrMzW0zsKb+DnLXPRLQf1gtB0S/QY
	 Mijdqx3kIArwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2373808210;
	Wed, 18 Nov 2026 16:00:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: fixes: driver fixes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501763077.1802028.9417950872893837638.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:00:30 +0000
References: <20261113073632.34241-2-krzk@kernel.org>
In-Reply-To: <20261113073632.34241-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Nov 2026 08:36:32 +0100 you wrote:
> Hi Arnd and SoC folks,
> 
> A few less and more important fixes.  Sashiko as usually exaggerates and calls
> some of these "Critical" but exploitation likely requires already root
> privileges, e.g. through device unbind.  Cannot rule out chaining
> vulnerabilities these days, thus sending these as fixes.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: fixes: driver fixes for v7.4
    https://git.kernel.org/soc/soc/c/7d86269a128a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


