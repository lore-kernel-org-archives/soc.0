Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E780C2BD09
	for <soc@archiver.kernel.org>; Fri, 12 Jul 2024 13:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14EF5C4AF0B; Fri, 12 Jul 2024 13:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00B3C32782;
	Fri, 12 Jul 2024 13:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720790221;
	bh=Y/hNjML+WNSsZPU2qiogB+Nf/Z2HrETCsMXtzxhOnDI=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=PO09tUB++lVLQg2XetgBEfk44polPntz1R4v/EO0mg6WjKq7YLzibt7/EMzwQri7Q
	 0lUN1M23yg1MMFkdUz5/HnqyG7hEE7HtQXsXN9wPVeEJfsg1mMjs3xD7kyZLbtrJJw
	 ykTJMwvB6X8+lg5ix/6FtNimfA7+AkTbbo5TFQIe1X/TPYs+1zeMgw1ASmTJp3rvPG
	 3iqt70uyPrbs0X/63Ck0XLrPYur1BnF7Z+iK75fRPH43A2AYvbckTf/QC1SI2mQL5J
	 1XhfJ90q/rcnqg9NtJ6ud6XrX6aNAg4LFZ9X0kJ+JBHM6X8U0p/XWPNeb3Ijnn/xTb
	 A2KVEHJiCtpqg==
Date: Fri, 12 Jul 2024 15:16:56 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, 
	soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v3 09/17] firmware: turris-mox-rwtm: Simplify debugfs code
Message-ID: <jd7b4jeqkwyoooj56o7gpoagier7g6ycoyx2dknxl6c575jdk4@ena7paun5r25>
References: <20240617144532.17385-1-kabel@kernel.org>
 <20240617144532.17385-10-kabel@kernel.org>
 <CAHp75VfR8T+W6HWyvJ+xOP14GBeO+-2JFLUjiqV6tF_7qdr8Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfR8T+W6HWyvJ+xOP14GBeO+-2JFLUjiqV6tF_7qdr8Gw@mail.gmail.com>

On Mon, Jun 17, 2024 at 10:22:47PM +0200, Andy Shevchenko wrote:
> On Mon, Jun 17, 2024 at 4:46 PM Marek Behún <kabel@kernel.org> wrote:
> >
> > Simplify debugfs code: do not check for errors, as debugfs errors should
> > be ignored, and use devm action for dropping the debugfs directory.
> 
> Actually you may do that without devm. There is a lookup method or so
> in debugfs APIs that can be used. Can be amended later on, though.

But I want to get rid of driver .remove() method altogehter in a subsequent
patch. How can I use debugfs_lookup_and_remove() that way without devm?

Marek
