Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6FAC4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:08:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 164C46108C; Thu, 12 Aug 2021 21:08:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B02366101E;
	Thu, 12 Aug 2021 21:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628802525;
	bh=SQRFibz0JZpGLswRiDOBmj10evnsaGsg60PEB+9n/Hw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kv4dnsbB+LOLD/XYjvkumMxR22ND+0OhW3Oypf1IUANpYIX+OU7FkMxDqpCcT0nvy
	 tI1/hF62CIeis34Q7dfTlcc72opb2G8hiRu3DYseBPSM2squWM5i1fKhSdS45Hgp/3
	 tnBUXZVBWXL+vXxoNW2tg4H+v64YL8vucIQhBxh4kZWwnOf5ulYzOJDZK5GKIj4Apd
	 1ylqi8Q3TCj6RKxksaHceN8PC6g5y/Ts6zIehs8Mnw3NEI/qQIcTkBEi69sZFtpKtf
	 sRoGrqJOXYwl+0qJzRuLiFAX8EM3GGPObhzpsTAfgZ3Ink29D5XURcBNRuQhhh1d83
	 WjG8TA/CD2qpQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: multi_v7_defconfig: amlogic updates for v5.15
Date: Thu, 12 Aug 2021 23:08:39 +0200
Message-Id: <162880251654.1376866.17026578806860861616.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <8e2b5139-86e6-0da3-75c4-d8df66448d51@baylibre.com>
References: <8e2b5139-86e6-0da3-75c4-d8df66448d51@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 10 Aug 2021 09:46:59 +0200, Neil Armstrong wrote:
> Here's a single multi_v7_defconfig change for v5.15 to enable CONFIG_MMC_MESON_MX_SDHC controller used on meson8/8b
> 
> Neil
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 20904527a70de3aff43edafdf5d18b0f6f976f59

       Arnd
