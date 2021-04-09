Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E932C43460
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 07:50:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CF42E611BF; Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B7FD6610A3;
	Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617954610;
	bh=J/EE/YcVuhqqCeM5VRKktaqvMaYy6pY6TqVg36qvF1Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ErETKsMP+9dyyuxWTYiIYiEMBEo1PciontR9S0PVTr06AZ9Apitiz63lt2ZMifnCR
	 EGVKQWU9LRtG1kQa8rfy93IrpLn2L1/OqZ+sQ9XGdncjPEb8LXH1jVsjMd4dtqma7b
	 Q75axZ7O5k1f0oIC4s5e2JG3OXlMKOKP9b/MpDSgsTaOlPtQAHMLv7syYVkskXrjQ5
	 exAEac2+AtzEjTVa5Vg/yW03aZLRj3pCdaPF9a59NuI1l7CkNgdZ6V0SZCjDJ2d5qF
	 kqg8rIcZi3fp4uXZeg6HFKFA8iRyrCdGqh+63KOmjSt+lhgACL0MlRsU1M3qWFfaAk
	 7lrNrKNCelGJg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A82C960BFF;
	Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] asm-generic/io.h: Unbork ioremap_np() declaration
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161795461068.18683.17885661547808001534.git-patchwork-notify@kernel.org>
Date: Fri, 09 Apr 2021 07:50:10 +0000
References: <20210409052038.58925-1-marcan@marcan.st>
In-Reply-To: <20210409052038.58925-1-marcan@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Fri,  9 Apr 2021 14:20:38 +0900 you wrote:
> It accidentally slipped into the #ifdef for ioremap_uc().
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  include/asm-generic/io.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Here is the summary with links:
  - asm-generic/io.h: Unbork ioremap_np() declaration
    https://git.kernel.org/soc/soc/c/ea9629283839

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


