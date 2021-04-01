Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1415CC433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:15:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ACB7C610D1; Thu,  1 Apr 2021 20:15:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87A4B610D0;
	Thu,  1 Apr 2021 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308136;
	bh=fuOqNA8DOJlxAKS6JNMR4tbjB4yQtvLJUcYSsD7dFW0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jlc/GyE6cVAawBfEDAJJRIMlv/fznTzNj9imiymblA8t+SX+cKGCiBC/qgXYOH9oj
	 ibXXOAr94VmMFs93lX640srKZvTJrZuU9gcsScJpJSASFkTouyjqeQw3SOTV+NZQ6U
	 ogHNwNBVY0w/lpnTh2FDjyf0jpbekbr5Th45QptZ7v3waz+55TmvHHXDjyd63kb3kL
	 Ju4x6xzoQ8RqehOHyexDEvkp9vlgBHP1R8vmxa2rpkHBqUcn/hHwNXrz7oIIP+1l5j
	 PEol+Q0Kt4l1P25S5toJAMIy5a/5EFY19JKvbH32bnQCPwxTkyFPqMG1yaxRAZZVab
	 o3GUdBwMGxnfQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Olof Johansson <olof@lixom.net>,
	Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marex@denx.de>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	dillon min <dillon.minfei@gmail.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [GIT PULL] STM32 DT changes for v5.13 #1
Date: Thu,  1 Apr 2021 22:15:15 +0200
Message-Id: <161730808665.655497.4617378835159018275.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <48784f53-943b-0baf-d4a0-fcb7d3849b00@foss.st.com>
References: <48784f53-943b-0baf-d4a0-fcb7d3849b00@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 14:44:37 +0200, Alexandre TORGUE wrote:
> Please consider this first round of STM32 DT updates for v5.13. This PR
> provides mainly new board supports. A new MCU art-pi board based on
> stm32h750 plus a new Engicam boards family (SOM and carrier boards)
> based on STM32MP15.
> 
> regards
> Alex
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 24eab7796e6f15ea26e3f2a4883e0fa01494819c

       Arnd
