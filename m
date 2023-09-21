Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D26E7D0A2
	for <soc@archiver.kernel.org>; Thu, 21 Sep 2023 18:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4AE7AC433CA; Thu, 21 Sep 2023 18:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6075EC433C7;
	Thu, 21 Sep 2023 18:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695321875;
	bh=mSe6ZQGvAfqP77nV2aR32yjtCGuc0k/DHY1SnxjaN9Y=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=fWHtY+Eu3nLPpIeKpVKnzosCfka7X1gBQeDheLddPej9lrOWMG++a3ge1OSQVPQzq
	 o9kcbXMvxV1q845uooyGhlVNVhFbR+LNFGq6xRemXSSYIevvU8ag2PXsGRz4/GbhfO
	 zuAcFZugZYvdSFocSM6APrw7NAofl6UMxZgvQYKAWxTtwqp6VbwGK5EYTqPMXpHlpj
	 G8xZ1LVehMt3TYZKctwbcP6tX5w7AIm52TCDOWBnVvFge+YYgBBPhe988AxhwexLqM
	 WaXwHXBI44M7z9SnOvnzJltArM/4vKzYwAt98ALxt4U77cR4H/kU1MG2tjyLU3SHE3
	 DqhKivP4ktkdg==
Date: Thu, 21 Sep 2023 20:42:43 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20230921204243.19c48136@thinkpad>
In-Reply-To: <ZQmbd211FzPjA97r@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
	<20230919103815.16818-4-kabel@kernel.org>
	<ZQmbd211FzPjA97r@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 Sep 2023 16:00:39 +0300
Andy Shevchenko <andy@kernel.org> wrote:

> > +	mutex_lock(&mcu->lock);
> > +
> > +	if (ctl_mask)
> > +		err = omnia_ctl_cmd_unlocked(mcu, CMD_GENERAL_CONTROL, ctl,
> > +					     ctl_mask);  
> 
> > +	if (!err && ext_ctl_mask)
> > +		err = omnia_ctl_cmd_unlocked(mcu, CMD_EXT_CONTROL, ext_ctl,
> > +					     ext_ctl_mask);  
> 
> Can it be
> 
> 	if (err)
> 		goto out_unlock;
> 
> 	if (_mask)
> 		...
> 
> ?

Hi Andy,

so I am refactoring this to use guard(mutex), but now I have this:

	guard(mutex, &mcu->lock);

	if (ctl_mask) {
		err = ...;
		if (err)
			goto out_err;
	}

	if (ext_ctl_mask) {
		err = ...;
		if (err)
			goto out_err;
	}

	return;
out_err:
	dev_err(dev, "Cannot set GPIOs: %d\n", err);



which clearly is not any better... or at least the original
  if (!err && ext_ctl_mask)
is better IMO.

Compare with:

	guard(mutex, &mcu->lock);

	if (ctl_mask)
		err = ...;

	if (!err && ext_ctl_mask)
		err = ...;

	if (err)
		dev_err(dev, "Cannot set GPIOs: %d\n", err);


Do you have a better suggestion?
