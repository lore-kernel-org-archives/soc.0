Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE5CC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:11:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 67A2823B04; Tue,  8 Dec 2020 23:11:00 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	Seiya Wang <seiya.wang@mediatek.com>,
	Hanks Chen <hanks.chen@mediatek.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL] arm64: mediatek: devicetree changes for v5.11
Date: Wed,  9 Dec 2020 00:09:50 +0100
Message-Id: <160746884493.2839681.12401038433447118676.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <72fe1c4f-f27c-c455-dfd9-66bde90bb295@gmail.com>
References: <72fe1c4f-f27c-c455-dfd9-66bde90bb295@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 29 Nov 2020 22:16:11 +0100, Matthias Brugger wrote:
> Please have a look at the following devicetree changes for v5.11.
> 
> The most remarkable changes are support for three (!) new MediaTek boards, the
> AiOT chip mt8167, the smart phone chip mt6779 and the tablet/laptop chip mt8192.

Very happy to see the mt8192 get merged, looking forward to seeing actual
Chromebooks with that one ;-)
 
> Beware that I had to create a stable branch to share the binding includes for
> the new power domain driver found on mt8183 and mt8192.
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 5161540797589eacad9b309416b1d15729306c00

       Arnd
