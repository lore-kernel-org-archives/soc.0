Return-Path: <SRS0=X5/R=LH=nic.cz=marek.behun@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED95CD1284
	for <soc@archiver.kernel.org>; Tue,  2 Apr 2024 16:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C04CCC433C7; Tue,  2 Apr 2024 16:42:03 +0000 (UTC)
Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3ACD7C433F1;
	Tue,  2 Apr 2024 16:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3ACD7C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nic.cz
Received: from kandell (unknown [172.20.6.80])
	by mail.nic.cz (Postfix) with ESMTPS id AEC1A1C184F;
	Tue,  2 Apr 2024 18:41:59 +0200 (CEST)
Authentication-Results: mail.nic.cz;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
	t=1712076119; bh=KsHqIU03sKEpvUMS47A78uuJhzarHCzHfAicczh24Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Reply-To:
	 Subject:To:Cc;
	b=wAajVCPskhVE6QjgewseYXgMvfXy+nAr9nqIxZzBmCGOJ1MHz0qbE0w/Gu1bYzNJz
	 kneTVuNk4xUrIOF/IBR4mWDIZnwxbAQ6hQ177SkR37jGIKtvE9tUwGLBvuGs8OhhL8
	 7JqkMAm8d2CkkCGSUooowNcfWay3yzVdhSbpXCv4=
Date: Tue, 2 Apr 2024 18:41:59 +0200
From: Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org,
	arm@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5 02/11] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <20240402164159.ylu3gy4pwrbxqoeb@kandell>
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-3-kabel@kernel.org>
 <ZgAII1B03bLUisWr@surfacebook.localdomain>
 <20240324160408.77c8574e@thinkpad>
 <CAHp75VesxrOdm4H3TYUtfEJx=i3Zpd6a=yzbkUFismnzW=nE-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VesxrOdm4H3TYUtfEJx=i3Zpd6a=yzbkUFismnzW=nE-g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.103.10 at mail
X-Virus-Status: Clean
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Rspamd-Server: mail
X-Spamd-Bar: /
X-Rspamd-Queue-Id: AEC1A1C184F
X-Spamd-Result: default: False [-0.10 / 20.00];
	MIME_GOOD(-0.10)[text/plain];
	WHITELISTED_IP(0.00)[172.20.6.80];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com]

On Sun, Mar 24, 2024 at 05:30:39PM +0200, Andy Shevchenko wrote:
> On Sun, Mar 24, 2024 at 5:04 PM Marek Behún <kabel@kernel.org> wrote:
> >
> > Hi Andy,
> >
> > thank you very much for the review. I have some notes and some
> > questions, see below.
> 
> Btw, I'll look into other patches next week.

Hello Andy,

did you have a chance to look at the other patches?

Marek
