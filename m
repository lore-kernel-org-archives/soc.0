Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8700C27C52
	for <soc@archiver.kernel.org>; Thu,  6 Jun 2024 09:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84468C4AF10; Thu,  6 Jun 2024 09:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D853EC4AF09;
	Thu,  6 Jun 2024 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717665079;
	bh=b89TdfUrI/7XAxaNGfMiB0tR6CQEt6CDVU+g9BJjxDQ=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=FggGB/3EAAaofIy4DR3hUkCx+bQvdrIOiP4Y8OUPl9abuccRvEXfjbJTqXT68ffqc
	 1hTE2KI41nHiQrS7qBJahfxP3H9qeIWA18IVw78IaGTiJlJxvvIWYIkLVLDLTEZ0Ll
	 aymKZ4xfqouNbYXm/JmNdk4t+dNwfOKloXrXgNSKEaq0cJp7SZ2Atu6i+NvDFuWOO7
	 ME99IyYpAUFb9TSoz2MOKmVAqNtQWZLnIJocfwU2gntIFgo+ZC3/GiMOr1k84yACqD
	 pHc1laEVFWta4B7UXEDBr/ccZsNk0a80zxj6or3GHHmjECFPMMqItz747vnnlhmzyN
	 H/aG2Kp7Ld3uA==
Date: Thu, 6 Jun 2024 11:11:13 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de
 Goede <hdegoede@redhat.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v11 6/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU provided TRNG
Message-ID: <20240606111113.7f836744@dellmb>
In-Reply-To: <CAHp75VfWZhmw00QP-ra4Zajn7LMvDW+NUT2fMx5kqeQ9eHLv5A@mail.gmail.com>
References: <20240605161851.13911-1-kabel@kernel.org>
	<20240605161851.13911-7-kabel@kernel.org>
	<CAHp75VfWZhmw00QP-ra4Zajn7LMvDW+NUT2fMx5kqeQ9eHLv5A@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Jun 2024 22:00:20 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> > +#include <linux/bitfield.h>
> > +#include <linux/completion.h>  
> 
> + errno.h

I use -EIO, -EINVAL and -ENOMEM in turris-omnia-mcu-base.c,
-EINVAL, -ENOTSUPP in turris-omnia-mcu-gpio.c.

Should I include errno.h in those also? Or is this only needed for
-ERESTARTSYS?

Marek
