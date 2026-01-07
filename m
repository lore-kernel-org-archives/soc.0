Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFDF36BCE9
	for <soc@lists.linux.dev>; Wed,  7 Jan 2026 17:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767808251; cv=none; b=Mu41xXu45JJbgYRI7cHBUgXg0/mQhd3cMX2k0KmSZuxqQygLWhSph4ClDuybVQ5KgBhVXwkyQKL7i4AU6kkemg/stvWmFHH/X/S0RIJTDmdQKKaZSUFXZ46mjvFKYDCC23i8/ox7Ibet9S+DdOycrOle6yVKoLV+LUK2IMAKT10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767808251; c=relaxed/simple;
	bh=ZPt3BpbA9qqMAOA1zXOVstfiMbwFltzH305c7K5Jyu0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HEa3myblhKFWdXHMkOxP5mB9AfJU5vLokhh8FI5/DJ5e/hv4d1j6IUFGC+UpAWliv7Ktho/tONcToh/3NXfjGB/eyp2fDA2WS19+rA7rTTI0FQ36sSDIKhGqaJAyhekMeSI813WgBBAulI9JDWjIZIAl/iz5AnZ2ZbRYWFcERwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiLkF214; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiLkF214"
Received: by smtp.kernel.org (Postfix)
	id 35EE3C4CEF1; Wed,  7 Jan 2026 17:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD72C19422;
	Wed,  7 Jan 2026 17:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767808250;
	bh=ZPt3BpbA9qqMAOA1zXOVstfiMbwFltzH305c7K5Jyu0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XiLkF214T/jQtid2V6BpHtogfyopaAQGimXj/ecBkVa11QqRBMDj65HTdX+3zRFef
	 XRU9nprkZvsfkqn/bncBKmSJR7UtegnJKxVuEjMq98a7qqTaDZzuyRxYpkzculV6Tm
	 xWTuT+jj27XGCCItzlWq+TIfa4XE2Jw6ZF22erPYI1hlqoiOo+IPOs9I9cLIX4SXg9
	 583bOx1J9ZO2+KM3bHW92z9Ajm9hxNwDq/RQeX7E04Dyl9aPhiPSNrkUOHGfowG0+O
	 jcoX+KFChdFgZLgMMFSb77LmN4xxsEQBlRglQbAWljIlXd3EtauZ2M5C9NORkOMbbm
	 SAvPT78KLIlDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F297A3A40FD1;
	Wed,  7 Jan 2026 17:47:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176780804678.2867211.8786509191069478415.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 17:47:26 +0000
References: <cover.1767628163.git.geert+renesas@glider.be>
In-Reply-To: <cover.1767628163.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  5 Jan 2026 16:57:37 +0100 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.20.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.20
    (no matching commit)
  - [GIT,PULL,2/3] Renesas driver updates for v6.20
    (no matching commit)
  - [GIT,PULL,3/3] Renesas DTS updates for v6.20
    https://git.kernel.org/soc/soc/c/aa5f91ce4fd8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


