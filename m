Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AF24248DC
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874847; cv=none; b=lrkjEmpAwS05i7tbMR8WQQ04jIdBL9QW68UdWVlhr+2e+NS57PN6BOPzxP7CcJsMUVlbJKCgI0UzyULNC6mpg3//zxn3JoaZE2fT3ghZq9hd5pbW/NXCUgwqndvLnAVqKV/UeRAoUTTd7MMLMWJp+AtjH/NBpolmgZg5U3/GjHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874847; c=relaxed/simple;
	bh=gAV5WiukeMtzlc2eVx9BkUjAwpJ5hGH0wkPeZ/QbLjg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kxLXBGdnAlpM8fe/eEgm2TbyA01qOELW4jM/GopL1g3+WDC0onencFnRR+Wgtdd4zJkrE3sFT1RACqWyKZBqjZUwk81O6v++GXDb+35pH4Nl8qu/ISib6Pn5AVR9RnrQQTxK28+4wiALT6il/8cioeA6fxmxEk339UxX1zJ9PfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLKEwT5a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLKEwT5a"
Received: by smtp.kernel.org (Postfix)
	id 437501F00A3A; Tue,  4 Aug 2026 20:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D90D1F000E9;
	Tue,  4 Aug 2026 20:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874846;
	bh=f9nzGcpiZQfSZdwUlFtyKZP/+AAikWsr/JsNcnaF058=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aLKEwT5a8HwfG6Ns534ZQWFMJafa02FzELs8YkTMZ1bj4VVKoZ4afsjO/RS+RPgpB
	 /6vJZnlPzOVBT/iZUnXn8sAE8n0ogdR5d+wmwsqnqK6sOV/deOyNe4H7UD6f9yxYrf
	 EfDgMKdsZNuDW23bINnbsCACzs8JnS/2JDMunHGB9LR30Z/Cr1m8Cdbu+zBhA3SpHP
	 u/Ff33YcIuF37ezL8wTmHXKRzAlVMUA2bwjbjtkegrlmmYtCImsADxaCW4C2zZzV6P
	 bPU1fh1VpqvTv9xv7fHZ4D2UZV1/bZtMuKsVP1Ql1K0FgZLUL3dHi7fQyuYCfmRkpG
	 bWBE5HjKPMBBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A5339263B9;
	Tue,  4 Aug 2026 20:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: Update MAINTAINERS for 7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587480639.3769923.6567787014649338910.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:06 +0000
References: 
 <cc2b296319ac4b52602c891ab04807bd18a32bd1.camel@codeconstruct.com.au>
In-Reply-To: 
 <cc2b296319ac4b52602c891ab04807bd18a32bd1.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 04 Aug 2026 16:00:54 +0930 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: Update MAINTAINERS for 7.3
    https://git.kernel.org/soc/soc/c/c7a127371ce5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


