Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430F1C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:27:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1471460F5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1471460F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71GMLk5aD700tx/GLT6RVFJ6r3oziUYSmxPizVydzEo=; b=KIgDZSU/VVjrNj
	PtLGhRnvO5p8JuWqWwV0+qFO/FG19QoclsMuNhp3x2ok3nZumlswZcrcOzeJDQkrNcP4SiKMPlCLd
	2+Ohezzvcs6TjRIfsEQ0X/QuGUZ+JE5dM+UF3eNNa2Z/ZhQ/WKuRA3IccuBfCEMu/jUIgxkwa8r1D
	Q/Gkz+w4jlA+fDdQcCXEQTkt0ls3f9ReWCN4x4J54wSIXSIEg+5PS5nJ+SKizsVhjO0SRHsPph/0v
	gNaX95rWvGLnHzuWakbESitlp0zM2mcrshS3wMxEO+B9Ff4p+ORAdsaE1qm0c8UdE7ksvS5QUEGni
	61BjQuWhSh+scRVfwRFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdJ6T-005qgW-8q; Wed, 20 Oct 2021 21:26:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdJ6Q-005qfv-Ds
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 21:26:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C995610E7;
 Wed, 20 Oct 2021 21:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634765186;
 bh=+Rp2vscxbxg3jT6N4n0or5HcOx4VLKMx3dxZ67B0u+U=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K4Nn9ED424rlzASOiKgZwTdkMJkiM6Jzk50IqpOOfE09VXsGYVMwnoG2sFGUz+i+Z
 nGeJ7Plu15WlnuQXcqiDlW03NcUh03Wpjt/yb0JhgVyfw3eiD89Rxf1LC/PF8MYQMD
 BNRYeWGVnyDAd2XoWNLJZCwkQ0ZF3BmOxEDzFQVdA/KAbk1g5YJUu6a1BLsJ42RwxT
 VaVTIP6b1GuzouZIc2z88egLkOK41ucP1ITXGE5G8cQ3M7Ncdo81W0O3jkA5eZiuso
 ZiKJvHg+eXlB8/L2uS8UJNXqU+uhWLG1JohMlFGFnC/d6w/ts4Sy9tLFHy7/qRcqVS
 nnzzLJu6CZpIw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>
Subject: Re: [GIT PULL] Allwinner Platform Changes for 5.16
Date: Wed, 20 Oct 2021 23:25:52 +0200
Message-ID: <163476513266.4063285.114162714174187124.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <0ceaad3e-dc26-4be6-b98f-d25e51a41b81.lettre@localhost>
References: <0ceaad3e-dc26-4be6-b98f-d25e51a41b81.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_142626_512200_596F5672 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211020212552.JCvLEYkbV8v3sURH5YCK88OxhjcFZBrVPri04aZVJao@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 18 Oct 2021 10:06:27 +0200, Maxime Ripard wrote:
> Please pull the following changes for the next release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 5cec64e5f97efa55a3f0a7f625263e66d09198f7

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
