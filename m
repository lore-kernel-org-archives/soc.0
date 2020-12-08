Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6308BC4167B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 17:10:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1B50A23B2F; Tue,  8 Dec 2020 17:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607447433;
	bh=CjZaXOqOov8nllwS5why2oLF81AszUyJtxGT7BWLKdo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=g4dNekOw0bFdK41syO5LJktHGCsSMHctqQo57ipGKT4WSh9s+LJ1by7IQ7nAQ+kTz
	 CLC7rCV2shC9PDLEFqNjypu+e3aO2hiItsLWeZYWNvAOB+RRScRfSj0aFdAIKsI3/l
	 naxvl4bqFh7epJm0lwVYCy6Uk60nF9tf+eZHkoe1XpK6Q0jdvZ4JzIvyxCvb/Hl7Ht
	 mPFBGmOnkDxUw089E7/RnnK9Ab+mfyfSDGGyfjUdoA/0Gk85A0FybqFEAy1FS771FL
	 P4rQnST+qw7n+iF5oth9Boqd/FvTZ9jjlVsGvGuw3+L1TmZZkiQoAbFfEkY7ZERNer
	 c8+wpCjt+DLkg==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160744743299.1206.2193835761292574073.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 17:10:32 +0000
References: <20201127215517.GA1733715@piout.net>
In-Reply-To: <20201127215517.GA1733715@piout.net>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 27 Nov 2020 22:55:17 +0100 you wrote:
> Arnd, Olof,
> 
> Two patches limiting the number of compiled media drivers.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: defconfig for 5.11
    https://git.kernel.org/soc/soc/c/d4ff08d6e222

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


