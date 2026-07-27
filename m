Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBEB14884C
	for <soc@lists.linux.dev>; Mon, 27 Jul 2026 08:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785142243; cv=none; b=Pz7WfqtuWyBmw93IH374aNfLY4SNstv9uI6fVMPYdX8N0sdfOL8K0BXQ0piPz3IPRSq5k540eNqu4K3h6nRn8uBmmASuR3hOtiIzrfxKi3fCEIsyqRDsxykKsGKzc5b1lF5psXiInXegpzMykfx2XhKdor53kPRYnFksoPWhIOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785142243; c=relaxed/simple;
	bh=tMu+Hat9VXIYHUelr8fRZKk3DDVqRDcyGV4x2ipzik4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=joMahDBANdgkZw9OmZ4JDLDMxXZXtz6a1KW2BTbJMNfFmIhmmcsx2DtTt/5KC6KDy2NYW8RAXv77grH/1unMd3c00e0Qpslh8285uXLEq1IDUAl8g7VZAv7rkq7U4zNCgvLbnULROofOyicCDMDhF/idObE02g6/3EhvKhw1c6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cK/OfhwV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cK/OfhwV"
Received: by smtp.kernel.org (Postfix)
	id 9A7C31F00A3A; Mon, 27 Jul 2026 08:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8409B1F000E9;
	Mon, 27 Jul 2026 08:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785142242;
	bh=wC4iH6ep/jwuq7vGyuwouGzr5NW1qMXj83ve3gN/CnU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cK/OfhwVBl7AJjIsnls/9YM2Ywhsj1wR3jkp3M+ka8WvwAUGt5mq95UEKrTwPc9kD
	 wu+Yttb+mmspioX2PzwNHyaUc2PhLVlGYKfheEdeYXDUIGgQM//BoXPwHK51jjwRXJ
	 OHgoqSFBZ8c+kuTmRW7GqvlVC29ipLx8LL3QjTzi2OYWTXxWlIt5nwJR8DgKsN6Zo5
	 R/PnF2uJdXzcbb++9/SR6S+ecspAEgRMjusI1eWF+VHYTKpc/XdOPG5QW+yK+CElDE
	 626kIET9HGmFWCwq8OhRiyGaDZjcvKNIOUE9hIhHqHV0yAzTrGwal/TCaN1QCx5+DQ
	 jdUc6RzIIfE3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5695B3809A0C;
	Mon, 27 Jul 2026 08:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] NXP LPC32xx ARM changes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178514220789.691241.14058964324168363738.git-patchwork-notify@kernel.org>
Date: Mon, 27 Jul 2026 08:50:07 +0000
References: <20260724212426.414433-1-vz@mleia.com>
In-Reply-To: <20260724212426.414433-1-vz@mleia.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 25 Jul 2026 00:24:26 +0300 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/vzapolskiy/linux-lpc32xx tags/lpc32xx-arm-for-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] NXP LPC32xx ARM changes for v7.3
    https://git.kernel.org/soc/soc/c/77d0531ac490

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


