Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CAFC433B4
	for <soc@archiver.kernel.org>; Thu, 22 Apr 2021 21:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 480E66141C; Thu, 22 Apr 2021 21:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 30C3261417;
	Thu, 22 Apr 2021 21:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619127009;
	bh=SzE2VQHkNqNFjJ2KYI2DgCCCS36e74hdFSyDlxNQqtA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Zfyg47V8LgGTQ5S2CTksEdUXZYPLn8PwVU/nhMMxHtkOInKuSqRJKLx4DP+D0OWPO
	 p8p6GtbBxhOjOnV2u97jMzRU8XxBjQudda+FDwmXLxxU9hnwUa5kZarqPtQQ7LfpKj
	 4DRGg+xDHG5oYOdWQ9gOBOjeMvS2CX9YTVUGjcbJyBYs0Kt6gXtcE9IjtM7sSKELkD
	 IEZprjgaBhp8IiOZvclqvLAgyvyOZl4p5Cwe9/T3ItnIiaDntPESpVDZPQfm6t2nlz
	 LrCY+ZV+/vvapvV73huJiP6OxIKR27xdTCpApE143CIaPBK6Xw8R5kXAinEOb3LWSa
	 HhS/7kEVCqETw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 260D760A52;
	Thu, 22 Apr 2021 21:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: misc DT schema fixups
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161912700915.19496.5455399732813445244.git-patchwork-notify@kernel.org>
Date: Thu, 22 Apr 2021 21:30:09 +0000
References: <20210421204833.18523-1-khilman@baylibre.com>
In-Reply-To: <20210421204833.18523-1-khilman@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (refs/heads/for-next):

On Wed, 21 Apr 2021 13:48:32 -0700 you wrote:
> Take a pass at cleaning up a bunch of warnings
> from 'make dtbs_check' that have crept in.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  Documentation/devicetree/bindings/media/rc.yaml    |  4 ++++
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  1 -
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 14 +++++++-------
>  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |  2 +-
>  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |  2 +-
>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  4 ++--
>  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  2 +-
>  .../dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |  2 +-
>  .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |  8 ++++----
>  .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |  2 +-
>  .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |  2 +-
>  .../boot/dts/amlogic/meson-gxm-wetek-core2.dts     |  2 +-
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  4 ++--
>  .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts |  2 +-
>  16 files changed, 31 insertions(+), 28 deletions(-)

Here is the summary with links:
  - [1/2] arm64: dts: amlogic: misc DT schema fixups
    https://git.kernel.org/soc/soc/c/d9421d6c5294
  - [2/2] dt-bindings: mali-bifrost: add dma-coherent
    https://git.kernel.org/soc/soc/c/3f9a3345a3a1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


