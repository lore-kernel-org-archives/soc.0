Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A28CD13CF
	for <soc@archiver.kernel.org>; Mon,  2 Sep 2024 12:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC48EC4AF0C; Mon,  2 Sep 2024 12:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CE7C4CEC2;
	Mon,  2 Sep 2024 12:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725281990;
	bh=mETC2XQEN/dbo+m7Bk6KEfA/0ErXK0XUjEJTheXzRIQ=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=cHBX4mMjLbk1WmJkyY/kSc5iGIjaGu8YRxn/cDchXX7L7idwXJFv+vQwAMKsMmTEh
	 TW8lXhLRmki7mDyDR7vvJYDsylZ9lmKiQC3vH8g5/+cz0TXARoZYBpXcrWoxz84Yar
	 9kVkdcpsZWAlS5+Ul6VnNrW31Ytq5abGYteaHIkFJn2wWCLF7VOAli/pzuBW7r7Lc+
	 4/Tkrtxz9NtCJ3LDnELh3AhxN3z0MPtwfzdbBvhmVpzwvslOpeCWcRKi2ukUwucDkr
	 VbX+JgK3HMB8R191prJkJKYZIl3q6q0u4rU7dtP+HptZz825u2oZSEeJ/nz7zzTkXq
	 v2sfMGFDE8T4A==
Date: Mon, 2 Sep 2024 14:59:45 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH leds 1/8] turris-omnia-mcu-interface.h: Move command
 execution function to global header
Message-ID: <t3fazdw4aasl4oejkfowbavgxmwvvy6du2wvcku4wmstqn7cth@pvcgwzyzwsu5>
References: <20240902124104.14297-1-kabel@kernel.org>
 <20240902124104.14297-2-kabel@kernel.org>
 <ZtW1wuUCvQQSPBH2@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtW1wuUCvQQSPBH2@smile.fi.intel.com>

On Mon, Sep 02, 2024 at 03:55:30PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 02, 2024 at 02:40:57PM +0200, Marek Behún wrote:
> > Move the command execution functions from the turris-omnia-mcu platform
> > driver private header to the global turris-omnia-mcu-interface.h header,
> > so that they can be used by the LED driver.
> 
> ...
> 
> >  #include <linux/bitfield.h>
> > +#include <linux/bitops.h>
> 
> >  #include <linux/bits.h>
> 
> You may drop this one now, as guaranteed by bitops.h.

Hi Andy,

How do I know that including bit.sh won't be ever deleted from
bitops.h?

Is there some database which symbols are supposed to be provided by
which header, and not just randomly included from another header?

Marek
