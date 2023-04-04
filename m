Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AA8C77B62
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1BC0BC433B4; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 069FFC433A7;
	Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680619284;
	bh=PJTbUKk3H6psEGWXBeeJnVtfICWt/qNY0LA2sVvpez8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=d4xWjrd/myieRcz2w3d44UlfgUi4AeOLbl02mkm8l9WDl69cjP550fHDbiXTPtdDO
	 7veEeiwh3NE+Sxy+5buUZsbc0z+YN/DBZA9ABrYV1ON7RVlYWX5PDDm8I0rZFH9b6b
	 9RqDxN61qFYSZi3fHqPAMbkpxS+bO5fmmmfoWDnB5pnVDcah1opVaqSkoiwM2qnRPx
	 SC92C/bj8Nj/ecUwl9IbzWJKgu2Z+JxW9SHR7+wnnRVKcF3Ile2z1nCPKxPoR6Jg+E
	 LTeqa6jlVOq8Avx8YzxSyBE/NrugsLkXj0rOsMpwdQAtqtE2IwbM2cvgDLruG3ST9h
	 X6Oc8hvdEaobw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D7424C41671;
	Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM DT updates for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168061928387.17322.12381872178653925618.git-patchwork-notify@kernel.org>
Date: Tue, 04 Apr 2023 14:41:23 +0000
References: <eb1f32f8-822d-9cfc-fca6-9e044bf4a5ab@linaro.org>
In-Reply-To: <eb1f32f8-822d-9cfc-fca6-9e044bf4a5ab@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 4 Apr 2023 11:19:52 +0200 you wrote:
> Hi,
> 
> Here's an Amlogic ARM DT changeset for v6.4, with some dt fixes in regards
> to dt-bindings and changes to enable Bluetooth and WiFi on the mxiii-plus board.
> 
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM DT updates for v6.4
    https://git.kernel.org/soc/soc/c/9514e519320d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


