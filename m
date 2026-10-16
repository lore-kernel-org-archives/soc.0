Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FE55372E7
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170619; cv=none; b=IU8VErJL3l6pf1/QxdAgfWK8FD0fqt0f2TLYM3ow4Is3BCzBcGNgv18ZT7N3ydqzLWs04E50YET/Ybt76akNWsYWqahHUvRP+PbRbj+xdg4emit6NlVKaYmGk30VGqeWVZoIaWuGogYZ/7KU9U3aMbKDlTCWnwjGoxUs9Gu/uTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170619; c=relaxed/simple;
	bh=7YH8JHoqKHjqIMtUIJLb2DFq0ZEXZT8t/tym8xmQ1Us=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tqiaRulq5EWeSxUE+/C3yKclIwZXCsHvgpWNX/QWQp33LpwVCVZfimn6OacL5whsFGwcqJVCduF5KoiJaAchOV9Ex69K4IyWUKAsevITcARtH7YmqGvHdZijFO1CaRIXA/0Qt0ZRfNl9W8G/lapMubscvangol4faQB4h2P9eX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEWuEFkT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEWuEFkT"
Received: by smtp.kernel.org (Postfix)
	id 1CBD41F000C6; Fri, 16 Oct 2026 17:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070511F000C4;
	Fri, 16 Oct 2026 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792170618;
	bh=GLIufOzY6CH1O9fXczx8iYduG6KsPCUo4Rp9YYtxVBI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VEWuEFkT9rhahZfupov7Bn0z1Pkrn6lKHfHpV6vlKRcJM8iM7XWEWvJAkIY8RtstD
	 tgjwEPuJ6jMebg/wuEq0S3w2zYajciqutkKqt4onpMf2kfS3cziTaNS2pUpfTa2kqy
	 q4CVMpIAYz5H6S9tQQ4ay1z2oiryr6XhCP4S3hR+tkqewji/jOBM5m1YITu4DshlAL
	 1bsYcsIb/UGmcYO/t1LbNbGM4GWQpdxY6QgRCfiKNhl6Q+tV5Ba+Ks5VmrnHIn/SMi
	 TjEBwmNUY3OrrzV2vnCNDtt87o7BXdqyWWmV2ZNAT30aEQiGIZAbGD6fr4T+djob91
	 W78SntMKxkb0A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1618380AA52;
	Fri, 16 Oct 2026 17:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179217061651.880342.5847110853622464355.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 17:10:16 +0000
References: 
 <CAHTX3dJ4Hi0sHT9acVE+4r1pBU91Ryew9f-2D2vfDYcF98P7kg@mail.gmail.com>
In-Reply-To: 
 <CAHTX3dJ4Hi0sHT9acVE+4r1pBU91Ryew9f-2D2vfDYcF98P7kg@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Oct 2026 12:57:25 +0200 you wrote:
> Hi,
> 
> please pull these 2 SOC patches to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: AMD/Xilinx SOC changes for v7.4
    https://git.kernel.org/soc/soc/c/4d1e50a7ef21

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


