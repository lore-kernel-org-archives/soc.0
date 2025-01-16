Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C8322BAB7
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043317; cv=none; b=b+pRyrjRUkICjPrMC1n4Qap/awc1U97fSW+Y3wI76C4+pHCenKT0byYCukXO17Lc80CkCTFLB77X8wmp+79pWugMX5ersCSi0sDy/8FK+LLuFdMMzMICyTMV1gcaxteEeGvJCQ/lixao2rRrtM9pe1TPMAv2uA6js5PsNy3By9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043317; c=relaxed/simple;
	bh=i2q+IFZjmpTLZT7CPF1BpR7hDQ1HJyNY5YtL8fYXJQk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nMs1YJPnBfh1NM6ObHMkoFWg+Wy3uqfvBe7najcKlFmzxMI/iAW3U3lyvdjvC6wuaoEpgUrgc2uhsxnB5Qy3q+cXvnQ7qbkkIRsl7t8qX4fZB/3AR8HyGYwEKsEHIKw29rIEgnucuPe5jnWIx3UW3FjdpWJg9Jgdw8YPCaw0J4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r4Awbyrp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4Awbyrp"
Received: by smtp.kernel.org (Postfix)
	id 2E1E3C4CEE2; Thu, 16 Jan 2025 16:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182C9C4CED6;
	Thu, 16 Jan 2025 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043317;
	bh=i2q+IFZjmpTLZT7CPF1BpR7hDQ1HJyNY5YtL8fYXJQk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r4AwbyrpAzwooQWCBt8PEEy+OigkSXM8dz99Kc9/wGPD2SkPNAK0pPYgkRr7cn3mr
	 3NKQWWdEoj6tUh0z/o8V4zkwe2JAGTfNRlFiTiwg1OioxJZg2P6pJExR9SfEgtbamZ
	 YprXXVcQkGL2M5oaIcJTTcBd8dz2suaE8yyppI/j5KiPfLpIQ3a5SYoTZZ6Ge6+X29
	 ocMbFpbqiWoGLezkHJA+AgWcP8WnXbJJXjKZF5p4TdcHdZAl18hIoo4ORbSzVM/gFO
	 x2/1FqlugOhceADR+Bj7DtVOwzz6h2kzhZI0rMliKrwtRCL72rPebNoppgSo4OFmNr
	 3zcCz3VX/+gVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F76380AA63;
	Thu, 16 Jan 2025 16:02:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] StarFive Devicetrees for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173704334005.1501791.14523607147806037662.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:02:20 +0000
References: <20250113-kennel-outplayed-21a52a654c36@spud>
In-Reply-To: <20250113-kennel-outplayed-21a52a654c36@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 13 Jan 2025 19:35:02 +0000 you wrote:
> Arnd,
> 
> Very little here, but apologies for it being kinda late. Ended up
> dislocating my jaw between Christmas and New Years, so been kinda
> out of it.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] StarFive Devicetrees for v6.14
    https://git.kernel.org/soc/soc/c/a48867bc2f59

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


