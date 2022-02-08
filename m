Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F073C46467
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15646C340F2; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1FBEC36AE5;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644311579;
	bh=W5MBh43L4PKoCSVUw2OUKE5wbpIZGl9N/SPRNMXS6PY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rlG+t0GayIiCnmJsnxmh5B8/9T6mtBRoNxSdvJ5FtEv/y7iBg4HYB//lJe9aCAsBw
	 NvDJ8IO2freKnladN60bS2JjXs2x2FmXnpmYxdkQB98wGjA8p29nG3kpqylpPQzAt3
	 jvw3tY9/GPDkOCqKDeZDoGCph18F3zIRvZ73W4hQl7nVSGAE4545C0mQd1Ib64SjEX
	 dXBNVq8TN4yuwbLNHGvjCQv8Fw+Dbo3AjwYkGDTv/HgRUtlf2CQaIt2bTAojT+ori+
	 xk39eXQ2sX23ZtAGMdY7CSB6ERSLJdYhNkSIseAI14QuTOErvjeIGzucikDaS+2Rvt
	 ski00SpNruoFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DDD42E5CF96;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] MAINTAINERS: update various stm & sti maintainer names
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431157889.18327.10086136061531044985.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:12:58 +0000
References: <20220113171921.17466-1-philippe.cornu@foss.st.com>
In-Reply-To: <20220113171921.17466-1-philippe.cornu@foss.st.com>
To: Philippe CORNU <philippe.cornu@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 13 Jan 2022 18:19:19 +0100 you wrote:
> This short serie contains the maintainer status update sent recently by
> Benjamin Gaignard (see [1] for details) and add new maintainers for
> various stm & sti files.
> 
> [1] https://lore.kernel.org/lkml/20210706163033.795805-1-benjamin.gaignard@collabora.com/
> 
> 
> [...]

Here is the summary with links:
  - [1/2] MAINTAINERS: Update Benjamin Gaignard maintainer status
    https://git.kernel.org/soc/soc/c/bf5bdcc9f262
  - [2/2] MAINTAINERS: update drm/stm drm/sti and cec/sti maintainers
    https://git.kernel.org/soc/soc/c/60f40305529b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


