Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0426D2C3245
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 20:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037011; cv=none; b=fcpT4w+qrC/HVSCKr6GN2TJfXePYzcP1oDSbzlldisBqKiZMEXQHIDcbbT8/jIafvu1DpAEbobXSgn5cP1SNy/uw149df1arqwIs/SGO9O/C85cvXFAtEb9xK+eXeXGp74iInrbRY9cqD98/8NQwf0SR+bU22Tw1fJ2KtgIZSEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037011; c=relaxed/simple;
	bh=U+ZbMFjPCameIv6ob2c0KozWFGkmdq5Nrf5nGZiGhuM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=N/8e5qM51OZOac3Q7lTD026gln9ZEA8UFywqsAJe9UqtkXxlLJ8hQ9kv0QwMYeJ2bsRiYSsP7eIfMVQVvkC/k6ceRBXby3JSb3wkicgvVGROf3Uaa2Oxky1ZeyDdtpKRDek6X9qhD3BhPlEyh3cvluDh1w8/1WWlsusmDavtKRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qth7Jz1R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qth7Jz1R"
Received: by smtp.kernel.org (Postfix)
	id E9DEB1F00898; Tue,  9 Jun 2026 20:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C431F00893;
	Tue,  9 Jun 2026 20:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781037010;
	bh=7a+7caNoA85yaN6CuL3l7x+qgJw5MoropYNA3Omf4J0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Qth7Jz1RxRgjw1kCMXZ1Y6l2JYgQsIgTJQ25kmb42KHeHHm17/MDrLKKngWDc41DC
	 jliTVfDqZhN4nih24JE6JQU49LYqlS9JhtDSqc/nhvtdabS8YL0efkcCuL64UK8T0U
	 Q+QBzj4noEBxAhShpWCpdeIRYqP/sE0R1/RS6qoWrxo+j9o9zMVZGp92f36vdnvreJ
	 C8U14HVYTug2sOagVeWPEl/2f0GlDaLL1l0C06Ov+ghQ7t4b1EZi/tYsPVs//JI2sB
	 JwulwQsxEt7UkznnGfgYhhH9Umg8drtoKqG25hGoRxXEJvxnrj6Mev9J+r1qNxgUfi
	 +w9xblHdXNekw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569863930A09;
	Tue,  9 Jun 2026 20:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 device tree updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178103700888.2631762.8142056638417930705.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 20:30:08 +0000
References: <20260609073939.813573-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20260609073939.813573-1-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 Jun 2026 10:39:39 +0300 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-7.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 device tree updates for v7.2
    https://git.kernel.org/soc/soc/c/cb78caa2970a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


