Return-Path: <SRS0=5O9Q=N6=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E692C2BD09
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 15:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA9A5C2BBFC; Fri, 28 Jun 2024 15:41:35 +0000 (UTC)
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 685AFC116B1;
	Fri, 28 Jun 2024 15:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 685AFC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 504DE11401F2;
	Fri, 28 Jun 2024 11:41:33 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 28 Jun 2024 11:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1719589293; x=1719675693; bh=/UoMdthz91
	zRtPMXEDeJIBKRINIwRVbOuY0793Aro/Y=; b=zjoZlmGWn2PhxoNpBrEUn7MBzE
	+5e0Ahz76qQluPnPsNQW5Ar0ry/ZxqfY79aD/R8cejzZ2rJX69ga/oE3jmxqwWD2
	zXNWMmmJPLfNj/zFmCQIFakCaxzqvY3SRJtREkMFLBjcUaGj/+eROpJno76kk9bG
	Juih0SHel0EQnDsWxFR2jdYcbgpcsFoS3SCUoauTxFGLFQJuouSelDl0l3cPESx4
	NEc0j6eGOS985+HQ/ayTFq78hqQh/RgHXN4pr01yzx7ZV8vstOc5Lag5aMa3QxRX
	4R/5xfYMBTDpv7g/czWKgXthqaKOmwzk3zhHqIoPSOJOocLO+zu+Uk4oH/pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719589293; x=1719675693; bh=/UoMdthz91zRtPMXEDeJIBKRINIw
	RVbOuY0793Aro/Y=; b=bR9x5GZt9t/XhWUFwRStbVKinrW4JzbQhKuemaNR3bq3
	61uWEaLyIhxZyZz4aAeH3PvfR5H1c1m/ahLtgT3/N+/0bEA+t9CNiuXmW2hNIfoj
	OdFw15hVptttpweVO97OZWjVDBnnfOKRVdf/sKPQQvIWmUlAH7mI5SrEg6BeeYc7
	nHUMmjqp5C/iE/FC8q08dIuHr26ks64HH1IoAm6SJxTXzsolONhG5SUnHp3FFNJs
	EfxJQKfMJWQgufVl2bOOoYvF6Fxs/lY9EQkxCQl3kpPujfUeTdl45CIGwxWlaJp0
	0zRnUSq9Pgw7ExRotR0YlvvMd89f9Bwdlr2B/6vI1w==
X-ME-Sender: <xms:rNl-ZjMZuMt8KOAwQg6mabC2LHjJ2gqBUjPrbyzBhxsMuT6ShBBwqw>
    <xme:rNl-Zt-oAOGwQtwTLSHg5OwoV20JMItQ27G64YKOanp5zW8tsr7r9w-F5NRGGPR3i
    p67s_pKMY9DPH5NShY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdejgdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:rNl-ZiSZ9GvDSWlZ7TR778HUwYWFewf21Xh6YgpD1JBYDaFC5jRVIg>
    <xmx:rNl-Znv4zmKJLL2luGZGEQPlf2a_Q9YrOZvFc6h7QVWFyV9YfJrXwg>
    <xmx:rNl-ZrcSBv2zhyQWbT_IAF20_FnnaqKGfS68aHUwkqzB-UIUvzot_Q>
    <xmx:rNl-Zj3-AKTcq7Sn1P-LCEmM7MPxMcgq2yIXe93DG5fvOltlTgqtsQ>
    <xmx:rdl-ZsHwAFA9V6v5JuoVfSfUopetAFo3bpEaf15_F122ZbSqKJ-U0zRr>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C01E3B6008F; Fri, 28 Jun 2024 11:41:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
MIME-Version: 1.0
Message-Id: <16a6ddb2-b749-42cb-9193-0d97dd1f95ad@app.fastmail.com>
In-Reply-To: <9bb7a807-358d-47ac-a4a8-674720bcf2a6@foss.st.com>
References: <9bb7a807-358d-47ac-a4a8-674720bcf2a6@foss.st.com>
Date: Fri, 28 Jun 2024 17:41:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Kevin Hilman" <khilman@baylibre.com>, "Olof Johansson" <olof@lixom.net>,
 arm <arm@kernel.org>, soc@kernel.org
Cc: "Raphael Gallais-Pou" <rgallaispou@gmail.com>
Subject: Re: [GIT PULL] STi DT changes for v6.11 #1
Content-Type: text/plain

On Fri, Jun 28, 2024, at 10:26, Patrice CHOTARD wrote:
> Hi ARM SoC maintainers,
>
> Please consider this first round of STi DT for v6.11 cycle
>
> Patrice
>
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
>
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>
> are available in the Git repository at:
>
>   
> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/pchotard/sti.git 
> sti-dt-for-v6.11-round1

I've pulled this from https://git.kernel.org/pub/scm/linux/kernel/git/pchotard/sti now, but please adjust your .gitconfig to have
an entry like this one to get the correct URL in the future:

[url "https://git.kernel.org"]
    insteadOf = git+ssh://gitolite@ra.kernel.org

> ----------------------------------------------------------------
> STi DT for v6.11 :
>
> _ Add #thermal-sensor-cells property on stih410.dtsi and stih418.dtsi
> _ Add thermal-zones support on stih418
> _

This is not a helpful text, it's just the same lines as the
individual patches. If you have nothing to add, you can as well
send the individual patches, otherwise maybe add a brief summary
that explains why you are working on this now -- e.g.
is this cleanup for existing code, new users wanting additional
features or something else?

    Arnd
