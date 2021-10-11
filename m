Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B50C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 14:54:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A9CCF60ED4; Mon, 11 Oct 2021 14:54:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0308160BD3;
	Mon, 11 Oct 2021 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633964082;
	bh=gwJSn9/WH7jBGPOAUDejmOq4MucxMh1nnl8hVskmGKg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RLXL8JTtS9kxXS/WevrlPHbybeW2+Wj3vREClcrUCBJWTTwurdSVFo4p+j1QWcbUF
	 fwg8dtLQWpv7CuRYEjHjh6vm+FxRCC+R7EInaVvaYKD9Z6g7HahhEI1gRMu9RfgqOI
	 UZDppynooEe86MhXQMeuBd7B0JwEUnsqilu/qAQ60euugDk6t9Hh7/5cVU1qU5jQvp
	 WZpbunu7835k3aDb2E8Jx2uLUkQuZ8DblxbpouZ//MiV9VPxE/pUYrJH8VSRViQoje
	 c3l70DsVLVELapC7akV49aOZGkQJWLxjVVrvXJGq/PM/n2BAcJDea+WQE6gjhln6xH
	 Ea4iSPcYY+DzQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [GIT PULL] soc: mediatek updates for v5.16
Date: Mon, 11 Oct 2021 16:54:27 +0200
Message-Id: <163396399141.3170841.8977960189531317594.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <b1d364d0-f2ae-488b-b3f7-c694049c20d3@gmail.com>
References: <b1d364d0-f2ae-488b-b3f7-c694049c20d3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Oct 2021 12:01:04 +0200, Matthias Brugger wrote:
> Please have a look on the changes for this round.
> We have support for mt8192 in the mmsys and mutex driver. Apart mmsys now
> enables it's integrated reset controller.
> 
> Thanks,
> Matthias

Merged into arm/drivers, thanks!

merge commit: 24e18b0f45c7830a74400aa599e4e3d67155ae1c

       Arnd
