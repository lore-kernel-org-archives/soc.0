Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B3ECCA483
	for <soc@archiver.kernel.org>; Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA610C341CE; Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CF96C341D4;
	Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658239815;
	bh=GDlQSrhJqyocQ+FC5TU6egnv+z286JEMzoJZ4eDtmgw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Cz3w/QRmtg1xrFtWMsK1UNogxgEmWk33jVF/O8IECCLGUnxJJ4zrI0hRj9HXjifw8
	 csGZsqXcIPVhdbaKe86ccSsmlnc/F6nvcmQzWCa0PGiwF+x8/O1zT2QuTrH07Ax0NY
	 ZRKSJzlsxDN64ZO2iLUieHB8QagAx41ViwqKdGWg9+vDm0N+jiTWRlcBDU+QOlFU64
	 YpenTYXhZgi1FVAw/TUMp3bbJ//Im1thzZpZdYzKqdF8IyVb8Co50Ir1GX1LuUbgyM
	 QnGpwGVL5/NT3tZ3MH7AESu3u+l1oXR0kCzm2oIq7eYodXngJD9WwxvZ5iEhyPDnHT
	 Hn7DLqDkfctSQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 79FEBE451BC;
	Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/1] soc: fujitsu: Add A64FX diagnostic interrupt driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165823981549.7750.3171524918425351359.git-patchwork-notify@kernel.org>
Date: Tue, 19 Jul 2022 14:10:15 +0000
References: <20220520074119.3574753-1-hasegawa-hitomi@fujitsu.com>
In-Reply-To: <20220520074119.3574753-1-hasegawa-hitomi@fujitsu.com>
To: hasegawa-hitomi@fujitsu.com <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 20 May 2022 16:41:18 +0900 you wrote:
> The interrupt is set using pseudo-NMI if it is available. Arm has a
> diagnostic interrupt feature called "Arm Generic Diagnostic Dump and
> Reset device", but the A64FX does not support this feature and instead
> has its own device definition.
> 
> I tested on FX700:
> $ echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
> [   86.259226] lkdtm: Performing direct entry HARDLOCKUP
> :
> :
> 
> [...]

Here is the summary with links:
  - [v5,1/1] soc: fujitsu: Add A64FX diagnostic interrupt driver
    https://git.kernel.org/soc/soc/c/64f89dfaa4f1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


