Return-Path: <SRS0=LO1r=OK=yeah.net=shawnguo2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CE5C2BD09
	for <soc@archiver.kernel.org>; Wed, 10 Jul 2024 03:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55877C32781; Wed, 10 Jul 2024 03:35:46 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.kernel.org (Postfix) with ESMTP id 73407C4AF0D;
	Wed, 10 Jul 2024 03:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73407C4AF0D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yoKbyY6y+PwSn7kYNR3CBuTfC9HA2wCHppFjzdbEQDA=;
	b=ON5AZv9S6iUJKe3Uf1rY+dzCf/3t/rPI0y2Bhfr8iGC0IzaWZyd4QBnW5rHQhY
	alLz2UQsR1ZYo2pnqyroo44CjjJPPbOC6eEv/FnVfYxvflYZRHFEBcb0u85eWoiv
	9ZCwpjKwtrogQ7OCxGi9z703PcRBgQWaZ1+GG4ANNIS6w=
Received: from dragon (unknown [117.62.10.72])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgB3P5EZ841m4sSEAA--.26945S3;
	Wed, 10 Jul 2024 10:34:03 +0800 (CST)
Date: Wed, 10 Jul 2024 10:34:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, arm <arm@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL v2 5/5] i.MX defconfig change for 6.11
Message-ID: <Zo3zGRiDFqduQwLo@dragon>
References: <20240709012534.3106441-1-shawnguo2@yeah.net>
 <3d480ce9-863a-4d2b-ab31-294207a0a924@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d480ce9-863a-4d2b-ab31-294207a0a924@app.fastmail.com>
X-CM-TRANSID:Ms8vCgB3P5EZ841m4sSEAA--.26945S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcX_-DUUUU
X-Originating-IP: [117.62.10.72]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxsYZWZv-fr-xAAAsY

On Tue, Jul 09, 2024 at 04:05:29PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 9, 2024, at 03:25, Shawn Guo wrote:
> > ----------------------------------------------------------------
> > i.MX defconfig change for 6.11:
> >
> > - Enable a few drivers needed by TQMa7x/MBa7x and i.MX53 QSB/QSRB in
> >   imx_v6_v7_defconfig
> > - Enable IWLWIFI driver support in arm64 defconfig
> 
> Hi Shawn,
> 
> I have queued all five pull requests now. I think patchwork
> got confused by the v2, so you did not get an automated email
> for them.

Great!  Thank you, Arnd!

Shawn

