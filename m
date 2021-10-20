Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE4FC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:32:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D51611B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8D51611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxEE8Oc7shmX3XyR5NrtYbmLTuCd2wbVwtUufDFON5k=; b=wXiKRMSEkMEp/u
	698vmAuy+ne1haeBpPy8eG3sS/pzt7l9qdJQZj5uasSTYFTEn38THrVow23rJjXkrWZGZwjo79yrz
	PT+d6WRTNBkxQlpJDIuXcMC/yfHXfkg4iGkxd6KSuVoWbyK1B8Ga+Y88OoZNpt2kxYWSLVOd2Bep2
	lAjAhtUqdYtMTwjez9fmeBVEs0Mu0BD8DFxR+xFV6e3LN1opa5UBLP+7X3IqWnLHBERUyrdGTw6Ex
	cNESk4Pl1Gs0kd5fntyPyODvaxWYKevS/DKk2R1MPl2FQmB5Tt1i9Hzp92Hh3VM1FLwa4m8YqnCD6
	tpqEp7IORH0BgEDPMn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdJAx-005rjk-Qn; Wed, 20 Oct 2021 21:31:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdJAb-005rfc-HX
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 21:30:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5742A611ED;
 Wed, 20 Oct 2021 21:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634765445;
 bh=AiFsYIA6f06gt6RRpLBteGxRCVCZI1Vj7i9REFIzEJc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s21wpqPvSoosfjAxjPb0B0yTMmjMxY9BiyHObBgD84UQh4kJ6fjElXehpCpGdq7Vx
 ILruSnl7piHJlG7ZV8dNKNJrW1JgdqEW4pBEFZCY6rtuG5vBxEka/K7SEGVlBk9tNY
 ZmwwwSu/nG4eA8dXAXgVlt1n4zLXayFtYPaw19EVOsP+PHeHQr8wqU0fklDfF49w7m
 +xuKfp++l79Uvf0Csf3RgHL/Y8/UbctcO8DVPr2zjXGVI3iSVKvq5NvY0w/OiZt202
 KehEmwX0/OqiJ+XSqWiu2RnohTgz6Pj8eYRuw2/NLfqdwCWIFOZnCXD494fRQEuImB
 5sQAvs74+y6Og==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-imx@nxp.com,
 Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>,
 kernel@pengutronix.de, Li Yang <leoyang.li@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 5/6] i.MX defconfig update for 5.16
Date: Wed, 20 Oct 2021 23:30:37 +0200
Message-ID: <163476542786.4156336.16607243920223748744.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016140138.1603-5-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org>
 <20211016140138.1603-5-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_143045_631938_32747722 
X-CRM114-Status: UNSURE (   6.15  )
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
Message-ID: <20211020213037.Mvv4b3ZOl7nJ_TPO4IxG2nJCvjUerveqmQmGGHRQDwQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 22:01:37 +0800, Shawn Guo wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.16
> 
> [...]

Merged into arm/defconfigs, thanks!

merge commit: 48fe205ada2d6c6bc6a08154c1b797c7c237dd2d

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
