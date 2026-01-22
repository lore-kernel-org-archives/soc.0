Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D162642E002
	for <soc@lists.linux.dev>; Thu, 22 Jan 2026 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079011; cv=none; b=hhXLhG40GMjsfFeTDz/Mn6/45p9WaqMPe4SbxHMG+C4SJnbFXcB6ZkhkW5af3V8YcSKGWoK6kqYKdW2d+LhC2f3kdDI3bdYrZWRRJs75czv9h+3VWw5Vgo6L48qn//4kzeMMS7vrD8lqnqayZKRSTE48V9fXcY55RSMXPeSh4EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079011; c=relaxed/simple;
	bh=GoioQsZV7ptGb4Id6tz2BvJbm3faxONK6y4wgFFGHqI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DEMXOGMKlg9tkxf+jpx2SORP73O+ZR9aW00MOtfPPXj6GuCY8agp51fV8jU16r9syrgrcNv8iU07m/aKMrQHnKtrpfuf53W1HgXk2dcsR2uNz/5ylzSVw/drL+mjtUqy+EDC2q6/7tJngLPVSOLUhnnfLBeUxvADLIBm5bv4af8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bY45dVU7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bY45dVU7"
Received: by smtp.kernel.org (Postfix)
	id 56D39C2BC87; Thu, 22 Jan 2026 10:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEBAC116C6;
	Thu, 22 Jan 2026 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769079011;
	bh=GoioQsZV7ptGb4Id6tz2BvJbm3faxONK6y4wgFFGHqI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bY45dVU7tItSj03sdetFWwFDFa5SGir/ezyC8/9d7IpV3JljjLa2JJ2Z6byrxGJDp
	 tNNydBZ5r2/98th+3Ih4OTU3CJ9vdeM8epOYRh2P/7P3V2YnqbdPuMXFu8MQyrtNNB
	 UfUF/FeWx6BTh5CGt2rnnVfn8BD36HY+3aPAb7e/FXUt9QlBvbcg2Iwf8X3Ylzsr0j
	 NudCGbzEd2zwDGip6ph1M5pwZqhetxKkAVap6WBZEIczib8Hb36uItpS/pKLRt8gPE
	 j3O7h/pnHdfC8ZS7Cw5alKZGAfiqAUJNG4iC4UddjWymlppr094NSYWNwZ47N7wxwp
	 gKDdcOVdpExeA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 119983808200;
	Thu, 22 Jan 2026 10:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DT changes for v6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176907900759.1663980.7454700402564281414.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 10:50:07 +0000
References: <20260118193032.64139-1-sven@kernel.org>
In-Reply-To: <20260118193032.64139-1-sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzk@kernel.org>:

On Sun, 18 Jan 2026 20:30:30 +0100 you wrote:
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git apple-soc-dt-6.20
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DT changes for v6.20
    https://git.kernel.org/soc/soc/c/c0398be9890d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


