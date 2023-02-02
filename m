Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C99DC636D3
	for <soc@archiver.kernel.org>; Thu,  2 Feb 2023 23:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1724C4339B; Thu,  2 Feb 2023 23:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF59C433EF;
	Thu,  2 Feb 2023 23:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675381616;
	bh=DvgcfXg5AKjvMPSx1Zn8HpCditz5nJ6MsXT7UI+c9zI=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=EpBCBKTLDGWVaABmiBDaVXi7RGWhIrxUYYoiiO9K95wGLBx46JgM3OQIAZ6ARVBYP
	 ylkEsXcRI4mNcESmgaw2e9U5z7y5Iw0E3gBqIzg84YubiSykocyMMiNGxX8NNapucG
	 CNtP9OGzU7ApSKayKVoP95y+Wl+81Py/Mdu7IMYGFRu7Jcoe332e0ELh2NyP4kMwiQ
	 1+DcbRgOIHL8UYR54nPTjEnv7JLFLClsBNGIr70T0H86USTg4hSVCJzlBKSqtTH9TH
	 lYIZtqrzhN9Aop6tRqZUL+nU4xzOPkogKHYOTsE7eyQKr0DQCC4cBrbaRQGFG9v0TS
	 E254ttqB6pRqg==
Received: by pali.im (Postfix)
	id AFE5A720; Fri,  3 Feb 2023 00:46:53 +0100 (CET)
Date: Fri, 3 Feb 2023 00:46:53 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Lee Jones <lee@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: pavel@ucw.cz, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>, soc@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 5/8] leds: Add support for Turris 1.x LEDs
Message-ID: <20230202234653.ukwpjntws3roacty@pali>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-6-pali@kernel.org>
 <Y9Ozg2O41a2iijMc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9Ozg2O41a2iijMc@google.com>
User-Agent: NeoMutt/20180716

This interface was designed from existing turris-omnia interface:
https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia

On Friday 27 January 2023 11:20:35 Lee Jones wrote:
> Pavel, are you happy with the user-space interface?
> 
> On Mon, 26 Dec 2022, Pali Rohár wrote:
> 
> > This adds support for the RGB LEDs found on the front panel of the
> > Turris 1.x routers. There are 8 RGB LEDs that are controlled by
> > CZ.NIC CPLD firmware running on Lattice FPGA.
> > 
> > CPLD firmware provides HW triggering mode for all LEDs except WiFi LED
> > which is automatically enabled after power on reset. LAN LEDs share HW
> > registers for RGB colors settings, so it is not possible to set different
> > colors for individual LAN LEDs.
> > 
> > CZ.NIC CPLD firmware is open source and available at:
> > https://gitlab.nic.cz/turris/hw/turris_cpld/-/blob/master/CZ_NIC_Router_CPLD.v
> > 
> > This driver uses the multicolor LED framework and HW led triggers.
> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > Reviewed-by: Marek Behún <kabel@kernel.org>
> > ---
> >  .../testing/sysfs-class-led-driver-turris1x   |  31 ++
> >  drivers/leds/Kconfig                          |   9 +
> >  drivers/leds/Makefile                         |   1 +
> >  drivers/leds/leds-turris-1x.c                 | 474 ++++++++++++++++++
> >  4 files changed, 515 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-turris1x
> >  create mode 100644 drivers/leds/leds-turris-1x.c
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-turris1x b/Documentation/ABI/testing/sysfs-class-led-driver-turris1x
> > new file mode 100644
> > index 000000000000..272695ae400b
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-class-led-driver-turris1x
> > @@ -0,0 +1,31 @@
> > +What:		/sys/class/leds/<led>/device/brightness
> > +Date:		July 2022
> > +KernelVersion:	6.3
> > +Contact:	Pali Rohár <pali@kernel.org>
> > +Description:	(RW) On the back size of the Turris 1.x routers there is also
> > +		a button which can be used to control the intensity of all the
> > +		LEDs at once, so that if they are too bright, user can dim them.
> > +
> > +		The CPLD firmware cycles between 8 levels of this global
> > +		brightness, but this setting can have any integer value between
> > +		0 and 255. It is therefore convenient to be able to change this
> > +		setting from software.
> > +
> > +		Format: %u
> > +
> > +What:		/sys/class/leds/<led>/device/brightness_level
> > +Date:		July 2022
> > +KernelVersion:	6.3
> > +Contact:	Pali Rohár <pali@kernel.org>
> > +Description:	(RW) Current brightness level value (0-7).
> > +
> > +		Format: %u
> > +
> > +What:		/sys/class/leds/<led>/device/brightness_values
> > +Date:		July 2022
> > +KernelVersion:	6.3
> > +Contact:	Pali Rohár <pali@kernel.org>
> > +Description:	(RW) Values of all 8 levels between which CPLD firmware cycles
> > +		when brightness button is pressed.
> > +
> > +		Format: %u %u %u %u %u %u %u %u
