Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529B3C48BDF
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 17:00:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2360E61874; Tue, 15 Jun 2021 17:00:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0AEB261626;
	Tue, 15 Jun 2021 17:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623776403;
	bh=chDQhqZaxoGPQvoTLukMYzrRn8hV0ENBsMAkBtdDPLo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=INvBTclfDmtcLr7CRY0qDJhmpz4jaend7nr+Pr5bmIUBPMp/QWn5YD0qgPNXLQKR6
	 LWMcDhixAUTaOUGQpHwK1OPc6XtOK1jUypg+z1II9FK1fZetSW8JNsVcZCGQ6Jv+JE
	 yrfe/eeFlq96ehmaZcIjvMEUMJTjQsm8PlJfcO9RlOukv9r479iuRiUFTpN6YbKw8M
	 G8iY44LhFP8EnYacJ/wu+F09dvDEjrBZsqOJ+5BwbZ0GOy6S3BqWKKP9+TNs8Etlvf
	 bAUEX7doM4kXXt2uR5ww58uS/bpNfIV8/bQzSWtvNYC7hZ1KtGwgTppa+abAJosROP
	 Kp0CGiKhchRcg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F270160C29;
	Tue, 15 Jun 2021 17:00:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: mstar for 5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377640298.16658.10226408245034873772.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jun 2021 17:00:02 +0000
References: <CAFr9PXknSfSso6Uq0Fn_qJM5ZnJ4QK=YjJ32kKt4XYPrHK5x6w@mail.gmail.com>
In-Reply-To: <CAFr9PXknSfSso6Uq0Fn_qJM5ZnJ4QK=YjJ32kKt4XYPrHK5x6w@mail.gmail.com>
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 16 Jun 2021 01:36:25 +0900 you wrote:
> The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:
> 
>  Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)
> 
> are available in the Git repository at:
> 
>  git://github.com/linux-chenxing/linux.git tags/mstar-dt-5.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: mstar for 5.14
    https://git.kernel.org/soc/soc/c/8d8538a497df

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


