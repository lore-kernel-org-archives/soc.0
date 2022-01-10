Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6F6C433EF
	for <soc@archiver.kernel.org>; Mon, 10 Jan 2022 18:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 000D7C36AF2; Mon, 10 Jan 2022 18:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCD56C36AE9;
	Mon, 10 Jan 2022 18:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641840009;
	bh=MvaKXQ03VNYTS+pAwVKN2x/HVocxZlZi1qBmoCaU16Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UZgKF1Ki7TJF7pNl3uXJ8RXQxiXZ8ou6X+tlSsEQuu/lEvzHSwMMpACGgPf1UggKr
	 +EqvGu5z7HMmPafzuJkEzoF8RZ+/OQC3hFulgbA2X2wmiBa/MIuC0sS+yFC2VtwN3h
	 3h8ayETxVARKlxJSfI88sINKUmEbSyF+DDC1u3r/WPaHQiFlawt5n1jjJexa+6JIIO
	 SvoaztmWuHp8lLqRRqdaRgvu1lz+/oc6/8Ks+wr1dTTRtd7SCL2rlyQSfcZ4sK7QZs
	 isrfvRJFNNtvKWbCmaTo/stl1MiO9JnBYZ5Zd/9Tgf4/Ofs3Ie8TeL0x5GMOVlgFgx
	 QbpoFh8CQOJ3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C4CC2F6078F;
	Mon, 10 Jan 2022 18:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic fixes for v5.17-rc v2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164184000980.18694.7527721130976055610.git-patchwork-notify@kernel.org>
Date: Mon, 10 Jan 2022 18:40:09 +0000
References: <746a7f25-1c96-9d27-3a08-e86b2af608ef@baylibre.com>
In-Reply-To: <746a7f25-1c96-9d27-3a08-e86b2af608ef@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Olof Johansson <olof@lixom.net>:

On Mon, 10 Jan 2022 10:38:49 +0100 you wrote:
> Hi,
> 
> Here's a couple of DT fixes for v5.17-rc1, they fix the UART compatibles of
> the ARMv7 Amlogic SoCs and by the way keep earlycon working after [1] has been
> applied by greg in the tty branch for 5.17.
> 
> Now based on my previous arm DT tag touching these files, sorry for v1.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic fixes for v5.17-rc v2
    https://git.kernel.org/soc/soc/c/035434f0dd0d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


