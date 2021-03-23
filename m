Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2514C433C1
	for <soc@archiver.kernel.org>; Tue, 23 Mar 2021 17:33:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B675E619B7; Tue, 23 Mar 2021 17:33:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BA7D619C1;
	Tue, 23 Mar 2021 17:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616520814;
	bh=D1SW3s3mSner/+64SWK4kWmpA5riGvih25dnjKUDQ0w=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NOF2A4J9sS5kZXJML5JTXwwttuGylo3oMMX8sSp8Xl+Gjz3k9wAZfog+HG6gTj8bW
	 svDR407SRG0vD8VfXXTfx8AD5nT55/z5xcYiwu/at5PjVRvTtX5YboKIuFZhpnKGMl
	 VGbjekOmDm+n1Be2LVnF2Tn/ClXj8JBOhGGMMedBD3QWnoL5dVwg6CoeHTYsN4vZvn
	 On6SJwzUR2rzsmrMfUljKJUAr0QqrSePBrf2IJfU3GGFMzqQAjq4c4QiiPbFaxBvPW
	 gTbZqWEgtHkWWh4tS1KWZbOWBRKl3rSkFZvX8+9hw800zgzGSpo071w+0d/q9FPdlS
	 KaT8b189IV5mw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL 1/3] Renesas ARM defconfig updates for v5.13
Date: Tue, 23 Mar 2021 18:33:30 +0100
Message-Id: <161652079858.2900879.12964454491151691553.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319085146.2709844-2-geert+renesas@glider.be>
References: <20210319085146.2709844-1-geert+renesas@glider.be> <20210319085146.2709844-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 19 Mar 2021 09:51:44 +0100, Geert Uytterhoeven wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.13-tag1
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: b61ecafafe9cbe8e99206bb7ef638d8e8340515d

       Arnd
