Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549EEC7618A
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E509C4339E; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07491C4339C;
	Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679068354;
	bh=Bd9KxPo+CCSFEvKuNHTxJUuM1alD2d/ELsSXC5oHmkk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eGz75a8ZaGmTIfhNR9BxuleVQ1gOWQGlYwoSk7rfvo3jV/FxEegCNQ6ZzbHTapIlR
	 L1zgoymgCh3ibJnOrcmc9lovHOow59MlPQoxm0ynkJaChrEtptch+ZFB/RbF1d5lHQ
	 KpatqMUJSJxeeJ1O/Mp3XbQF1mtGKmKOdRaISnJ7fjBOYviXXK2poC6OF+1lXKh5K8
	 cDebpsucSfiEe0/tdnZFhlmSj6UCBboWN5ZbbJoW2QBWEZEC4tC3CGA6eXlAZrP037
	 OlsQCscHO+Kw7KueJffR3vV60fiA2+/jqgIq2WcZ3VEWD5Kg/GsxVBjyhQS9vxkr0W
	 Z4WFx9o8cU4UA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E0FCAC43161;
	Fri, 17 Mar 2023 15:52:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: Convert to platform remove callback returning void
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167906835391.32307.8109258928601284233.git-patchwork-notify@kernel.org>
Date: Fri, 17 Mar 2023 15:52:33 +0000
References: <20230314103225.2787101-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230314103225.2787101-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 14 Mar 2023 11:32:25 +0100 you wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> [...]

Here is the summary with links:
  - ARM: Convert to platform remove callback returning void
    https://git.kernel.org/soc/soc/c/74a5b94b6221

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


