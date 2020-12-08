Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0511EC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BF51D23B23; Tue,  8 Dec 2020 23:10:27 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Kurt Kanzenbach <kurt@kmk-computers.de>,
	Pavel Hofman <pavel.hofman@ivitera.com>,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	Vivek Unune <npcomplete13@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>,
	Vladimir Oltean <olteanv@gmail.com>,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	olof@lixom.net,
	Rob Herring <robh@kernel.org>,
	kernel test robot <lkp@intel.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Phil Elwell <phil@raspberrypi.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 3/5] Broadcom devicetree changes for 5.11
Date: Wed,  9 Dec 2020 00:09:38 +0100
Message-Id: <160746884441.2839681.14095199165753732675.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128163410.1691529-3-f.fainelli@gmail.com>
References: <20201128163410.1691529-1-f.fainelli@gmail.com> <20201128163410.1691529-3-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 28 Nov 2020 08:34:08 -0800, Florian Fainelli wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/devicetree
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c8b53b1c6b9330ebee782ca28cc824fec50064de

       Arnd
