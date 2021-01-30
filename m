Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575CAC433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:36:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2960264E04; Sat, 30 Jan 2021 11:36:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B28864DE7;
	Sat, 30 Jan 2021 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006565;
	bh=URTXjAQJvu8ExasvtoXs6ZJpkzS6u3m9DAlTYSchQ5Q=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KD4I88UW8SnEFZPwLhCC37C3E+fuxGns9d9OZ7/YY3Xl3uKgYZpqXyc0Tog29K8HX
	 KNlTZJF+bHjqWXgl6bDjPS7NHtk/zlM7Tv2jIXkZSXJL1KSSBg49qkltOSH5beTuzD
	 WohQId+grpHA/W/728lfLZ+1i7VWtvkKn0SVrgXG0Cno1cvmnIQfzA3v9BzB6hw4XO
	 pYHDV8Ez2wrsVBEypmOia6QtZgRnrlEd6K5N86FVWeG+ND1mQV8SowQj/9PxBUL2qv
	 oo1WI/Dfmmd52U7lnnQ3Mq0m2QpwwgxVt/PCIfJq8WH+Vb16DJv+OuG2Mi7P7XaaBY
	 7zoV0vIKcjJqA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	arm@kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: add STM32 CEC support
Date: Sat, 30 Jan 2021 12:36:00 +0100
Message-Id: <161200655725.2395965.6585888046023384484.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129084842.29123-1-alexandre.torgue@foss.st.com>
References: <20210129084842.29123-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 09:48:42 +0100, Alexandre Torgue wrote:
> Enable CEC support for STMicroelectronics as loadable module.

Applied to arm/defconfig, thanks!

[1/1] ARM: multi_v7_defconfig: add STM32 CEC support
      commit: f1f9580527705906e2af90f06c0c2025479fc412

       Arnd
