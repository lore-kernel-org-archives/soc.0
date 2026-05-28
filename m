Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B4530F92E
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006210; cv=none; b=o476P9y7Qd4mnBY+JSqFbfgZQ29q0RYKOra6wJG/ffSMRRdGVFoFmVgYoy2YTdY92Cci6Exi3jzx/Io7pSOt9SMJyPmBaBgz6Cs6clBD2GcWwupn8SPtzJXsoESaDNEH0wWUMVMbP5S3Pa9/2AHNhuJiEsTijyTf+dH8lw48yXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006210; c=relaxed/simple;
	bh=ZmLoj9nTP3HqDitvfspnvdemlOCprIYbYxGUn7o9X9k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rAeUKNC1tFe5dL7/Wi5+EnJsALy0OI0ngEmsg7J+N6WRB1EonTAQmYOBAr4+K9NNANETkXIykCdEhnmu7TgsBwLpX73Cap/sd5Lrq36vqJk4ySRJg9/mhOPAW51qii5LR4pXCP0ZsNb/rK93D/vQ/shBV2J5r07zii6qOWWz1xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cI9GHK9U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cI9GHK9U"
Received: by smtp.kernel.org (Postfix)
	id BA5B11F00A3C; Thu, 28 May 2026 22:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47271F00A3A;
	Thu, 28 May 2026 22:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006209;
	bh=gnZ/4yNLoOyck+SpfrtH1TY67vHtChOKhta5AG1TFmg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cI9GHK9Ut57DGxSAq54M7o93OY3um9IFxwTLJS2avl5A5CRwUgusGy1HblieKUG6Z
	 t7FrbrmBotAQy8aaMqSD0epxUYqipFykRsLKGFzJv3KCC8da3AgkcCyidC6cpQg31l
	 //T+cAAOhboCQF5FL8V8ZEJRn10HleUyYtZNvDEEAHbT2e4dVW7r8on3G7GW7pZXqh
	 LNVqTNT17Drc9ltF/f/s1+WqwtIWd4XG67A2ZzWKL5orhIHl4Iru6N3lrHq0plIUBQ
	 A3df9Ar/Ni7lYYqGxmFMAbgOwNfaN3rO9t0G1r0K+tcESeSoRC6j9hn4bOFK4YqwMR
	 532llb62nvKVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19F073811977;
	Thu, 28 May 2026 22:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ARM: dts: gemini: Fix partition offsets
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000621363.1533055.2761942300159750868.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:13 +0000
References: 
 <20260528-gemini-fix-sq201-fis-offset-v2-1-f594d3072fe6@kernel.org>
In-Reply-To: 
 <20260528-gemini-fix-sq201-fis-offset-v2-1-f594d3072fe6@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 28 May 2026 10:25:26 +0200 you wrote:
> These FIS partition offsets were never right: the comment clearly
> states the FIS index is at 0xfe0000 and 0x7f * 0x200000 is
> 0xfe0000.
> 
> Tested on the iTian SQ201.
> 
> Fixes: d88b11ef91b1 ("ARM: dts: Fix up SQ201 flash access")
> Fixes: b5a923f8c739 ("ARM: dts: gemini: Switch to redboot partition parsing")
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v2] ARM: dts: gemini: Fix partition offsets
    https://git.kernel.org/soc/soc/c/66ac2df408ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


