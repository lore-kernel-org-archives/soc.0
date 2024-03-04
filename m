Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7B2C54E5D
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 74C52C41679; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EC06C43390;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709574032;
	bh=K/MRpTnVXrsqz+uhONrq6fvxYZgmD3xv4vNdCQuUrlo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eAOd4R1v7WNwLwN8P0mB+D8wr3rOj4AYGFrNtyHVLkm2+mCnCLOTmXSqNNlW+Dm/5
	 23oe+gg8oknUVO6RuLNXtNiZhkeDyIrkYFfTzIu1S4mZTP3ik2ObjS4PGcQS8h7y5s
	 nwXQ1EuruKMZbMShO5bjOUR9MwPnCWPTfAud/WW4C2+K96ZhR+f8eZeTd4ectZwcvk
	 NOPpura02jxj6QC0S4O+WdjssS8xbsvehRhCjcFM1/XLLh5C/+BwsodeIt2ihF+Qu3
	 FLWUBWYOOMzd5WCXStgvf68vdjkCPXmKvqTCSS7jHi7COxx2y6F32XlOEw/nmOi0x6
	 Bykw9bqoNpP0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44FF7D88F88;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: drop ext2 filesystem and redundant ext3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170957403227.23732.12653435877574863220.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 17:40:32 +0000
References: <20240221155033.44160-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240221155033.44160-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Feb 2024 16:50:33 +0100 you wrote:
> ext4 filesystem can mount ext2, so drop CONFIG_EXT2_FS to make builds a
> bit faster.  Drop also redundant CONFIG_EXT3_FS, because it just
> selectes EXT4_FS.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - arm64: defconfig: drop ext2 filesystem and redundant ext3
    https://git.kernel.org/soc/soc/c/82abf00ecc69

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


