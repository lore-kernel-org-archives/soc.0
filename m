Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B944C41513
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B072C4AF0B; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14E63C4AF0F;
	Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500464;
	bh=WVy9hIWxRW+oz88lSi9v6c0NDmqH6+kGG/HPxXCBuwc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=b6+heHt4gI49lMMxmaYTuOW8igGI9LlKJnKwZ4KN/mDK++zj4Jd2X8gvfOkvIHI9Z
	 EizlMuPW8FeinCNs5wQJlnF++vNxpDdqD1hPrr4V8Nu2ByOUmVrsnmiFfT3uN8LRtX
	 Gkrz0547N40r9bpVNvOqVc8bicUqUrRbyx7J7f5rltB9HE8gmdw71cBofD2MDHRDn3
	 FcsdTuS3c1jyQSO0aYk383vhDxjrSz2Sj4hYNhYO4RBh4AN8EYEPI2mTC3BmV6Y92H
	 tLyoarpL/z7eFxOzuTqJDVGGLS5dLBMTe3Y3qO3QNZtMqNgO6l2whNm9AmHNg0SsC1
	 OM9ysmEpSqchg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 02D14C4167D;
	Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for 6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171950046400.29698.2628382246143424211.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 15:01:04 +0000
References: <CAHTX3dLbNAYL4hm+bs=GByA4DqjRr3Rt6WESram8VyU1By8Mow@mail.gmail.com>
In-Reply-To: <CAHTX3dLbNAYL4hm+bs=GByA4DqjRr3Rt6WESram8VyU1By8Mow@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 25 Jun 2024 15:21:13 +0200 you wrote:
> Hi,
> 
> please pull these changes to your tree. I described it in two chunks
> where the first is describing new
> features and the second is only targeting issues reported by
> dt-schema. Most of that changes target
> Kria (kv260) platform.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ZynqMP DT changes for 6.11
    https://git.kernel.org/soc/soc/c/02295aa2a461

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


