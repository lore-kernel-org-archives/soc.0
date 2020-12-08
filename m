Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBC7C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:32:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9694523AC8; Tue,  8 Dec 2020 23:32:30 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [GIT PULL 2/2] memory: Second pull for Tegra MC for v5.11
Date: Wed,  9 Dec 2020 00:31:40 +0100
Message-Id: <160747024262.3766805.9887485843112720344.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201207075758.5501-2-krzk@kernel.org>
References: <20201207075758.5501-1-krzk@kernel.org> <20201207075758.5501-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 7 Dec 2020 08:57:58 +0100, Krzysztof Kozlowski wrote:
> On top of previous pull request. This will remove annoying warning coming from
> the previous patches, so it would be good if it goes this cycle.  The warning
> itself does not mean anything is broken - just message that new features are
> not supported yet.
> 
> Best regards,
> Krzysztof
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 358c85de1a358aa0d0e0708a2eba73aa84d924f5

       Arnd
