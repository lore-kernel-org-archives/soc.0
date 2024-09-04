Return-Path: <SRS0=3rGK=QC=nic.cz=marek.behun@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BA8CD3431
	for <soc@archiver.kernel.org>; Wed,  4 Sep 2024 07:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50D8DC4CECC; Wed,  4 Sep 2024 07:28:51 +0000 (UTC)
Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2237C4CEC2;
	Wed,  4 Sep 2024 07:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2237C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nic.cz
Received: from solitude (unknown [172.20.6.91])
	by mail.nic.cz (Postfix) with ESMTPS id 9CF0A1C11E3;
	Wed,  4 Sep 2024 09:28:46 +0200 (CEST)
Authentication-Results: mail.nic.cz;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
	t=1725434927; bh=tk3GLcKEhbugbqCDMBb450vXfJ/SOUCvr2F6s0BsG/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Reply-To:
	 Subject:To:Cc;
	b=pr77zmjg5yvhZhrJPb31kUOZFNX4X5cVM8/lMbOU4Q0LlbavQ3D2G/Ztlh/KYYr8F
	 HrjMJTlDSOR03/Ib5paaGPhjLM886teXRoY8DlKGUYfeD3dDb6QfoZn83MTWR1tOdh
	 RZ1qcj3pZ3w0XoMvjBbzByUXlWpVZhztqJyLcGjc=
Date: Wed, 4 Sep 2024 09:28:46 +0200
From: Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	soc@kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
	arm <arm@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH leds v2 10/11] leds: turris-omnia: Use 100 columns in the
 rest of the code
Message-ID: <qlvkoj3nnfcnl2p5ekiaguhdgvsqug33jtpjxe3znj7urkvkdv@22honu42olit>
References: <20240903101930.16251-1-kabel@kernel.org>
 <20240903101930.16251-11-kabel@kernel.org>
 <fce1d0ed-d7e3-401a-9132-0b5c1571398c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fce1d0ed-d7e3-401a-9132-0b5c1571398c@app.fastmail.com>
X-Virus-Scanned: clamav-milter 0.103.10 at mail
X-Virus-Status: Clean
X-Rspamd-Action: no action
X-Rspamd-Server: mail
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Rspamd-Queue-Id: 9CF0A1C11E3
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.10 / 20.00];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	WHITELISTED_IP(0.00)[172.20.6.91];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]

On Tue, Sep 03, 2024 at 03:21:15PM +0200, Arnd Bergmann wrote:
> On Tue, Sep 3, 2024, at 12:19, Marek Behún wrote:
> > There are 7 more places in the code where the 100 column limit can be
> > used to make the code more uniform. Do it.
> >
> > Signed-off-by: Marek Behún <kabel@kernel.org>
> 
> I feel like it's ok to use either 80-character or 100-character line
> lengths in a file, but I don't see much value in changing from one to
> another here, maybe just drop this patch.

By either-or you mean exclusive or inclusive OR? The driver already has
some lines at 80 and other at 100, so I just wanted to convert to 100
completely.

But I don't mind dropping it.
