Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68883E4115
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 03:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033831; cv=none; b=eGF23EHRweUloF+xEMkxBoBK74d9POcZWanHXGxMq7IwJa2uqD8aRksVZCkTzhPf4uuCcXlrDmTTdtTDguDENN6mHgBEDUEQeoPgOI3zZiT6czaNS6/kBM1iD85W0zlzn++1squLiPs6H7r08wZhwZCpqh3IBRIDOSGIB88JJZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033831; c=relaxed/simple;
	bh=+QGFY3r+U7XchS/uSnVNvOnSlLUkuOwoViyHma3qhyA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=guctb04ZI4FdVkv5StJQrl4psDNm78LkDqKSPr+a4JtVF2dvpnRVpuYUk01/PkAIyGvPJVDSOpygsHkl+kX2MUd8XSYzwvUYoH1AnI53NyxEVLjP9DTEdvXUXC3SNBGxcllYmKBdtYgkaTygWxc4QPooMv/RalqbnAF862ob16s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amf0S1DV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amf0S1DV"
Received: by smtp.kernel.org (Postfix)
	id 9786E1F000C9; Thu, 15 Oct 2026 03:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C921F000C4;
	Thu, 15 Oct 2026 03:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792033828;
	bh=Jhm5VoWXak3P4XPXkKj+Tsr6luPHokoFlCqeG5Ids10=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=amf0S1DVCcyhjw2lkHSHv/hv1+qe43Eys6TSSZSHkXic0e22mAJ121u30ooZCLNw/
	 sdK6q+zy0mrEHJmj6u1kuqzkHjCfOlpVJjJOMUoDgbrmcv7+D6Q1JSkUg8BR2M1PmH
	 4nO8x9g+HZ46kbW4LIsr04HjlzhP4rIjwnv27+b8O/BMvgH4+KAn9btlvMrtlaASvi
	 YqaQ8R2HJRhewlWK7+k5NKyLaoqZMIp1Pd6cWaVi8Nbs0zldgRr3vaS1XCBhf4Jrqd
	 ZI5NhxS+4L3PpiD4dUnklNIre3reNyVLp1B/me09CHGnQ9JRKgx7abPxn1A+RXKuCg
	 ZPii/1fuwgFaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77459392E992;
	Thu, 15 Oct 2026 03:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX ARM dt changes for 7.4:
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179203382701.3155468.3020831696321937987.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 03:10:27 +0000
References: <20261002140826.3947315-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261002140826.3947315-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri,  2 Oct 2026 10:08:25 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX ARM dt changes for 7.4:
    https://git.kernel.org/soc/soc/c/03ed1cd90ce9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


