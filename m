Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33E2C0015E
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93074C433B9; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71FB4C433C0;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=nW78wbvnxtKe4HvG7kL4gMRbxKoO/f7AE+0gX4Zi5mE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=vGfYuV0PnGhi8Hc2wAN6PGD+r8POSmb2oCzrK3buOutepqJREixPLYXpdG77G1Bwf
	 AsL6830UX1w6DOV3/WWkrohNrPlfmBxzZ3lTF1SyMbqpZEfHCrkd40QZvDRuGyjFax
	 uu6wGS0d7GHfYx8eNH1oakmkCCogMp3phdGhbijN+M+GCzsBSSvKoYQTnbjJ+9dED/
	 wLDaFwyVVJT3S+UJ6ZUJapf7r7fyUkqlHMwPwwsxgLnwo4sNwAeC133L98qE6r8RY9
	 N3F94MrhklRESylupz7EsAPWo3cqiihPjI/JqpbSMEfFXLpy6zVIamqZdTVFQueZGH
	 70L4L72Z1MpiA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 56959C395D9;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v6.5 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611233.12258.10343470920616464418.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <877cs3h87m.fsf@BL-laptop>
In-Reply-To: <877cs3h87m.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 Jun 2023 15:01:33 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v6.5.
> 
> Gregory
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v6.5 (#1)
    https://git.kernel.org/soc/soc/c/982e6e1966ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


