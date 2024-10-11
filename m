Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C2319F110
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644366; cv=none; b=cllDktwTsda4tKk7GnJHaTyWYfd+XwaaxQIwIRSrLaAINhsMk430i0RLVqRrQTqbyFw2a2hg2IsOfjAzP+waVEHAOs62x47BHotHNCn0Shiw9mxJMwcBXtDucKGj4sult0yxLWUpzB7DTEAXM66Ear8TXKXYm++5yCplTzX1aN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644366; c=relaxed/simple;
	bh=FAHOxJJkl5cLYUde5zYL+FYn2tsN845T6e4hKWYUljc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GOKoWZpRjzAd7cidiVlLWhuIZvQZ7uj1Crdp12PYKg6o749TqYItQZFF60PyVXUrJAbatuoYr5SxYrYW0eLOyCO64ChyEnCKQcVcMtflio4BBFQ9NZ3oHMAelKo598iSqUP0NP5RH5CH+plnQoXhpsTIrXJ/6Ohu8gvSVppxrx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3agwbAv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3agwbAv"
Received: by smtp.kernel.org (Postfix)
	id BA803C4CECD; Fri, 11 Oct 2024 10:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C1DC4CEC3;
	Fri, 11 Oct 2024 10:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644366;
	bh=FAHOxJJkl5cLYUde5zYL+FYn2tsN845T6e4hKWYUljc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S3agwbAv/JRNDDNylJiUjCyU4vHxyqkafbaKFtif+A+X53p5YEX7KKqfwymGKzb+V
	 RoTs1HACxKBVSqiTsyYCIx/MeLcz1mhMjkazLsyL8fDEpsLZq2Ao574rGA1/hC6bQY
	 87p8uzbjjdCImfnt2eCvmDaQQYfaHYCdNS488+1Ph2grURA48kgJUn7+Hi5P7toYWd
	 snp9W1/KzmK5L/SYGHY5izF1AoaRJwh4aoI+ymqbP2swqIUy23gVX9D/wzF19OiCvM
	 wE8H7735mjUQkYGoFTM7n0WjVYvbKantbXF6HSTVp6mZ4Hr3zUbRjahFS56nySu4gI
	 9jhclsMEfkqVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 713CC3822E4C;
	Fri, 11 Oct 2024 10:59:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] MAINTAINERS: ensure that mailing lists are L: not M:
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864437098.2676212.16592016262540334211.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:30 +0000
References: <20240920-maintainers-m-to-l-tweak-v1-0-ea80b5cd3420@linuxfoundation.org>
In-Reply-To: <20240920-maintainers-m-to-l-tweak-v1-0-ea80b5cd3420@linuxfoundation.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 20 Sep 2024 07:03:25 -0400 you wrote:
> Linus,
> 
> I noticed several subsystems where M: entries were pointing at mailing
> lists instead of real people. These two small patches properly mark
> mailing list destinations with L:, which avoids potential problems with
> automation.
> 
> [...]

Here is the summary with links:
  - [1/2] MAINTAINERS: fix PKTCDVD DRIVER to use L: for the list address
    (no matching commit)
  - [2/2] MAINTAINERS: use the canonical soc mailing list address and mark it as L:
    https://git.kernel.org/soc/soc/c/32af1c8af40c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


