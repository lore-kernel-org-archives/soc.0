Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02408C433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 16:07:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BBBAA61373; Wed, 20 Oct 2021 16:07:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C96F861183;
	Wed, 20 Oct 2021 16:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634746072;
	bh=yGSDknLUynltSzqVuVtTIF0eYkbLFsO79faQI2/sf8I=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZnR1zoY0UsifIRDE07aHDeAKBLLaEMChMNuxupxLtNPNJ8szByYW1ds/MgDwBR35V
	 +TgtCvZpWrWdu9pzPzlhDpSyrObLh68aNEfK4gb8PLBW/KKBGcnYhzR5jn8lExUPqh
	 CH+9swe/aYgGwgGLxKKV5JAkvPHgREs5VG0a8/ew7mFB6JHH2rlM+EyPHxvRJsO+0p
	 ED0oKF7ADB/Aarlga6D7n05G0Qe7pBTaak0MIJHr8eUj+obqKpoYU2Nml1FV0FQ+hO
	 Ipxaq/JEE775EGXIDnbs3iR46ep8OKwPRIfGUM6HYPku//wQ9kB6PtArISJzWXbe+9
	 xOngX9sjh6cog==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Lunn <andrew@lunn.ch>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Christian Lamparter <chunkeey@gmail.com>,
	khilman@kernel.org,
	olof@lixom.net,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Matthew Hagan <mnhagan88@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [GIT PULL 1/3] Broadcom devicetree changes for 5.16
Date: Wed, 20 Oct 2021 18:07:46 +0200
Message-Id: <163474606225.2486492.3794812434525126819.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211013174016.831348-1-f.fainelli@gmail.com>
References: <20211013174016.831348-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 13 Oct 2021 10:40:14 -0700, Florian Fainelli wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.16/devicetree
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4d3e49a3755c619e698625df2f31cc547b01f964

       Arnd
