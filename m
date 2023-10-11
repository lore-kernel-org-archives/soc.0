Return-Path: <SRS0=6caw=FZ=kroah.com=greg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FEACD98F7
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 07:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F9B7C433CA; Wed, 11 Oct 2023 07:45:00 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D900EC433C7;
	Wed, 11 Oct 2023 07:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D900EC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 891765804C1;
	Wed, 11 Oct 2023 03:44:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 11 Oct 2023 03:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1697010297; x=1697017497; bh=JZ
	ToOnQlaLQI+R1OJZjMd5txCt25LannQJkkFemkr7A=; b=2I1Uee41GqQiS5mRa7
	b+oLFHaHse24HaozrZAH5aB5O6tH1OPeNXTHMFgWUHQJ+EJrC95eZNw0k/kn8TZb
	d6GCEPJJATP1hL/7LLiPs0dvVLy8RoNLfmxVDGtXO4ipZcHbiVIT1NI8sArIRDOi
	YDGadkOLR5hnJyg7EPvK9G+ig7LRP5tS9geD5LCHiKDX6NUQw4JC1uWIZt65jSZK
	8bRYsHbC42O24GL2BsXZKGaB7ycIUgDZ35VrUzyduSd68q8XBij2krCyq+GZQNYh
	Kq6ZqaWI+slgetPhXhJo7c8WPDuI73LD4ayto3V5YDYrbx0gsQ5OfiDcVInJZ40p
	0gYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1697010297; x=1697017497; bh=JZToOnQlaLQI+
	R1OJZjMd5txCt25LannQJkkFemkr7A=; b=QQKKGB5UoVL3YQ4FtdrsWsjqKcufn
	37TnvP56+FqTFex/vwIupr3qRdQVV6X2EN77rH/ZNuY6bb9D6MP4/rZPooCFVk0M
	F3SPsWyKMjwEqeO3KolFnelceT5+rSaIEmm58c62wdJ9G1IURsJzIPoswNjDRAdI
	173HETIxvG91z1fOkEvVRki7NY2I8XbVCOX5F/V/3gnuDO2SjoOHesDFb/8Q6Ey6
	0kqrfdQ2i+Ntru8WNRY5wDWQFPgF0Hf/fChlcV2REkh171SUXjK3YlRDy0EYodqE
	WHcNY7lzlv0ZeiyxZNbNcBJmmH7Nv72e+moVHzabqtZ631FoEb0nogqYw==
X-ME-Sender: <xms:eFImZej4eHDXn_Ru6WgufJrf4kJLu_4wat-r3vbGWJUgjAli7pT8ww>
    <xme:eFImZfCG-IC8RIx8_MLrdpmX8ABknJIFkLOnpp2QKfWhOnzcg-Iaj3U2K7p8oHRMs
    k3Cx-zzzijiAw>
X-ME-Received: <xmr:eFImZWFsra_F7BfmAimk0JZCBx8cgzCGV50sPziqXQC9edJzx9dShwXQ-JKfpVct_6WI9-87IMUeO-zHEUAuLxI_XpSraHxY-E5fMczONP4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheejgdekudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:eFImZXS3hehWydKzE9FCS1Sofv1sITbomg94NeHwJ3ml1wLj3qFBvw>
    <xmx:eFImZbwY9RZWoEXZgGd9ZlKbXYRoRshZv_o6MT-02QoNXjo085Itgw>
    <xmx:eFImZV4My1BsUQZ15GES-Nc6HIUF3bbFldSh1_jvRjCuSEZbj6fhBw>
    <xmx:eVImZTMd-gdYVE_hUjMN2G9PoVBnopKaS3wkDx9nBKgBmBcMR6ZgLw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Oct 2023 03:44:55 -0400 (EDT)
Date: Wed, 11 Oct 2023 09:44:52 +0200
From: Greg KH <greg@kroah.com>
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
	tomasz.figa@gmail.com, s.nawrocki@samsung.com,
	linus.walleij@linaro.org, wim@linux-watchdog.org,
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	semen.protsenko@linaro.org, saravanak@google.com,
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Message-ID: <2023101101-mauve-underarm-1b48@gregkh>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>

On Tue, Oct 10, 2023 at 11:49:08PM +0100, Peter Griffin wrote:
> Hi folks,
> 
> Firstly, thanks to everyone who reviewed the v1 series! V2 incorporates all
> the review feedback received so far.
> 
> This series adds initial SoC support for the GS101 SoC and also initial board
> support for Pixel 6 phone (Oriole).
> 
> The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro
> (raven) phones. Currently DT is added for the gs101 SoC and Oriole.
> As you can see from the patches the SoC is based on a Samsung Exynos SoC,
> and therefore lots of the low level Exynos drivers can be re-used.
> 
> The support added in this series consists of:
> * cpus
> * pinctrl
> * some CCF implementation
> * watchdog
> * uart
> * gpio

So you have sent a patch series that crosses multiple subsystems, who is
supposed to be taking these patches?  Or do you not want them actually
merged?

confused,

greg k-h
