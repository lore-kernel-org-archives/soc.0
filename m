Return-Path: <SRS0=l0og=IB=bootlin.com=herve.codina@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BA8C41535
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47F9CC433C9; Fri, 22 Dec 2023 12:34:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0D11C433C8
	for <soc@kernel.org>; Fri, 22 Dec 2023 12:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0D11C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC452240003;
	Fri, 22 Dec 2023 12:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703248490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bq0Cc7KHVfln4arFsKeGt5O9gb4Np/925X2DinLuzzI=;
	b=X3gr0tiTDPm0nix/vXT1GCh6Ot7hAp7YQ2RZjpA2QK+NhhgJcTJ6YoXMIThcEFm6dtx5pD
	FrEPEmTpeB/xztiJTDtdrc5nQr4jBcm06tyA/SdL9QJJXeCMQBLTGJCM4X2Yd8MdVOVyvM
	dLVMDonEoTvo1TddsOaCC8XQ2mNThiKUgrnoUunvn8tYQYoShtPbiGs7nRfq/w4gCl7y5Z
	6cTPk7SZhyFQZsJ+iDYaICyLMeGX/KuCihyuLxP5qrt/3g36Rz+7Iks/t++A5z4m6YPDTv
	OPsucwuj53L7ZkClevva2b7gtATtb4AgbsmB8U5YEObm7FmEl44LoLQ3bn0AQA==
Date: Fri, 22 Dec 2023 13:34:48 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc <soc@kernel.org>, "Qiang Zhao" <qiang.zhao@nxp.com>, "Leo Li"
 <leoyang.li@nxp.com>, "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] PowerQUICC QMC and TSA drivers updates for v6.8
Message-ID: <20231222133448.1413d78d@bootlin.com>
In-Reply-To: <a274ba17-6ab7-4169-a10c-22fcc9e74248@app.fastmail.com>
References: <20231212105514.273e8ab0@bootlin.com>
	<a274ba17-6ab7-4169-a10c-22fcc9e74248@app.fastmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Arnd,

On Fri, 22 Dec 2023 10:55:00 +0000
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Dec 12, 2023, at 09:55, Herve Codina wrote:
> > The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:
> >
> >   Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:hcodina/linux.git tags/fsl_qmc_tsa_v6.8
> >
> > for you to fetch changes up to 7a2ee1576dcc6bbe017a8283fba237b05b13fd15:
> >  
> 
> This is not a valid git URL I can pull from. I have instead pulled from
> 
>   https://github.com/hcodina/linux.git tags/fsl_qmc_tsa_v6.8
> 
> which is what I think you meant. 

Yes, exactly.
Thanks a lot for having pulled the https url.

> 
> You should probably edit your .gitconfig file to add a section
> like (not sure about the exact syntax, you'll figure it out).
> 
> [url "https://github.com"]
>     insteadOf = git@github.com
> 
> 
> >  drivers/soc/fsl/qe/qmc.c      | 658 
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------  
> 
> This is an overly long line that you probably copied from a large
> terminal window. Just for readability, I recommend redirecting the
> 'git request-pull' output, e.g. into 'xclip' or 'cat', which will
> give it the appropriate line length for emails.
> 

Thanks you these feedback and tips.
I will be more careful in the future.

Hervé
