Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5C1C4332F
	for <soc@archiver.kernel.org>; Tue,  4 Oct 2022 20:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB93FC433B5; Tue,  4 Oct 2022 20:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9590BC433C1;
	Tue,  4 Oct 2022 20:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664916615;
	bh=s9yp85UK/ggFncpLJFRyaIue5/ka2Qd+i5v6kYp2hLg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=luSpbZ2vJtftLzyZuIxh/Eh4Bnmm+yPpddhTgI78uVfkUEL6KNg0dPlxnNBNH8zy6
	 dcGbCBtMZFqVYErc5P6toddWEYWsiAJnTfTIw6PATSdMXRrZsRKzvOUWgAGR1bmehL
	 IIN43m8USmMf76Vo8G/WPB1IHSwAkUrARLOql2wvKd7lt+ERm3wso1R5BsgaEJXMqn
	 zcGO8BNxK2zd5JPXm9oNHZk20thguILUIRsTByQmVZ6QBFLFtzzIMWN/qExT2U7ixN
	 nr7oz1cFSusdIe9hWPaYv7N62G9SS3zYQrH/WQhIEhSiGxv6c3f52VTkXYu0f4y6FW
	 mw7DHPWvtsXkA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 76C3CE21ED6;
	Tue,  4 Oct 2022 20:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM/arm64: dts: samsung: Late round for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166491661548.26031.7053625619002156129.git-patchwork-notify@kernel.org>
Date: Tue, 04 Oct 2022 20:50:15 +0000
References: <20221003073916.12588-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221003073916.12588-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  3 Oct 2022 09:39:16 +0200 you wrote:
> Hi,
> 
> Late pull of fixes for v6.1 for DTS: both ARM and ARM64.  The pull is based on
> master (not previous pull).  If it is too late, please consider this for fixes
> after v6.1 merge window.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM/arm64: dts: samsung: Late round for v6.1
    https://git.kernel.org/soc/soc/c/40a5af128af5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


