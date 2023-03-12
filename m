Return-Path: <SRS0=L7O9=7E=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F261C6FD19
	for <soc@archiver.kernel.org>; Sun, 12 Mar 2023 21:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D945CC4339C; Sun, 12 Mar 2023 21:40:47 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54038C433D2;
	Sun, 12 Mar 2023 21:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54038C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6f6Y7LE26iLoc26gBiJX3yiT5sQ5r15wZSUvx/W8T2A=; b=y2xckxbzEJzBEgBXHPIVBi2S5P
	UOXuf6LR3jI+mDoCJcROEk8+QZAVMKQMy6jcaPcTGf3P9EWu7CLbwilK71/BMlmFPGvcj/Wama3uh
	7zuZ8IlLHOhLtlC5ehRWNaoMegk+YK9LGXZyJser799SUPp0Vc5PweubB9nEqH48aXCLT2cZPvdu+
	MDyQeu5hHvJUnX4mVks9otMqJzxHUfjzxK+XWjsy6HFJbdtz5tiHEXLF9pSzZsOMNbdh6j1OzISfH
	QZKi96XqBFMSUwGgent5ylrhlt31GmymF7ILDxWPyHKjFHN8GDWdhVRzXc+WTvBXucGjCknXvWqXY
	CuGe8bOw==;
Received: from p200300ccff059e001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff05:9e00:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1pbTQk-00045m-9W; Sun, 12 Mar 2023 22:40:38 +0100
Date: Sun, 12 Mar 2023 22:40:36 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, marex@denx.de, max.krummenacher@toradex.com,
 leoyang.li@nxp.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: dts: imx: Add devicetree for Tolino Vison
Message-ID: <20230312224036.37dc4d41@aktux>
In-Reply-To: <1346ce4e-f1fd-1a77-f38e-cd87efc59082@linaro.org>
References: <20230312205236.2281466-1-andreas@kemnade.info>
	<20230312205236.2281466-3-andreas@kemnade.info>
	<1346ce4e-f1fd-1a77-f38e-cd87efc59082@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 12 Mar 2023 22:02:24 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 12/03/2023 21:52, Andreas Kemnade wrote:
> > This adds a devicetree for the Kobo Aura 2 Ebook reader. It is based
> > on boards marked with "37NB-E60Q30+4A3". It is equipped with an i.MX6SL
> > SoC.
> >   
> 
> Thank you for your patch. There is something to discuss/improve.
[...]
> > +	pinctrl_i2c2: i2c2grp {
> > +		fsl,pins = <
> > +			MX6SL_PAD_I2C2_SCL__I2C2_SCL	 0x4001f8b1
> > +			MX6SL_PAD_I2C2_SDA__I2C2_SDA	 0x4001f8b1
> > +		>;
> > +	};
> > +
> > +	pinctrl_i2c2_sleep: i2c2grp-sleep {  
> 
> Shouldn't all groups end with 'grp' suffix? Are you sure this passes
> dtbs_check?
> 
> ...
> 
No problem with dtbs_check. But I will resend with corrected names.

Regards,
Andreas
