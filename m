Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490DA46AF0A
	for <soc@lists.linux.dev>; Wed,  3 Jun 2026 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489810; cv=none; b=X3rkN1N4K2j/9ZS9RohIxWnelgDD9JrcTRqafcg77Z78efITROSfXa4Kh8aNvHEuaTrFMtdJYpq52IRDlHpKlr9Mi9R6oltQvvKzLn9AalqG87OfqmYkCYWR7YlhgCs6IkRthHcSlJBhlEd1qCo3HjiBKdCGS3YS0VW8doLDSjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489810; c=relaxed/simple;
	bh=xBEiIQFLu+7lf9TOlbxesbG0gM+A8LMmSBVL7P1qKr4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ttIbBGfGuFtigzJhFt3oYBW+KalZ38hbLmaTMUdRMFSdoCawjxD0WWv8sIFw4ysfw3jGIIRxOYLMAri55MHYu/8kxB8LMxSELED4dFEUtJ1TFsiuXtcckDaZmM5DsHfULpKhLkPLMm2jpuFO1Q/7D3yjrLqibiil1qvsPYUzXiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ok2TAXnH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ok2TAXnH"
Received: by smtp.kernel.org (Postfix)
	id 014311F0089A; Wed,  3 Jun 2026 12:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7771F00893;
	Wed,  3 Jun 2026 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780489808;
	bh=ddejPrkhggRroJeGGcZ27TTYJkIciZytfkUwzHRha3s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ok2TAXnHquvbcHfmaFBzBzj9ZIu99GDj2xdNvFhifPrvZlttq/fyi1KRG8ylkICsy
	 oBccyNnY9tZKwiU2at8BQX0jPZFz2OFjpyp0qRToKatJTtSBv+LdRmPlQKK4Hv80mi
	 RmC2Z7EZTN9I5taNf1Kef0CGgAReujNoZsvXntcpAuIGkTsC/Uz3oqD8UJJyIN6btY
	 wL4GTmizilD/Dr1dl3RlgA6Yf6PBvFMyuDBm0F9/smm/LbSSOlscK9qagEenGyjSNy
	 yIsNN6VF+SiRiNPmK8v2p7BadCYRl7FeVoPtAEzenz2hlOcg9ZqSE2zrX+doyRthLo
	 Pl3lU783j8Bvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A2539307B6;
	Wed,  3 Jun 2026 12:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: samsung: dts for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178048981013.1389067.2247576962071789032.git-patchwork-notify@kernel.org>
Date: Wed, 03 Jun 2026 12:30:10 +0000
References: <20260531120708.21017-3-krzk@kernel.org>
In-Reply-To: <20260531120708.21017-3-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Walleij <linusw@kernel.org>:

On Sun, 31 May 2026 14:07:08 +0200 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-7.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: samsung: dts for v7.1
    https://git.kernel.org/soc/soc/c/06deee136957
  - [GIT,PULL,2/2] ARM: samsung: mach for v7.2
    https://git.kernel.org/soc/soc/c/f6f84276c6cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


