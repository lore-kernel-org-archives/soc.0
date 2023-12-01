Return-Path: <SRS0=/2fP=HM=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F60C4167B
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 16:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29CD2C433CB; Fri,  1 Dec 2023 16:39:57 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA9FEC433C8;
	Fri,  1 Dec 2023 16:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA9FEC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id B20975C00E3;
	Fri,  1 Dec 2023 11:39:54 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 01 Dec 2023 11:39:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1701448794; x=1701535194; bh=7Y
	bpojJ95x+YivzTGtWaCT+gyLnu9JP8SfZ7cnDnPXI=; b=Y6JEdGCpnR0RWMt0CR
	OpDqTKiG88nOaZg6uwk9nk8gWCqID9cftr8FSmUtaALyb6daCt6bWD5eh3ZXeE5r
	KMGieoLH8ji6Bjy81JpGzNgYl5g6pNzt23fIwmtlXecmPtISffQueRQgK2640cih
	PtTMmOognnyrEJraAJ0efGcybFhjuMEdWqWf9fd1oecu+VVbbqVKOBSth12KSltR
	eCKQmdwTLt0R9mu09OtkhGbWyVAonn3kTGFwF9j3OvIyC5NYEiudYnC8kdVGWnRg
	yP79Qyw71pssnCP4n31Sv5SyhK+Qf/MOBv9KYAUH3IVhOd5tQU0/CPdFDXPB/9gK
	UC2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701448794; x=1701535194; bh=7YbpojJ95x+Yi
	vzTGtWaCT+gyLnu9JP8SfZ7cnDnPXI=; b=quqkS7zfXJILrSwueJwn0ouQTbnaT
	/d85z0RfpaEGiDPrFSZBclh2fzPpl7ogafJxVtQLCEiHCF8zooEeWKSIpJIFjTsJ
	59QPx/++KvuBX9rvLTq2iKTkqRqi05wE74TYeoNoHZFIeIdPGso2MejxLDdfy8+6
	6xvM1Pch4l7GvA3zOat/4gGDrXjdtPVYwKbVlwH/p9wJoSSBzTIgSEZGkL3r+gqm
	iEZZhAihGVJhxJFTWr9GDUcdI1Ao7p6QP7G2gPBw1j3AldGLTv0YG1BaxRTICQI0
	qhSRDSHHZV3n8vLPYau6N+LQ16CLuUKrv8sDhPZCwNbpMCtMI/a/m9q4Q==
X-ME-Sender: <xms:WgxqZQjdYvtkFmOnrZGhTZRlOhAH7Ockwra5_VmnOgoEpg-cQDSPYA>
    <xme:WgxqZZBoA9fCaKgaFOoWPNNYnpnaukHrIprwceWSus_tm49fD4dy0VjUMTJYKS7kc
    13oGH1Ie66Cv7m6_Og>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiledgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:WgxqZYE9hdgetETy7F7lELEk2ATIInlprLvr7cZKRxkP8PyHZIzr8g>
    <xmx:WgxqZRSCzLtX5L_pG9oFUP-ruARmv8IK1rMrsoErxbfVPESV5PgyJw>
    <xmx:WgxqZdwepTGKY7GsUvMADoPPqrKcT6Hs0qp-VjENNkGDkw3s2JUmzQ>
    <xmx:WgxqZTr_akoA1F9cnW6M8OPa20Q3s9JKEwsRSR5d_CAI7bEq705u8Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 06D16B6008F; Fri,  1 Dec 2023 11:39:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
MIME-Version: 1.0
Message-Id: <59b949a0-5aeb-4f01-8789-cb305513b626@app.fastmail.com>
In-Reply-To: <20231201160925.3136868-10-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-10-peter.griffin@linaro.org>
Date: Fri, 01 Dec 2023 17:39:33 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Griffin" <peter.griffin@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>,
 "Tomasz Figa" <tomasz.figa@gmail.com>,
 "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Olof Johansson" <olof@lixom.net>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Alim Akhtar" <alim.akhtar@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 "Sam Protsenko" <semen.protsenko@linaro.org>, saravanak@google.com,
 "William McVicker" <willmcvicker@google.com>, soc@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 09/20] dt-bindings: serial: samsung: Make samsung,uart-fifosize
 required property
Content-Type: text/plain

On Fri, Dec 1, 2023, at 17:09, Peter Griffin wrote:
> 
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - google,gs101-uart
> +    then:
> +      required:
> +        - samsung,uart-fifosize
> +

Is there a way to reverse the list and make the property
required for anything that is not explicitly enumerated?

      Arnd
