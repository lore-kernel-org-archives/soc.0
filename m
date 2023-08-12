Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7B6C07E8E
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD941C113CA; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7D13C113C9;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=oj/0t5qrYv07Uj0pk3lB8CQAp6fSXYdlMVxTmfLdIzA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=i7gQT8TwRmTBplIaDeTxHnxgv1fQmr1y4+s2+z7XqUpncCcBYTNHe4p+IDqFCBHHM
	 Ktw8z8AN/+T515Cq2mvCVQnEy8nn3zaeznq9NrwgRlgKXAQi3AUwyV2tR3fWCPb5SG
	 4JPiRJqsyPfPvVXqt0xIYZUDlsEB5gP5JG8DJG6jLxABAT90ZeHd8BvVgiVabZY4EM
	 2DrpnbbD2FQylfQJCvJ9x7NovcUdrQ0NrrGktyhh2t9PsUvUhaGrWjYe8KqKRWq4eX
	 jzI5BmbbBFqLkbOmU3AMeRgBsGaRmMC6oxNlgd8mP2lBKEKDkSRtCAHGDPj4/HHHBm
	 Rq/S9R8q/C3Iw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 94469E3308E;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] arm64: dts: mediatek: Fix "status" values
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168960.30475.6200180966950713682.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <20230804225813.12493-1-robh@kernel.org>
In-Reply-To: <20230804225813.12493-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  4 Aug 2023 16:58:13 -0600 you wrote:
> The defined value for "status" is "disabled", not "disable".
> 
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Arnd, Please take this directly I guess. I think Mediatek maintainership
> needs some help. Maybe AngeloGioacchino should be co-maintainer as
> that's the only response I seem to be getting.
> 
> [...]

Here is the summary with links:
  - [RESEND] arm64: dts: mediatek: Fix "status" values
    https://git.kernel.org/soc/soc/c/c718f36c9bc3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


