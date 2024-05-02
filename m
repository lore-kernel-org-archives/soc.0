Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDB4C4345F
	for <soc@archiver.kernel.org>; Thu,  2 May 2024 18:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7607C4AF18; Thu,  2 May 2024 18:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C06C113CC;
	Thu,  2 May 2024 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714675216;
	bh=W5wFylu4znY7p5AjANG4/Vgp7FEQmDmVli7qKcbQo0w=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=cAHFP/NAPrl6DEg1/PnJaQHHzpc25KBPSl0vd1n4bja55GlysooyOy8Xwj3g5aF1K
	 jEIkwC/c6x6Gw0Pqtu2cEhTfpa7TC4H4Zw1XZQFaR1ZtZpiRgG5nOxx3PP2DW0KUPZ
	 Dx5UugTDy5Ntkm2RcI53D0/5A7vHNK4MdZRDogb43iTohT2jll08PRIus1IbhAysxN
	 7aaXaZFQnNl08iTAaeD2GE41y9Ofy7TN7DRqAkeS/bvKj22wFCoSUld7QJj0cxgCMZ
	 8huqKspTP8GZHrY23BLRCIUsaHzDLJm9IFHMsSXPfjhtMk6Q2AuA48nz123A/CEHh1
	 hz5X4CdzvrUBw==
Date: Thu, 2 May 2024 20:40:05 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v8 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <20240502184005.fsdbwrbzmv5gshxh@kandell>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-3-kabel@kernel.org>
 <CAHp75VcgfvyZ9rcNev9CpQEN3CkUVozEkv+ycaQggPbE4tx+1Q@mail.gmail.com>
 <20240430160507.45f1f098@dellmb>
 <ZjELmaD3aQEuEa5K@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjELmaD3aQEuEa5K@smile.fi.intel.com>

On Tue, Apr 30, 2024 at 06:17:45PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 30, 2024 at 04:05:07PM +0200, Marek Behún wrote:
> > On Tue, 30 Apr 2024 15:53:51 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Apr 30, 2024 at 2:51 PM Marek Behún <kabel@kernel.org> wrote:
> 
> ...
> 
> > > > +static int omnia_get_version_hash(struct omnia_mcu *mcu, bool bootloader,
> > > > +                                 u8 version[static OMNIA_FW_VERSION_HEX_LEN])
> > > 
> > > Interesting format of the last parameter. Does it make any difference
> > > to the compiler if you use u8 *version?
> > 
> > The compiler will warn if an array with not enough space is passed as
> > argument.
> 
> Really?

Indeed:

  extern void a(char *x);

  static void b(char x[static 10]) {
      a(x);
  }

  void c(void) {
      char x[5] = "abcd";
      b(x);
  }

says:
  test.c: In function ‘c’:
  test.c:9:9: warning: ‘b’ accessing 10 bytes in a region of size 5 [-Wstringop-overflow=]
      9 |         b(x);
        |         ^~~~
  test.c:9:9: note: referencing argument 1 of type ‘char[10]’
  test.c:3:13: note: in a call to function ‘b’
      3 | static void b(char x[static 10]) {
        |

...

> > > > +               dev_err(dev, "Cannot read MCU %s firmware version: %d\n", type,
> > > > +                       err);  
> > > 
> > > One  line?
> > 
> > I'd like to keep this driver to 80 columns.
> 
> Then better to have a logical split then?
> 
> 			dev_err(dev, "Cannot read MCU %s firmware version: %d\n",
> 				type, err);

OK

> > > > +               omnia_info_missing_feature(dev, "feature reading");  
> > > 
> > > Tautology. Read the final message. I believe you wanted to pass just
> > > "reading" here.
> > 
> > No, I actually wanted it to print
> >   Your board's MCU firmware does not support the feature reading
> >   feature.
> > as in the feature "feature reading" is not supported.
> > I guess I could change it to
> >   Your board's MCU firmware does not support the feature reading.
> > but that would complicate the code: either I would need to add
> > " feature" suffix to all the features[].name, or duplicate the
> > info string from the omnia_info_missing_feature() function.
> 
> From point of a mere user (as I am towards this driver) I consider
> the tautology confusing.
> 
> 	...the 'reading' feature
> 
> may be a good compromise.

I have rewritten it to use another dev_info:
  dev_info(dev,
           "Your board's MCU firmware does not support feature reading.\n");

> 
> ...
> 
> > > > +       memcpy(mcu->board_first_mac, &reply[9], ETH_ALEN);  
> > > 
> > > There is an API ether_copy_addr() or so, don't remember by heart.
> > > You also need an include for ETH_ALEN definition.
> > 
> > Doc for ether_addr_copy says:
> >   Please note: dst & src must both be aligned to u16.
> > since the code does:
> >   u16 *a = (u16 *)dst;
> >   const u16 *b = (const u16 *)src;
> > 
> >   a[0] = b[0];
> >   a[1] = b[1];
> >   a[2] = b[2]
> > 
> > Since I am copying from &reply[9], which is not u16-aligned, this won't
> > work.
> 
> It would work on architectures that support misaligned accesses, but in general
> you are right. Perhaps a comment on top to avoid "cleanup" patches like this?


OK
 
> > > > +enum omnia_ctl_byte_e {
> > > > +       CTL_LIGHT_RST           = BIT(0),
> > > > +       CTL_HARD_RST            = BIT(1),
> > > > +       /* BIT(2) is currently reserved */
> > > > +       CTL_USB30_PWRON         = BIT(3),
> > > > +       CTL_USB31_PWRON         = BIT(4),
> > > > +       CTL_ENABLE_4V5          = BIT(5),
> > > > +       CTL_BUTTON_MODE         = BIT(6),
> > > > +       CTL_BOOTLOADER          = BIT(7)  
> > > 
> > > Keep trailing comma as it might be extended (theoretically). And you
> > > do the similar in other enums anyway.
> > 
> > ctl_byt is 8-bit, so this enum really can't be extended.
> 
> I understand that (even before writing the previous reply).
> 
> > In fact I need
> > to drop the last comma from omnia_ext_sts_dword_e and omnia_int_e.
> 
> Who prevents from having in a new firmware let's say
> 
>  BIT(31) | BIT(1)
> 
> as a new value?
> 
> From Linux perspective these are not terminating lines.

OK
