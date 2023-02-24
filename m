Return-Path: <lee@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E613EC64ED8
	for <soc@archiver.kernel.org>; Fri, 24 Feb 2023 09:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEF29C4339C; Fri, 24 Feb 2023 09:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C63C433EF;
	Fri, 24 Feb 2023 09:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677231522;
	bh=6fDwijTBue48bJspsOFFD3aXQCFrPP8MYZInjODecCY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=LP9h46RYi7XL1E4ypCqnqwTkTKn6k81nU6eS53usKrnO/jrgLqlAWdpRcJOccMeVq
	 QSzQUJZhYo7P69ZvamvKnvnmlOKYHycwJp6zDc4THFVtaVW1fZ7S0txLP66txlqkpL
	 fjqb2ocSzQV6epI/z1mnGu/U7LFqmzCHwsu3mDMFLNvPutDm1KyyQ54D6QfUvVuFVr
	 wyEfpjr3vhj8sWmETPmYfKapyuWE1FpPKgj71zHPDyRgUFuwZ0nTJfXZsMlg7IbjVd
	 BQTqQnmEqu8C/t3bNUbjLeD4sqNQ7gydD5IYGzLYRUEPHEwd7RCVGVzB7wCqqLWLNG
	 qUNcs5MNTkurA==
Date: Fri, 24 Feb 2023 09:38:37 +0000
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>, soc@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 4/8] dt-bindings: leds: Add
 cznic,turris1x-leds.yaml binding
Message-ID: <Y/iFnUAMl6YS1pSV@google.com>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-5-pali@kernel.org>
 <Y9OypLjJb+O3yvhw@google.com>
 <98867251-1f59-fdc6-9535-49db7b24140a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98867251-1f59-fdc6-9535-49db7b24140a@kernel.org>

On Fri, 24 Feb 2023, Krzysztof Kozlowski wrote:

> On 27/01/2023 12:16, Lee Jones wrote:
> > On Mon, 26 Dec 2022, Pali Rohár wrote:
> > 
> >> Add device-tree bindings documentation for Turris 1.x RGB LEDs.
> >>
> >> Signed-off-by: Pali Rohár <pali@kernel.org>
> >> ---
> >>  .../bindings/leds/cznic,turris1x-leds.yaml    | 118 ++++++++++++++++++
> >>  1 file changed, 118 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
> > 
> > Needs a DT Ack (now Cc:ed)
> 
> Within the same day of posting v2 of this - just after 4 hours, Pali
> received review and I pointed issue to address.
> 
> The issue was not addressed, just ignored.
> 
> Therefore this patch shall not be taken, until the issues are resolved
> or discussion is finished if there is disagreement about my comments..

Understood.  Thanks for the clarification.

-- 
Lee Jones [李琼斯]
