Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532561A9F91
	for <soc@lists.linux.dev>; Sat,  8 Aug 2026 20:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220507; cv=none; b=PZiLVvIixwvKVa6QvcDKbgiPBm1hKqkhX7zmpMJid5c+WojfyoV+RihNlrhFqiELIdv6gbHy+v50wei99st6xl5jQYR/sj1FZ7gPgUjSv+9Il8NpT3RHa8jyrzyhrp5GbDDvJt7il88+qcb5ZDCMV5dT4tc0RE0dKFCpV/kUgOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220507; c=relaxed/simple;
	bh=KZPPi5Tpf+CyOUq2LfB+Nl66ftPTVaNwd1xRnG1+avE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OXGZTsK/IjNMJd9z0DfGT7v+GFB8pV0ur9X6IKx73ac2O80QbSqID9r7AEXEQYGiIeNztHYTupSboqiLBrozlPmVGRQCGEYVKoKi5j37VU7/+xCjIapTbocDgMcPuy66wbNz76aOzM+KjaNBlI+voFuO15prlHytv7MKvGPCX9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUfCvgO6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUfCvgO6"
Received: by smtp.kernel.org (Postfix)
	id 0D5051F00A3A; Sat,  8 Aug 2026 20:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACA51F000E9;
	Sat,  8 Aug 2026 20:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786220506;
	bh=dud2/SqJN4UOS8JxaJs/KAhZ/m9OA6c7i+cW5EHVeIw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mUfCvgO6zX/RuqS+uq2FoNZJWKk2ofCL6afuWPJ+k1lv+hl9Jw3ePge1o9VmTNWqO
	 JZbY1BzcVqyiKTBZb6KqTfktdmvxoHa1g6hm4k0dMfdHCNtMuoQz7et1gcy8FmIQsw
	 2TQqucCN6I0liGWNyA6LA83lXPXRCubhwe+Yqk4immmciYc0bq8pKFkCe5LkQitSqn
	 XPdkQDrAuX88JgKhIyqgEvPB5pm0FxrxhOlU2i/FXv3UQM066jEoyusL8k53wbaB3A
	 wc0Z1+MDGWK3ILe4Dfk7Er3+fw19Ovc8D6rrQcrbk5esDJVTAvTAtSDS5L+ldNKwFX
	 pZ2mQHOTLdozA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19822380CFFA;
	Sat,  8 Aug 2026 20:21:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] nuvoton: first batch of arm64 devicetree changes for
 7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178622046364.2748994.14959966535150419538.git-patchwork-notify@kernel.org>
Date: Sat, 08 Aug 2026 20:21:03 +0000
References: 
 <6343db5cb38990a58320ba85899f1b5253cad112.camel@codeconstruct.com.au>
In-Reply-To: 
 <6343db5cb38990a58320ba85899f1b5253cad112.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Tue, 04 Aug 2026 14:53:05 +0930 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git nuvoton-arm64-7.3-devicetree-0
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] nuvoton: first batch of arm64 devicetree changes for 7.3
    https://git.kernel.org/soc/soc/c/dcc9253b5fd0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


