Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0441948033B;
	Thu,  2 Jul 2026 12:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993865; cv=none; b=eLtOYos8blE75akMUucCLjQldND5QhS0QzcMqGE+o5Tf4mg9H/FTplh+A78600d/al+tZ0Y5VVnQKVpWVWL6+5tJ0uZYMHORqyh/9Udp8UpQhH+ac5IdkWb/yIkfWXKsGSYME1g2nozcbow5dvBrC83NJ3vkRcr40XVP/Rv2KOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993865; c=relaxed/simple;
	bh=Pd6yPROIcqgQQb5NBDN3gjv5kzMa5kXpEnZ2tXaWdss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiLbOW5qUIZI2xnIo9ZAXjE/U68FgwKtXkbR/IloFySfTm0In47p/ACUiHEq0Ay5cR/jv8j5cIcTgYdPkv6WKGcic3fV2RRkc2XsIJYAcOIfJkQNxYKSSLGt1rVvOODVhaHTZ1WC6IpqgD0olOkAcwSCsnEnt1ig6lG0LHjpiJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netwinder.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PVhVq355; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netwinder.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PVhVq355"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BgzVAKieF0iuF8m7CPEO5R6wFSEw4erbN+1y1QD9JfI=; b=PVhVq355kL01t7KbPUAo7JVQNS
	T1R/S5qTGeOQXF41vW1jgbea/TV2hzPne/L0OFCMAKDU7uiR9W1uBVApuMkC9szw7GbFuV8IKFMzf
	SbVzJkxb2yNOwx7RNLGisl6v7ORxIWD0nre6Pf40rDbcU0he+0h/2T+/YlREPvrYL9aMSmxV/hTln
	eIFQ5E9eX9kFBONRRhjZQk4xK+K79+mlwjTKmwOlTOlDkkWSFTLnMICVIkVeudmDZVimcve7FnNfA
	spJ2orvtiHDcAzPNvg/khlWSW7sOcUAUJNawYNrhZRAn6rcoqAEMVDtm3pnNifTLnOQ8eVfZg49Gu
	aGMKQMiA==;
Received: from [72.10.137.214] (helo=rfs.netwinder.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfG9K-00000003mN5-2Lu3;
	Thu, 02 Jul 2026 12:04:10 +0000
Date: Thu, 2 Jul 2026 08:04:05 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
	"A. Sverdlin" <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Mack <daniel@zonque.org>, Frank Li <Frank.Li@nxp.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Stefan Wiehler <stefan.wiehler@nokia.com>,
	Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 07/19] ARM: update DEPRECATED_PARAM_STRUCT removal
 timeline
Message-ID: <akZTtfOqEftfT3ZS@rfs.lan>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-8-arnd@kernel.org>
 <CADkSEUhO9nhzQZCS7ZziCtMna+ibfj9_PbSH5R+c0pyi5viCvg@mail.gmail.com>
 <46f76624-ba35-427d-8a60-ec0fe39e5b8c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46f76624-ba35-427d-8a60-ec0fe39e5b8c@app.fastmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <ralphs@netwinder.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Jul 02, 2026 at 07:36:02AM +0200, Arnd Bergmann wrote:
>On Thu, Jul 2, 2026, at 02:54, Ethan Nelson-Moore wrote:
>> Hi, Arnd,
>>
>> On Wed, Jul 1, 2026 at 2:25 PM Arnd Bergmann <arnd@kernel.org> wrote:
>>> This configuration option is for the older boot method that preceeded
>>> ATAGS. This was scheduled for removal back in 2001, but the removal
>>> never happened, presumably because nobody cared enough to actually do it,
>>> not because there are any users left.
>>
>> Only netwinder_defconfig selects this option. Do the most recent
>> NetWinder firmware versions actually need it? (LinusW, do you know
>> this?) If not, can't we just drop it entirely?

Support for ATAG was added in firmware v2.0.6 in roughly Jan 1999, 
meanwhile the most recent firmware is v2.3.3 (still 20+ years old).

It is quite safe to disable support for the older parameter method.

>If all StrongARM platforms are on the way out after the LTS kernel,
>I don't see a need to remove this any earlier, even if the chance
>that it's still needed is low.

Also agree with this, might as well remove it all in one go.

Regards,
Ralph
