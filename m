Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7FEC25B10
	for <soc@archiver.kernel.org>; Fri, 10 May 2024 15:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DAEFBC32781; Fri, 10 May 2024 15:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2ACBC113CC;
	Fri, 10 May 2024 15:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715355395;
	bh=jusqEtCH2MeZgBnEZ4naprhjSbb5YN3aQHvO10Zh+k0=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=qJpfdeW2AR0DRk1zbhAnDwFQmgaTBReSjzj2nf4221jqJAMMS0Hgk4XEGYzkmlFEj
	 1bhf/LQupGMX6MSYcse8pedAXMfRpwANjiS6YBKZhM4kUOj/M59Wz5KKUNuj5dcSL4
	 zU2oYWCCYbzYpnyubfwAmve1R5l0JbbPVVF2quUlm1ORnVSidSpMB97d/UcKpUfA7D
	 foJqU6stmbb6S1Nb4Kb2y489oZU6qmpimoedrVikBMYP8vf1QkXm4S5uT+GfwKgrDG
	 DNsBXeI6DpQ+ETxSryRUwCxeOuQvGaZCmsYVkTGGwYUu9qFydRSmb1fHXXj1XqgzJD
	 I5bA0S6mAuhFg==
Date: Fri, 10 May 2024 17:36:29 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v10 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <20240510153629.bd3gkfm4he2rybui@kandell>
References: <20240510101819.13551-1-kabel@kernel.org>
 <20240510101819.13551-3-kabel@kernel.org>
 <CAHp75VfdSqRbhek3eCPtdPtrv2FJyhpG0XvKFMfT9yrDsCjY2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfdSqRbhek3eCPtdPtrv2FJyhpG0XvKFMfT9yrDsCjY2Q@mail.gmail.com>

On Fri, May 10, 2024 at 04:41:20PM +0300, Andy Shevchenko wrote:
> On Fri, May 10, 2024 at 1:18 PM Marek Behún <kabel@kernel.org> wrote:
> >
> > Add the basic skeleton for a new platform driver for the microcontroller
> > found on the Turris Omnia board.
> 
> ...
> 
> > +       err = omnia_cmd_read(client, cmd, &reply, sizeof(reply));
> > +       if (!err)
> > +               *dst = le32_to_cpu(reply);
> > +
> > +       return err;
> 
> Introduced here and "fixed" in the next patch. Something wrong with
> rebasing / squashing?
> 
> You will need a v11 anyway. And you have now much more time for it,
> don't forget to update the kernel version and date in the ABI
> documentation.

It would seem so. I will send v11 also with the GPIO changes (to use
__set_bit() and friends).

Marek
