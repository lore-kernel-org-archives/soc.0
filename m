Return-Path: <SRS0=HPBY=QB=lunn.ch=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FE9CD3448
	for <soc@archiver.kernel.org>; Tue,  3 Sep 2024 15:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88416C4AF0F; Tue,  3 Sep 2024 15:56:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18A33C4CEC9;
	Tue,  3 Sep 2024 15:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18A33C4CEC9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=dLrp3ZxRXHd3ZuhyiaBxb0aOt9XQW5+dH/UrXRC7tYQ=; b=Qy
	/sQZNp4dpPEMV8L+MzsXPVkULGRjRAfhMiGV4HcR4w8tRLvKallJI44QKlszZsXv5gWbNtdFfVeB1
	Oxi7kNkV2xxiBtc2Y3bBM09VnIKamALZuTH/m97TcyEafI2mI5EtV+w/pBuG8eo/aNWIigAnBPWCP
	VXpVDCnuHpkGv8U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1slVtN-006Riv-VY; Tue, 03 Sep 2024 17:56:29 +0200
Date: Tue, 3 Sep 2024 17:56:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH leds v2 08/11] leds: turris-omnia: Use dev_err_probe()
 where appropriate
Message-ID: <224af639-babd-4d6e-813b-70fe07d5e337@lunn.ch>
References: <20240903101930.16251-1-kabel@kernel.org>
 <20240903101930.16251-9-kabel@kernel.org>
 <CAHp75VfEnuJb2s4QWJ3NNeXcx+qwNXf2ypJ6A35ECOEf+TA9EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfEnuJb2s4QWJ3NNeXcx+qwNXf2ypJ6A35ECOEf+TA9EQ@mail.gmail.com>

On Tue, Sep 03, 2024 at 01:45:49PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 3, 2024 at 1:20 PM Marek Behún <kabel@kernel.org> wrote:
> >
> > Use dev_err_probe() instead of dev_err() + separate return where
> > appropriate.
> 
> ...
> 
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "Cannot set LED %pOF to software mode\n", np);
> 
> Side note: Not sure how np is being used besides the messaging. If
> it's only for the messaging, I would rather see %pfw and fwnode based
> approach.

This board has a number of Ethernet switches described in DT.  Nobody
takes ACPI seriously for any sort of complex networking. So using
fwnode is probably pointless, this board will probably never be used
with anything other than DT.

	 Andrew
