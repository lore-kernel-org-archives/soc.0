Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E72AC10F1A
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 14:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4910EC3277B; Tue, 23 Apr 2024 14:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8C2C116B1;
	Tue, 23 Apr 2024 14:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713882124;
	bh=GiU7bPm7gZlmL1MFd1ZPX+XAfkslJRtXCYItb/Z9NCY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=ZkJBSPpjhWqoRocxqZAlk4cLVcws5WmLZQatOpinHXmR8OqETi35gwc9B0KKg6snk
	 5ewQUlKWVmxeH91CWWsi8nhrx0GxYOnBH2r+hYuWjVMeYJjbiWvui6dhbVCoGjG4bk
	 sMkmz9klXFq3WhbdBbj5fxg8hw/oi3x63eaKszlBWVG0P4YaMdREnjEkI7NCXOpWG4
	 f+y15BvOI1URhtRJO+WiOA1/y5xFYtjE2soOvo2JdErw+sVDmNEnObWu9cwm/3TZwb
	 5IsRMy3dPnUwd8sBuB9MsXTofripCKO3OwlERznhwi5ZTe7WsNMlEPDVDDlypAJMOa
	 vO9S0SvJ2OABQ==
Date: Tue, 23 Apr 2024 16:21:58 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>, arm@kernel.org
Subject: Re: [PATCH v6 06/11] devm-helpers: Add resource managed version of
 irq_create_mapping()
Message-ID: <20240423142158.l65ltdymdy2lf73v@kandell>
References: <20240418121116.22184-1-kabel@kernel.org>
 <20240418121116.22184-7-kabel@kernel.org>
 <Zietl9AhJ_2VB5YQ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zietl9AhJ_2VB5YQ@smile.fi.intel.com>

On Tue, Apr 23, 2024 at 03:46:15PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 18, 2024 at 02:11:11PM +0200, Marek Behún wrote:
> > Add resource managed version of irq_create_mapping(), to help drivers
> > automatically dispose a linux irq mapping when driver is detached.
> 
> AFAICS this is a dead code.
> Please, drop it from the next version.

What do you mean by dead code?

